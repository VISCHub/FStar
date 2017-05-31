module FStar.Tactics.Logic

open FStar.Tactics.Effect
open FStar.Tactics.Builtins
open FStar.Tactics.Derived
open FStar.Reflection


private val revert_squash : (#a:Type) -> (#b : (a -> Type)) ->
                            (squash (forall (x:a). b x)) ->
                            PURE (x:a -> squash (b x)) (fun p -> forall x. p x)
let revert_squash #a #b s = admit()

let l_revert : tactic unit =
    revert;;
    apply (quote revert_squash)

let rec l_revert_all (bs:binders) : tactic unit =
    match bs with
    | [] -> return ()
    | _::tl -> l_revert;;
               l_revert_all tl

private val fa_intro_lem : (#a:Type) -> (#b : (a -> Type)) ->
                           (x:a -> squash (b x)) ->
                           squash (forall (x:a). b x)
let fa_intro_lem #a #b f = admit()

let forall_intro : tactic binder =
    egw <-- cur_goal;
    let (_, g), _ = egw in
    match term_as_formula g with
    | Forall _ _ -> (
        apply (quote fa_intro_lem);;
        intro)
    | _ ->
        fail "not a forall"

let forall_intros : tactic binders = repeat1 forall_intro

private val split_lem : (#a:Type) -> (#b:Type) ->
                        squash a -> squash b -> squash (a /\ b)
let split_lem #a #b sa sb = ()

let split : tactic unit =
    egw <-- cur_goal;
    let (_, g), _ = egw in
    match term_as_formula g with
    | And _ _ ->
        apply (quote split_lem)
    | _ ->
        fail "not a conjunction"

private val imp_intro_lem : (#a:Type) -> (#b : Type) ->
                            (a -> squash b) ->
                            squash (a ==> b)
let imp_intro_lem #a #b f = admit()

let implies_intro : tactic binder =
    egw <-- cur_goal;
    let (_, g), _ = egw in
    match term_as_formula g with
    | Implies _ _ -> (
        apply (quote imp_intro_lem);;
        b <-- intro;
        return b
        )
    | _ ->
        fail "not an implication"

let implies_intros : tactic binders = repeat1 implies_intro

let rec visit (callback:tactic unit) () : Tac unit =
    focus (or_else callback
                   (eg <-- cur_goal;
                    let (e, g), _ = eg in
                    match term_as_formula g with
                    | Forall b phi ->
                        binders <-- forall_intros;
                        seq (visit callback) (
                            l_revert_all binders
                        )
                    | And p q ->
                        seq split (
                            visit callback;;
                            return ()
                        )
                    | Implies p q ->
                        implies_intro;;
                        seq (visit callback)
                            l_revert
                    | _ ->
                        or_else trivial (smt ())
                   )
          ) ()

// Need to thunk it like to this for proper handling of non-termination.
// (not doing it would still work, because of issue #1017, but should not)
let rec simplify_eq_implication (u:unit) : Tac unit = (
    g <-- cur_goal;
    let (context, goal_t), _ = g in // G |- x=e ==> P
    r <-- destruct_equality_implication goal_t;
    match r with
    | None ->
        fail "Not an equality implication"
    | Some (_, rhs) ->
        eq_h <-- implies_intro; // G, eq_h:x=e |- P
        rewrite eq_h;; // G, eq_h:x=e |- P[e/x]
        clear;; // G |- P[e/x]
        visit simplify_eq_implication) ()

let rewrite_all_equalities : tactic unit =
    visit (simplify_eq_implication)

// See comment on `simplify_eq_implication`
let rec unfold_definition_and_simplify_eq' (tm:term) (u:unit) : Tac unit = (
    g <-- cur_goal;
    let (_, goal_t), _ = g in
    match term_as_formula goal_t with
    | App hd arg ->
        if term_eq hd tm
        then trivial
        else return ()
    | _ -> begin
        r <-- destruct_equality_implication goal_t;
        match r with
        | None -> fail "Not an equality implication"
        | Some (_, rhs) ->
            eq_h <-- implies_intro;
            rewrite eq_h;;
            clear;;
            visit (unfold_definition_and_simplify_eq' tm)
        end) ()

let unfold_definition_and_simplify_eq (tm:tactic term) : tactic unit =
    tm' <-- tm;
    unfold_definition_and_simplify_eq' tm'




private val vbind : (#p:Type) -> (#q:Type) -> squash p -> (p -> squash q) -> squash q
let vbind #p #q sq f = admit()

let unsquash (t:term) : tactic term =
    v <-- quote vbind;
    apply (return (mk_app v [t]));;
    b <-- intro;
    return (pack (Tv_Var b))


private val or_ind : (#p:Type) -> (#q:Type) -> (#phi:Type) ->
                     (p \/ q) ->
                     (squash (p ==> phi)) ->
                     (squash (q ==> phi)) ->
                     squash phi
let or_ind #p #q #phi o l r = ()

let cases_or (o:term) : tactic unit =
    oi <-- quote or_ind;
    apply (return (mk_app oi [o]))

private val bool_ind : (b:bool) -> (phi:Type) -> (squash (b == true  ==> phi)) ->
                                                 (squash (b == false ==> phi)) ->
                                                 squash phi
let bool_ind b phi l r = ()

let cases_bool (b:term) : tactic unit =
    bi <-- quote bool_ind;
    seq (apply (return (mk_app bi [b])))
        (trytac (b <-- implies_intro; rewrite b;; clear);; idtac)
