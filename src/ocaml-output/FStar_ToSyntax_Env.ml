open Prims
type local_binding =
  (FStar_Ident.ident,FStar_Syntax_Syntax.bv,Prims.bool)
    FStar_Pervasives_Native.tuple3[@@deriving show]
type rec_binding =
  (FStar_Ident.ident,FStar_Ident.lid,FStar_Syntax_Syntax.delta_depth)
    FStar_Pervasives_Native.tuple3[@@deriving show]
type module_abbrev =
  (FStar_Ident.ident,FStar_Ident.lident) FStar_Pervasives_Native.tuple2
[@@deriving show]
type open_kind =
  | Open_module
  | Open_namespace[@@deriving show]
let uu___is_Open_module: open_kind -> Prims.bool =
  fun projectee  ->
    match projectee with | Open_module  -> true | uu____20 -> false
let uu___is_Open_namespace: open_kind -> Prims.bool =
  fun projectee  ->
    match projectee with | Open_namespace  -> true | uu____24 -> false
type open_module_or_namespace =
  (FStar_Ident.lident,open_kind) FStar_Pervasives_Native.tuple2[@@deriving
                                                                 show]
type record_or_dc =
  {
  typename: FStar_Ident.lident;
  constrname: FStar_Ident.ident;
  parms: FStar_Syntax_Syntax.binders;
  fields:
    (FStar_Ident.ident,FStar_Syntax_Syntax.typ)
      FStar_Pervasives_Native.tuple2 Prims.list;
  is_private_or_abstract: Prims.bool;
  is_record: Prims.bool;}[@@deriving show]
let __proj__Mkrecord_or_dc__item__typename:
  record_or_dc -> FStar_Ident.lident =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__typename
let __proj__Mkrecord_or_dc__item__constrname:
  record_or_dc -> FStar_Ident.ident =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__constrname
let __proj__Mkrecord_or_dc__item__parms:
  record_or_dc -> FStar_Syntax_Syntax.binders =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__parms
let __proj__Mkrecord_or_dc__item__fields:
  record_or_dc ->
    (FStar_Ident.ident,FStar_Syntax_Syntax.typ)
      FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__fields
let __proj__Mkrecord_or_dc__item__is_private_or_abstract:
  record_or_dc -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__is_private_or_abstract
let __proj__Mkrecord_or_dc__item__is_record: record_or_dc -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { typename = __fname__typename; constrname = __fname__constrname;
        parms = __fname__parms; fields = __fname__fields;
        is_private_or_abstract = __fname__is_private_or_abstract;
        is_record = __fname__is_record;_} -> __fname__is_record
type scope_mod =
  | Local_binding of local_binding
  | Rec_binding of rec_binding
  | Module_abbrev of module_abbrev
  | Open_module_or_namespace of open_module_or_namespace
  | Top_level_def of FStar_Ident.ident
  | Record_or_dc of record_or_dc[@@deriving show]
let uu___is_Local_binding: scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Local_binding _0 -> true | uu____189 -> false
let __proj__Local_binding__item___0: scope_mod -> local_binding =
  fun projectee  -> match projectee with | Local_binding _0 -> _0
let uu___is_Rec_binding: scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Rec_binding _0 -> true | uu____201 -> false
let __proj__Rec_binding__item___0: scope_mod -> rec_binding =
  fun projectee  -> match projectee with | Rec_binding _0 -> _0
let uu___is_Module_abbrev: scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Module_abbrev _0 -> true | uu____213 -> false
let __proj__Module_abbrev__item___0: scope_mod -> module_abbrev =
  fun projectee  -> match projectee with | Module_abbrev _0 -> _0
let uu___is_Open_module_or_namespace: scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with
    | Open_module_or_namespace _0 -> true
    | uu____225 -> false
let __proj__Open_module_or_namespace__item___0:
  scope_mod -> open_module_or_namespace =
  fun projectee  -> match projectee with | Open_module_or_namespace _0 -> _0
let uu___is_Top_level_def: scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Top_level_def _0 -> true | uu____237 -> false
let __proj__Top_level_def__item___0: scope_mod -> FStar_Ident.ident =
  fun projectee  -> match projectee with | Top_level_def _0 -> _0
let uu___is_Record_or_dc: scope_mod -> Prims.bool =
  fun projectee  ->
    match projectee with | Record_or_dc _0 -> true | uu____249 -> false
let __proj__Record_or_dc__item___0: scope_mod -> record_or_dc =
  fun projectee  -> match projectee with | Record_or_dc _0 -> _0
type string_set = Prims.string FStar_Util.set[@@deriving show]
type exported_id_kind =
  | Exported_id_term_type
  | Exported_id_field[@@deriving show]
let uu___is_Exported_id_term_type: exported_id_kind -> Prims.bool =
  fun projectee  ->
    match projectee with
    | Exported_id_term_type  -> true
    | uu____262 -> false
let uu___is_Exported_id_field: exported_id_kind -> Prims.bool =
  fun projectee  ->
    match projectee with | Exported_id_field  -> true | uu____266 -> false
type exported_id_set = exported_id_kind -> string_set FStar_ST.ref[@@deriving
                                                                    show]
type env =
  {
  curmodule: FStar_Ident.lident FStar_Pervasives_Native.option;
  curmonad: FStar_Ident.ident FStar_Pervasives_Native.option;
  modules:
    (FStar_Ident.lident,FStar_Syntax_Syntax.modul)
      FStar_Pervasives_Native.tuple2 Prims.list;
  scope_mods: scope_mod Prims.list;
  exported_ids: exported_id_set FStar_Util.smap;
  trans_exported_ids: exported_id_set FStar_Util.smap;
  includes: FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap;
  sigaccum: FStar_Syntax_Syntax.sigelts;
  sigmap:
    (FStar_Syntax_Syntax.sigelt,Prims.bool) FStar_Pervasives_Native.tuple2
      FStar_Util.smap;
  iface: Prims.bool;
  admitted_iface: Prims.bool;
  expect_typ: Prims.bool;
  docs: FStar_Parser_AST.fsdoc FStar_Util.smap;
  remaining_iface_decls:
    (FStar_Ident.lident,FStar_Parser_AST.decl Prims.list)
      FStar_Pervasives_Native.tuple2 Prims.list;
  syntax_only: Prims.bool;
  ds_hooks: dsenv_hooks;}[@@deriving show]
and dsenv_hooks =
  {
  ds_push_open_hook: env -> open_module_or_namespace -> Prims.unit;
  ds_push_include_hook: env -> FStar_Ident.lident -> Prims.unit;
  ds_push_module_abbrev_hook:
    env -> FStar_Ident.ident -> FStar_Ident.lident -> Prims.unit;}[@@deriving
                                                                    show]
let __proj__Mkenv__item__curmodule:
  env -> FStar_Ident.lident FStar_Pervasives_Native.option =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__curmodule
let __proj__Mkenv__item__curmonad:
  env -> FStar_Ident.ident FStar_Pervasives_Native.option =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__curmonad
let __proj__Mkenv__item__modules:
  env ->
    (FStar_Ident.lident,FStar_Syntax_Syntax.modul)
      FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__modules
let __proj__Mkenv__item__scope_mods: env -> scope_mod Prims.list =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__scope_mods
let __proj__Mkenv__item__exported_ids: env -> exported_id_set FStar_Util.smap
  =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__exported_ids
let __proj__Mkenv__item__trans_exported_ids:
  env -> exported_id_set FStar_Util.smap =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__trans_exported_ids
let __proj__Mkenv__item__includes:
  env -> FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__includes
let __proj__Mkenv__item__sigaccum: env -> FStar_Syntax_Syntax.sigelts =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__sigaccum
let __proj__Mkenv__item__sigmap:
  env ->
    (FStar_Syntax_Syntax.sigelt,Prims.bool) FStar_Pervasives_Native.tuple2
      FStar_Util.smap
  =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__sigmap
let __proj__Mkenv__item__iface: env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__iface
let __proj__Mkenv__item__admitted_iface: env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__admitted_iface
let __proj__Mkenv__item__expect_typ: env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__expect_typ
let __proj__Mkenv__item__docs: env -> FStar_Parser_AST.fsdoc FStar_Util.smap
  =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__docs
let __proj__Mkenv__item__remaining_iface_decls:
  env ->
    (FStar_Ident.lident,FStar_Parser_AST.decl Prims.list)
      FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__remaining_iface_decls
let __proj__Mkenv__item__syntax_only: env -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__syntax_only
let __proj__Mkenv__item__ds_hooks: env -> dsenv_hooks =
  fun projectee  ->
    match projectee with
    | { curmodule = __fname__curmodule; curmonad = __fname__curmonad;
        modules = __fname__modules; scope_mods = __fname__scope_mods;
        exported_ids = __fname__exported_ids;
        trans_exported_ids = __fname__trans_exported_ids;
        includes = __fname__includes; sigaccum = __fname__sigaccum;
        sigmap = __fname__sigmap; iface = __fname__iface;
        admitted_iface = __fname__admitted_iface;
        expect_typ = __fname__expect_typ; docs = __fname__docs;
        remaining_iface_decls = __fname__remaining_iface_decls;
        syntax_only = __fname__syntax_only; ds_hooks = __fname__ds_hooks;_}
        -> __fname__ds_hooks
let __proj__Mkdsenv_hooks__item__ds_push_open_hook:
  dsenv_hooks -> env -> open_module_or_namespace -> Prims.unit =
  fun projectee  ->
    match projectee with
    | { ds_push_open_hook = __fname__ds_push_open_hook;
        ds_push_include_hook = __fname__ds_push_include_hook;
        ds_push_module_abbrev_hook = __fname__ds_push_module_abbrev_hook;_}
        -> __fname__ds_push_open_hook
let __proj__Mkdsenv_hooks__item__ds_push_include_hook:
  dsenv_hooks -> env -> FStar_Ident.lident -> Prims.unit =
  fun projectee  ->
    match projectee with
    | { ds_push_open_hook = __fname__ds_push_open_hook;
        ds_push_include_hook = __fname__ds_push_include_hook;
        ds_push_module_abbrev_hook = __fname__ds_push_module_abbrev_hook;_}
        -> __fname__ds_push_include_hook
let __proj__Mkdsenv_hooks__item__ds_push_module_abbrev_hook:
  dsenv_hooks -> env -> FStar_Ident.ident -> FStar_Ident.lident -> Prims.unit
  =
  fun projectee  ->
    match projectee with
    | { ds_push_open_hook = __fname__ds_push_open_hook;
        ds_push_include_hook = __fname__ds_push_include_hook;
        ds_push_module_abbrev_hook = __fname__ds_push_module_abbrev_hook;_}
        -> __fname__ds_push_module_abbrev_hook
type 'a withenv = env -> ('a,env) FStar_Pervasives_Native.tuple2[@@deriving
                                                                  show]
let default_ds_hooks: dsenv_hooks =
  {
    ds_push_open_hook = (fun uu____1523  -> fun uu____1524  -> ());
    ds_push_include_hook = (fun uu____1527  -> fun uu____1528  -> ());
    ds_push_module_abbrev_hook =
      (fun uu____1532  -> fun uu____1533  -> fun uu____1534  -> ())
  }
type foundname =
  | Term_name of (FStar_Syntax_Syntax.typ,Prims.bool)
  FStar_Pervasives_Native.tuple2
  | Eff_name of (FStar_Syntax_Syntax.sigelt,FStar_Ident.lident)
  FStar_Pervasives_Native.tuple2[@@deriving show]
let uu___is_Term_name: foundname -> Prims.bool =
  fun projectee  ->
    match projectee with | Term_name _0 -> true | uu____1559 -> false
let __proj__Term_name__item___0:
  foundname ->
    (FStar_Syntax_Syntax.typ,Prims.bool) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | Term_name _0 -> _0
let uu___is_Eff_name: foundname -> Prims.bool =
  fun projectee  ->
    match projectee with | Eff_name _0 -> true | uu____1587 -> false
let __proj__Eff_name__item___0:
  foundname ->
    (FStar_Syntax_Syntax.sigelt,FStar_Ident.lident)
      FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | Eff_name _0 -> _0
let set_iface: env -> Prims.bool -> env =
  fun env  ->
    fun b  ->
      let uu___186_1613 = env in
      {
        curmodule = (uu___186_1613.curmodule);
        curmonad = (uu___186_1613.curmonad);
        modules = (uu___186_1613.modules);
        scope_mods = (uu___186_1613.scope_mods);
        exported_ids = (uu___186_1613.exported_ids);
        trans_exported_ids = (uu___186_1613.trans_exported_ids);
        includes = (uu___186_1613.includes);
        sigaccum = (uu___186_1613.sigaccum);
        sigmap = (uu___186_1613.sigmap);
        iface = b;
        admitted_iface = (uu___186_1613.admitted_iface);
        expect_typ = (uu___186_1613.expect_typ);
        docs = (uu___186_1613.docs);
        remaining_iface_decls = (uu___186_1613.remaining_iface_decls);
        syntax_only = (uu___186_1613.syntax_only);
        ds_hooks = (uu___186_1613.ds_hooks)
      }
let iface: env -> Prims.bool = fun e  -> e.iface
let set_admitted_iface: env -> Prims.bool -> env =
  fun e  ->
    fun b  ->
      let uu___187_1623 = e in
      {
        curmodule = (uu___187_1623.curmodule);
        curmonad = (uu___187_1623.curmonad);
        modules = (uu___187_1623.modules);
        scope_mods = (uu___187_1623.scope_mods);
        exported_ids = (uu___187_1623.exported_ids);
        trans_exported_ids = (uu___187_1623.trans_exported_ids);
        includes = (uu___187_1623.includes);
        sigaccum = (uu___187_1623.sigaccum);
        sigmap = (uu___187_1623.sigmap);
        iface = (uu___187_1623.iface);
        admitted_iface = b;
        expect_typ = (uu___187_1623.expect_typ);
        docs = (uu___187_1623.docs);
        remaining_iface_decls = (uu___187_1623.remaining_iface_decls);
        syntax_only = (uu___187_1623.syntax_only);
        ds_hooks = (uu___187_1623.ds_hooks)
      }
let admitted_iface: env -> Prims.bool = fun e  -> e.admitted_iface
let set_expect_typ: env -> Prims.bool -> env =
  fun e  ->
    fun b  ->
      let uu___188_1633 = e in
      {
        curmodule = (uu___188_1633.curmodule);
        curmonad = (uu___188_1633.curmonad);
        modules = (uu___188_1633.modules);
        scope_mods = (uu___188_1633.scope_mods);
        exported_ids = (uu___188_1633.exported_ids);
        trans_exported_ids = (uu___188_1633.trans_exported_ids);
        includes = (uu___188_1633.includes);
        sigaccum = (uu___188_1633.sigaccum);
        sigmap = (uu___188_1633.sigmap);
        iface = (uu___188_1633.iface);
        admitted_iface = (uu___188_1633.admitted_iface);
        expect_typ = b;
        docs = (uu___188_1633.docs);
        remaining_iface_decls = (uu___188_1633.remaining_iface_decls);
        syntax_only = (uu___188_1633.syntax_only);
        ds_hooks = (uu___188_1633.ds_hooks)
      }
let expect_typ: env -> Prims.bool = fun e  -> e.expect_typ
let all_exported_id_kinds: exported_id_kind Prims.list =
  [Exported_id_field; Exported_id_term_type]
let transitive_exported_ids:
  env -> FStar_Ident.lident -> Prims.string Prims.list =
  fun env  ->
    fun lid  ->
      let module_name = FStar_Ident.string_of_lid lid in
      let uu____1648 =
        FStar_Util.smap_try_find env.trans_exported_ids module_name in
      match uu____1648 with
      | FStar_Pervasives_Native.None  -> []
      | FStar_Pervasives_Native.Some exported_id_set ->
          let uu____1654 =
            let uu____1655 = exported_id_set Exported_id_term_type in
            FStar_ST.op_Bang uu____1655 in
          FStar_All.pipe_right uu____1654 FStar_Util.set_elements
let open_modules:
  env ->
    (FStar_Ident.lident,FStar_Syntax_Syntax.modul)
      FStar_Pervasives_Native.tuple2 Prims.list
  = fun e  -> e.modules
let open_modules_and_namespaces: env -> FStar_Ident.lident Prims.list =
  fun env  ->
    FStar_List.filter_map
      (fun uu___154_1922  ->
         match uu___154_1922 with
         | Open_module_or_namespace (lid,_info) ->
             FStar_Pervasives_Native.Some lid
         | uu____1927 -> FStar_Pervasives_Native.None) env.scope_mods
let set_current_module: env -> FStar_Ident.lident -> env =
  fun e  ->
    fun l  ->
      let uu___189_1934 = e in
      {
        curmodule = (FStar_Pervasives_Native.Some l);
        curmonad = (uu___189_1934.curmonad);
        modules = (uu___189_1934.modules);
        scope_mods = (uu___189_1934.scope_mods);
        exported_ids = (uu___189_1934.exported_ids);
        trans_exported_ids = (uu___189_1934.trans_exported_ids);
        includes = (uu___189_1934.includes);
        sigaccum = (uu___189_1934.sigaccum);
        sigmap = (uu___189_1934.sigmap);
        iface = (uu___189_1934.iface);
        admitted_iface = (uu___189_1934.admitted_iface);
        expect_typ = (uu___189_1934.expect_typ);
        docs = (uu___189_1934.docs);
        remaining_iface_decls = (uu___189_1934.remaining_iface_decls);
        syntax_only = (uu___189_1934.syntax_only);
        ds_hooks = (uu___189_1934.ds_hooks)
      }
let current_module: env -> FStar_Ident.lident =
  fun env  ->
    match env.curmodule with
    | FStar_Pervasives_Native.None  -> failwith "Unset current module"
    | FStar_Pervasives_Native.Some m -> m
let iface_decls:
  env ->
    FStar_Ident.lident ->
      FStar_Parser_AST.decl Prims.list FStar_Pervasives_Native.option
  =
  fun env  ->
    fun l  ->
      let uu____1949 =
        FStar_All.pipe_right env.remaining_iface_decls
          (FStar_List.tryFind
             (fun uu____1983  ->
                match uu____1983 with
                | (m,uu____1991) -> FStar_Ident.lid_equals l m)) in
      match uu____1949 with
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some (uu____2008,decls) ->
          FStar_Pervasives_Native.Some decls
let set_iface_decls:
  env -> FStar_Ident.lident -> FStar_Parser_AST.decl Prims.list -> env =
  fun env  ->
    fun l  ->
      fun ds  ->
        let uu____2035 =
          FStar_List.partition
            (fun uu____2065  ->
               match uu____2065 with
               | (m,uu____2073) -> FStar_Ident.lid_equals l m)
            env.remaining_iface_decls in
        match uu____2035 with
        | (uu____2078,rest) ->
            let uu___190_2112 = env in
            {
              curmodule = (uu___190_2112.curmodule);
              curmonad = (uu___190_2112.curmonad);
              modules = (uu___190_2112.modules);
              scope_mods = (uu___190_2112.scope_mods);
              exported_ids = (uu___190_2112.exported_ids);
              trans_exported_ids = (uu___190_2112.trans_exported_ids);
              includes = (uu___190_2112.includes);
              sigaccum = (uu___190_2112.sigaccum);
              sigmap = (uu___190_2112.sigmap);
              iface = (uu___190_2112.iface);
              admitted_iface = (uu___190_2112.admitted_iface);
              expect_typ = (uu___190_2112.expect_typ);
              docs = (uu___190_2112.docs);
              remaining_iface_decls = ((l, ds) :: rest);
              syntax_only = (uu___190_2112.syntax_only);
              ds_hooks = (uu___190_2112.ds_hooks)
            }
let qual: FStar_Ident.lident -> FStar_Ident.ident -> FStar_Ident.lident =
  FStar_Syntax_Util.qual_id
let qualify: env -> FStar_Ident.ident -> FStar_Ident.lident =
  fun env  ->
    fun id1  ->
      match env.curmonad with
      | FStar_Pervasives_Native.None  ->
          let uu____2131 = current_module env in qual uu____2131 id1
      | FStar_Pervasives_Native.Some monad ->
          let uu____2133 =
            let uu____2134 = current_module env in qual uu____2134 monad in
          FStar_Syntax_Util.mk_field_projector_name_from_ident uu____2133 id1
let syntax_only: env -> Prims.bool = fun env  -> env.syntax_only
let set_syntax_only: env -> Prims.bool -> env =
  fun env  ->
    fun b  ->
      let uu___191_2144 = env in
      {
        curmodule = (uu___191_2144.curmodule);
        curmonad = (uu___191_2144.curmonad);
        modules = (uu___191_2144.modules);
        scope_mods = (uu___191_2144.scope_mods);
        exported_ids = (uu___191_2144.exported_ids);
        trans_exported_ids = (uu___191_2144.trans_exported_ids);
        includes = (uu___191_2144.includes);
        sigaccum = (uu___191_2144.sigaccum);
        sigmap = (uu___191_2144.sigmap);
        iface = (uu___191_2144.iface);
        admitted_iface = (uu___191_2144.admitted_iface);
        expect_typ = (uu___191_2144.expect_typ);
        docs = (uu___191_2144.docs);
        remaining_iface_decls = (uu___191_2144.remaining_iface_decls);
        syntax_only = b;
        ds_hooks = (uu___191_2144.ds_hooks)
      }
let ds_hooks: env -> dsenv_hooks = fun env  -> env.ds_hooks
let set_ds_hooks: env -> dsenv_hooks -> env =
  fun env  ->
    fun hooks  ->
      let uu___192_2154 = env in
      {
        curmodule = (uu___192_2154.curmodule);
        curmonad = (uu___192_2154.curmonad);
        modules = (uu___192_2154.modules);
        scope_mods = (uu___192_2154.scope_mods);
        exported_ids = (uu___192_2154.exported_ids);
        trans_exported_ids = (uu___192_2154.trans_exported_ids);
        includes = (uu___192_2154.includes);
        sigaccum = (uu___192_2154.sigaccum);
        sigmap = (uu___192_2154.sigmap);
        iface = (uu___192_2154.iface);
        admitted_iface = (uu___192_2154.admitted_iface);
        expect_typ = (uu___192_2154.expect_typ);
        docs = (uu___192_2154.docs);
        remaining_iface_decls = (uu___192_2154.remaining_iface_decls);
        syntax_only = (uu___192_2154.syntax_only);
        ds_hooks = hooks
      }
let new_sigmap: 'Auu____2157 . Prims.unit -> 'Auu____2157 FStar_Util.smap =
  fun uu____2163  -> FStar_Util.smap_create (Prims.parse_int "100")
let empty_env: Prims.unit -> env =
  fun uu____2166  ->
    let uu____2167 = new_sigmap () in
    let uu____2170 = new_sigmap () in
    let uu____2173 = new_sigmap () in
    let uu____2184 = new_sigmap () in
    let uu____2195 = new_sigmap () in
    {
      curmodule = FStar_Pervasives_Native.None;
      curmonad = FStar_Pervasives_Native.None;
      modules = [];
      scope_mods = [];
      exported_ids = uu____2167;
      trans_exported_ids = uu____2170;
      includes = uu____2173;
      sigaccum = [];
      sigmap = uu____2184;
      iface = false;
      admitted_iface = false;
      expect_typ = false;
      docs = uu____2195;
      remaining_iface_decls = [];
      syntax_only = false;
      ds_hooks = default_ds_hooks
    }
let sigmap:
  env ->
    (FStar_Syntax_Syntax.sigelt,Prims.bool) FStar_Pervasives_Native.tuple2
      FStar_Util.smap
  = fun env  -> env.sigmap
let has_all_in_scope: env -> Prims.bool =
  fun env  ->
    FStar_List.existsb
      (fun uu____2227  ->
         match uu____2227 with
         | (m,uu____2233) ->
             FStar_Ident.lid_equals m FStar_Parser_Const.all_lid) env.modules
let set_bv_range:
  FStar_Syntax_Syntax.bv -> FStar_Range.range -> FStar_Syntax_Syntax.bv =
  fun bv  ->
    fun r  ->
      let id1 =
        let uu___193_2241 = bv.FStar_Syntax_Syntax.ppname in
        {
          FStar_Ident.idText = (uu___193_2241.FStar_Ident.idText);
          FStar_Ident.idRange = r
        } in
      let uu___194_2242 = bv in
      {
        FStar_Syntax_Syntax.ppname = id1;
        FStar_Syntax_Syntax.index = (uu___194_2242.FStar_Syntax_Syntax.index);
        FStar_Syntax_Syntax.sort = (uu___194_2242.FStar_Syntax_Syntax.sort)
      }
let bv_to_name:
  FStar_Syntax_Syntax.bv -> FStar_Range.range -> FStar_Syntax_Syntax.term =
  fun bv  -> fun r  -> FStar_Syntax_Syntax.bv_to_name (set_bv_range bv r)
let unmangleMap:
  (Prims.string,Prims.string,FStar_Syntax_Syntax.delta_depth,FStar_Syntax_Syntax.fv_qual
                                                               FStar_Pervasives_Native.option)
    FStar_Pervasives_Native.tuple4 Prims.list
  =
  [("op_ColonColon", "Cons", FStar_Syntax_Syntax.Delta_constant,
     (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor));
  ("not", "op_Negation", FStar_Syntax_Syntax.Delta_equational,
    FStar_Pervasives_Native.None)]
let unmangleOpName:
  FStar_Ident.ident ->
    (FStar_Syntax_Syntax.term,Prims.bool) FStar_Pervasives_Native.tuple2
      FStar_Pervasives_Native.option
  =
  fun id1  ->
    let t =
      FStar_Util.find_map unmangleMap
        (fun uu____2329  ->
           match uu____2329 with
           | (x,y,dd,dq) ->
               if id1.FStar_Ident.idText = x
               then
                 let uu____2352 =
                   let uu____2353 =
                     FStar_Ident.lid_of_path ["Prims"; y]
                       id1.FStar_Ident.idRange in
                   FStar_Syntax_Syntax.fvar uu____2353 dd dq in
                 FStar_Pervasives_Native.Some uu____2352
               else FStar_Pervasives_Native.None) in
    match t with
    | FStar_Pervasives_Native.Some v1 ->
        FStar_Pervasives_Native.Some (v1, false)
    | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
type 'a cont_t =
  | Cont_ok of 'a
  | Cont_fail
  | Cont_ignore[@@deriving show]
let uu___is_Cont_ok: 'a . 'a cont_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Cont_ok _0 -> true | uu____2396 -> false
let __proj__Cont_ok__item___0: 'a . 'a cont_t -> 'a =
  fun projectee  -> match projectee with | Cont_ok _0 -> _0
let uu___is_Cont_fail: 'a . 'a cont_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Cont_fail  -> true | uu____2425 -> false
let uu___is_Cont_ignore: 'a . 'a cont_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Cont_ignore  -> true | uu____2439 -> false
let option_of_cont:
  'a .
    (Prims.unit -> 'a FStar_Pervasives_Native.option) ->
      'a cont_t -> 'a FStar_Pervasives_Native.option
  =
  fun k_ignore  ->
    fun uu___155_2462  ->
      match uu___155_2462 with
      | Cont_ok a -> FStar_Pervasives_Native.Some a
      | Cont_fail  -> FStar_Pervasives_Native.None
      | Cont_ignore  -> k_ignore ()
let find_in_record:
  'Auu____2475 .
    FStar_Ident.ident Prims.list ->
      FStar_Ident.ident ->
        record_or_dc ->
          (record_or_dc -> 'Auu____2475 cont_t) -> 'Auu____2475 cont_t
  =
  fun ns  ->
    fun id1  ->
      fun record  ->
        fun cont  ->
          let typename' =
            FStar_Ident.lid_of_ids
              (FStar_List.append ns [(record.typename).FStar_Ident.ident]) in
          if FStar_Ident.lid_equals typename' record.typename
          then
            let fname =
              FStar_Ident.lid_of_ids
                (FStar_List.append (record.typename).FStar_Ident.ns [id1]) in
            let find1 =
              FStar_Util.find_map record.fields
                (fun uu____2521  ->
                   match uu____2521 with
                   | (f,uu____2529) ->
                       if id1.FStar_Ident.idText = f.FStar_Ident.idText
                       then FStar_Pervasives_Native.Some record
                       else FStar_Pervasives_Native.None) in
            match find1 with
            | FStar_Pervasives_Native.Some r -> cont r
            | FStar_Pervasives_Native.None  -> Cont_ignore
          else Cont_ignore
let get_exported_id_set:
  env ->
    Prims.string ->
      (exported_id_kind -> string_set FStar_ST.ref)
        FStar_Pervasives_Native.option
  = fun e  -> fun mname  -> FStar_Util.smap_try_find e.exported_ids mname
let get_trans_exported_id_set:
  env ->
    Prims.string ->
      (exported_id_kind -> string_set FStar_ST.ref)
        FStar_Pervasives_Native.option
  =
  fun e  -> fun mname  -> FStar_Util.smap_try_find e.trans_exported_ids mname
let string_of_exported_id_kind: exported_id_kind -> Prims.string =
  fun uu___156_2575  ->
    match uu___156_2575 with
    | Exported_id_field  -> "field"
    | Exported_id_term_type  -> "term/type"
let find_in_module_with_includes:
  'a .
    exported_id_kind ->
      (FStar_Ident.lident -> 'a cont_t) ->
        'a cont_t ->
          env -> FStar_Ident.lident -> FStar_Ident.ident -> 'a cont_t
  =
  fun eikind  ->
    fun find_in_module  ->
      fun find_in_module_default  ->
        fun env  ->
          fun ns  ->
            fun id1  ->
              let idstr = id1.FStar_Ident.idText in
              let rec aux uu___157_2631 =
                match uu___157_2631 with
                | [] -> find_in_module_default
                | modul::q ->
                    let mname = modul.FStar_Ident.str in
                    let not_shadowed =
                      let uu____2642 = get_exported_id_set env mname in
                      match uu____2642 with
                      | FStar_Pervasives_Native.None  -> true
                      | FStar_Pervasives_Native.Some mex ->
                          let mexports =
                            let uu____2663 = mex eikind in
                            FStar_ST.op_Bang uu____2663 in
                          FStar_Util.set_mem idstr mexports in
                    let mincludes =
                      let uu____2914 =
                        FStar_Util.smap_try_find env.includes mname in
                      match uu____2914 with
                      | FStar_Pervasives_Native.None  -> []
                      | FStar_Pervasives_Native.Some minc ->
                          FStar_ST.op_Bang minc in
                    let look_into =
                      if not_shadowed
                      then
                        let uu____3011 = qual modul id1 in
                        find_in_module uu____3011
                      else Cont_ignore in
                    (match look_into with
                     | Cont_ignore  -> aux (FStar_List.append mincludes q)
                     | uu____3015 -> look_into) in
              aux [ns]
let is_exported_id_field: exported_id_kind -> Prims.bool =
  fun uu___158_3020  ->
    match uu___158_3020 with
    | Exported_id_field  -> true
    | uu____3021 -> false
let try_lookup_id'':
  'a .
    env ->
      FStar_Ident.ident ->
        exported_id_kind ->
          (local_binding -> 'a cont_t) ->
            (rec_binding -> 'a cont_t) ->
              (record_or_dc -> 'a cont_t) ->
                (FStar_Ident.lident -> 'a cont_t) ->
                  ('a cont_t -> FStar_Ident.ident -> 'a cont_t) ->
                    'a FStar_Pervasives_Native.option
  =
  fun env  ->
    fun id1  ->
      fun eikind  ->
        fun k_local_binding  ->
          fun k_rec_binding  ->
            fun k_record  ->
              fun find_in_module  ->
                fun lookup_default_id  ->
                  let check_local_binding_id uu___159_3123 =
                    match uu___159_3123 with
                    | (id',uu____3125,uu____3126) ->
                        id'.FStar_Ident.idText = id1.FStar_Ident.idText in
                  let check_rec_binding_id uu___160_3130 =
                    match uu___160_3130 with
                    | (id',uu____3132,uu____3133) ->
                        id'.FStar_Ident.idText = id1.FStar_Ident.idText in
                  let curmod_ns =
                    let uu____3137 = current_module env in
                    FStar_Ident.ids_of_lid uu____3137 in
                  let proc uu___161_3143 =
                    match uu___161_3143 with
                    | Local_binding l when check_local_binding_id l ->
                        k_local_binding l
                    | Rec_binding r when check_rec_binding_id r ->
                        k_rec_binding r
                    | Open_module_or_namespace (ns,Open_module ) ->
                        find_in_module_with_includes eikind find_in_module
                          Cont_ignore env ns id1
                    | Top_level_def id' when
                        id'.FStar_Ident.idText = id1.FStar_Ident.idText ->
                        lookup_default_id Cont_ignore id1
                    | Record_or_dc r when is_exported_id_field eikind ->
                        let uu____3151 = FStar_Ident.lid_of_ids curmod_ns in
                        find_in_module_with_includes Exported_id_field
                          (fun lid  ->
                             let id2 = lid.FStar_Ident.ident in
                             find_in_record lid.FStar_Ident.ns id2 r k_record)
                          Cont_ignore env uu____3151 id1
                    | uu____3156 -> Cont_ignore in
                  let rec aux uu___162_3164 =
                    match uu___162_3164 with
                    | a::q ->
                        let uu____3173 = proc a in
                        option_of_cont (fun uu____3177  -> aux q) uu____3173
                    | [] ->
                        let uu____3178 = lookup_default_id Cont_fail id1 in
                        option_of_cont
                          (fun uu____3182  -> FStar_Pervasives_Native.None)
                          uu____3178 in
                  aux env.scope_mods
let found_local_binding:
  'Auu____3187 'Auu____3188 .
    FStar_Range.range ->
      ('Auu____3188,FStar_Syntax_Syntax.bv,'Auu____3187)
        FStar_Pervasives_Native.tuple3 ->
        (FStar_Syntax_Syntax.term,'Auu____3187)
          FStar_Pervasives_Native.tuple2
  =
  fun r  ->
    fun uu____3206  ->
      match uu____3206 with
      | (id',x,mut) -> let uu____3216 = bv_to_name x r in (uu____3216, mut)
let find_in_module:
  'Auu____3222 .
    env ->
      FStar_Ident.lident ->
        (FStar_Ident.lident ->
           (FStar_Syntax_Syntax.sigelt,Prims.bool)
             FStar_Pervasives_Native.tuple2 -> 'Auu____3222)
          -> 'Auu____3222 -> 'Auu____3222
  =
  fun env  ->
    fun lid  ->
      fun k_global_def  ->
        fun k_not_found  ->
          let uu____3257 =
            FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str in
          match uu____3257 with
          | FStar_Pervasives_Native.Some sb -> k_global_def lid sb
          | FStar_Pervasives_Native.None  -> k_not_found
let try_lookup_id:
  env ->
    FStar_Ident.ident ->
      (FStar_Syntax_Syntax.term,Prims.bool) FStar_Pervasives_Native.tuple2
        FStar_Pervasives_Native.option
  =
  fun env  ->
    fun id1  ->
      let uu____3293 = unmangleOpName id1 in
      match uu____3293 with
      | FStar_Pervasives_Native.Some f -> FStar_Pervasives_Native.Some f
      | uu____3319 ->
          try_lookup_id'' env id1 Exported_id_term_type
            (fun r  ->
               let uu____3333 = found_local_binding id1.FStar_Ident.idRange r in
               Cont_ok uu____3333) (fun uu____3343  -> Cont_fail)
            (fun uu____3349  -> Cont_ignore)
            (fun i  ->
               find_in_module env i
                 (fun uu____3364  -> fun uu____3365  -> Cont_fail)
                 Cont_ignore)
            (fun uu____3380  -> fun uu____3381  -> Cont_fail)
let lookup_default_id:
  'a .
    env ->
      FStar_Ident.ident ->
        (FStar_Ident.lident ->
           (FStar_Syntax_Syntax.sigelt,Prims.bool)
             FStar_Pervasives_Native.tuple2 -> 'a cont_t)
          -> 'a cont_t -> 'a cont_t
  =
  fun env  ->
    fun id1  ->
      fun k_global_def  ->
        fun k_not_found  ->
          let find_in_monad =
            match env.curmonad with
            | FStar_Pervasives_Native.Some uu____3451 ->
                let lid = qualify env id1 in
                let uu____3453 =
                  FStar_Util.smap_try_find (sigmap env) lid.FStar_Ident.str in
                (match uu____3453 with
                 | FStar_Pervasives_Native.Some r ->
                     let uu____3477 = k_global_def lid r in
                     FStar_Pervasives_Native.Some uu____3477
                 | FStar_Pervasives_Native.None  ->
                     FStar_Pervasives_Native.None)
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None in
          match find_in_monad with
          | FStar_Pervasives_Native.Some v1 -> v1
          | FStar_Pervasives_Native.None  ->
              let lid =
                let uu____3500 = current_module env in qual uu____3500 id1 in
              find_in_module env lid k_global_def k_not_found
let module_is_defined: env -> FStar_Ident.lident -> Prims.bool =
  fun env  ->
    fun lid  ->
      (match env.curmodule with
       | FStar_Pervasives_Native.None  -> false
       | FStar_Pervasives_Native.Some m ->
           let uu____3510 = current_module env in
           FStar_Ident.lid_equals lid uu____3510)
        ||
        (FStar_List.existsb
           (fun x  ->
              FStar_Ident.lid_equals lid (FStar_Pervasives_Native.fst x))
           env.modules)
let resolve_module_name:
  env ->
    FStar_Ident.lident ->
      Prims.bool -> FStar_Ident.lident FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      fun honor_ns  ->
        let nslen = FStar_List.length lid.FStar_Ident.ns in
        let rec aux uu___163_3542 =
          match uu___163_3542 with
          | [] ->
              let uu____3547 = module_is_defined env lid in
              if uu____3547
              then FStar_Pervasives_Native.Some lid
              else FStar_Pervasives_Native.None
          | (Open_module_or_namespace (ns,Open_namespace ))::q when honor_ns
              ->
              let new_lid =
                let uu____3556 =
                  let uu____3559 = FStar_Ident.path_of_lid ns in
                  let uu____3562 = FStar_Ident.path_of_lid lid in
                  FStar_List.append uu____3559 uu____3562 in
                FStar_Ident.lid_of_path uu____3556
                  (FStar_Ident.range_of_lid lid) in
              let uu____3565 = module_is_defined env new_lid in
              if uu____3565
              then FStar_Pervasives_Native.Some new_lid
              else aux q
          | (Module_abbrev (name,modul))::uu____3571 when
              (nslen = (Prims.parse_int "0")) &&
                (name.FStar_Ident.idText =
                   (lid.FStar_Ident.ident).FStar_Ident.idText)
              -> FStar_Pervasives_Native.Some modul
          | uu____3578::q -> aux q in
        aux env.scope_mods
let fail_if_curmodule:
  env -> FStar_Ident.lident -> FStar_Ident.lident -> Prims.unit =
  fun env  ->
    fun ns_original  ->
      fun ns_resolved  ->
        let uu____3591 =
          let uu____3592 = current_module env in
          FStar_Ident.lid_equals ns_resolved uu____3592 in
        if uu____3591
        then
          (if FStar_Ident.lid_equals ns_resolved FStar_Parser_Const.prims_lid
           then ()
           else
             (let uu____3594 =
                let uu____3595 =
                  let uu____3600 =
                    FStar_Util.format1
                      "Reference %s to current module is forbidden (see GitHub issue #451)"
                      ns_original.FStar_Ident.str in
                  (uu____3600, (FStar_Ident.range_of_lid ns_original)) in
                FStar_Errors.Error uu____3595 in
              FStar_Exn.raise uu____3594))
        else ()
let fail_if_qualified_by_curmodule: env -> FStar_Ident.lident -> Prims.unit =
  fun env  ->
    fun lid  ->
      match lid.FStar_Ident.ns with
      | [] -> ()
      | uu____3608 ->
          let modul_orig = FStar_Ident.lid_of_ids lid.FStar_Ident.ns in
          let uu____3612 = resolve_module_name env modul_orig true in
          (match uu____3612 with
           | FStar_Pervasives_Native.Some modul_res ->
               fail_if_curmodule env modul_orig modul_res
           | uu____3616 -> ())
let namespace_is_open: env -> FStar_Ident.lident -> Prims.bool =
  fun env  ->
    fun lid  ->
      FStar_List.existsb
        (fun uu___164_3627  ->
           match uu___164_3627 with
           | Open_module_or_namespace (ns,Open_namespace ) ->
               FStar_Ident.lid_equals lid ns
           | uu____3629 -> false) env.scope_mods
let shorten_module_path:
  env ->
    FStar_Ident.ident Prims.list ->
      Prims.bool ->
        (FStar_Ident.ident Prims.list,FStar_Ident.ident Prims.list)
          FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun ids  ->
      fun is_full_path  ->
        let rec aux revns id1 =
          let lid = FStar_Ident.lid_of_ns_and_id (FStar_List.rev revns) id1 in
          if namespace_is_open env lid
          then
            FStar_Pervasives_Native.Some
              ((FStar_List.rev (id1 :: revns)), [])
          else
            (match revns with
             | [] -> FStar_Pervasives_Native.None
             | ns_last_id::rev_ns_prefix ->
                 let uu____3718 = aux rev_ns_prefix ns_last_id in
                 FStar_All.pipe_right uu____3718
                   (FStar_Util.map_option
                      (fun uu____3768  ->
                         match uu____3768 with
                         | (stripped_ids,rev_kept_ids) ->
                             (stripped_ids, (id1 :: rev_kept_ids))))) in
        let uu____3799 =
          is_full_path &&
            (let uu____3801 = FStar_Ident.lid_of_ids ids in
             module_is_defined env uu____3801) in
        if uu____3799
        then (ids, [])
        else
          (match FStar_List.rev ids with
           | [] -> ([], [])
           | ns_last_id::ns_rev_prefix ->
               let uu____3831 = aux ns_rev_prefix ns_last_id in
               (match uu____3831 with
                | FStar_Pervasives_Native.None  -> ([], ids)
                | FStar_Pervasives_Native.Some (stripped_ids,rev_kept_ids) ->
                    (stripped_ids, (FStar_List.rev rev_kept_ids))))
let shorten_lid: env -> FStar_Ident.lid -> FStar_Ident.lid =
  fun env  ->
    fun lid  ->
      let uu____3890 = shorten_module_path env lid.FStar_Ident.ns true in
      match uu____3890 with
      | (uu____3899,short) ->
          FStar_Ident.lid_of_ns_and_id short lid.FStar_Ident.ident
let resolve_in_open_namespaces'':
  'a .
    env ->
      FStar_Ident.lident ->
        exported_id_kind ->
          (local_binding -> 'a cont_t) ->
            (rec_binding -> 'a cont_t) ->
              (record_or_dc -> 'a cont_t) ->
                (FStar_Ident.lident -> 'a cont_t) ->
                  ('a cont_t -> FStar_Ident.ident -> 'a cont_t) ->
                    'a FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      fun eikind  ->
        fun k_local_binding  ->
          fun k_rec_binding  ->
            fun k_record  ->
              fun f_module  ->
                fun l_default  ->
                  match lid.FStar_Ident.ns with
                  | uu____4007::uu____4008 ->
                      let uu____4011 =
                        let uu____4014 =
                          let uu____4015 =
                            FStar_Ident.lid_of_ids lid.FStar_Ident.ns in
                          FStar_Ident.set_lid_range uu____4015
                            (FStar_Ident.range_of_lid lid) in
                        resolve_module_name env uu____4014 true in
                      (match uu____4011 with
                       | FStar_Pervasives_Native.None  ->
                           FStar_Pervasives_Native.None
                       | FStar_Pervasives_Native.Some modul ->
                           let uu____4019 =
                             find_in_module_with_includes eikind f_module
                               Cont_fail env modul lid.FStar_Ident.ident in
                           option_of_cont
                             (fun uu____4023  -> FStar_Pervasives_Native.None)
                             uu____4019)
                  | [] ->
                      try_lookup_id'' env lid.FStar_Ident.ident eikind
                        k_local_binding k_rec_binding k_record f_module
                        l_default
let cont_of_option:
  'a . 'a cont_t -> 'a FStar_Pervasives_Native.option -> 'a cont_t =
  fun k_none  ->
    fun uu___165_4041  ->
      match uu___165_4041 with
      | FStar_Pervasives_Native.Some v1 -> Cont_ok v1
      | FStar_Pervasives_Native.None  -> k_none
let resolve_in_open_namespaces':
  'a .
    env ->
      FStar_Ident.lident ->
        (local_binding -> 'a FStar_Pervasives_Native.option) ->
          (rec_binding -> 'a FStar_Pervasives_Native.option) ->
            (FStar_Ident.lident ->
               (FStar_Syntax_Syntax.sigelt,Prims.bool)
                 FStar_Pervasives_Native.tuple2 ->
                 'a FStar_Pervasives_Native.option)
              -> 'a FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      fun k_local_binding  ->
        fun k_rec_binding  ->
          fun k_global_def  ->
            let k_global_def' k lid1 def =
              let uu____4140 = k_global_def lid1 def in
              cont_of_option k uu____4140 in
            let f_module lid' =
              let k = Cont_ignore in
              find_in_module env lid' (k_global_def' k) k in
            let l_default k i = lookup_default_id env i (k_global_def' k) k in
            resolve_in_open_namespaces'' env lid Exported_id_term_type
              (fun l  ->
                 let uu____4170 = k_local_binding l in
                 cont_of_option Cont_fail uu____4170)
              (fun r  ->
                 let uu____4176 = k_rec_binding r in
                 cont_of_option Cont_fail uu____4176)
              (fun uu____4180  -> Cont_ignore) f_module l_default
let fv_qual_of_se:
  FStar_Syntax_Syntax.sigelt ->
    FStar_Syntax_Syntax.fv_qual FStar_Pervasives_Native.option
  =
  fun se  ->
    match se.FStar_Syntax_Syntax.sigel with
    | FStar_Syntax_Syntax.Sig_datacon
        (uu____4188,uu____4189,uu____4190,l,uu____4192,uu____4193) ->
        let qopt =
          FStar_Util.find_map se.FStar_Syntax_Syntax.sigquals
            (fun uu___166_4204  ->
               match uu___166_4204 with
               | FStar_Syntax_Syntax.RecordConstructor (uu____4207,fs) ->
                   FStar_Pervasives_Native.Some
                     (FStar_Syntax_Syntax.Record_ctor (l, fs))
               | uu____4219 -> FStar_Pervasives_Native.None) in
        (match qopt with
         | FStar_Pervasives_Native.None  ->
             FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor
         | x -> x)
    | FStar_Syntax_Syntax.Sig_declare_typ (uu____4225,uu____4226,uu____4227)
        -> FStar_Pervasives_Native.None
    | uu____4228 -> FStar_Pervasives_Native.None
let lb_fv:
  FStar_Syntax_Syntax.letbinding Prims.list ->
    FStar_Ident.lident -> FStar_Syntax_Syntax.fv
  =
  fun lbs  ->
    fun lid  ->
      let uu____4239 =
        FStar_Util.find_map lbs
          (fun lb  ->
             let fv = FStar_Util.right lb.FStar_Syntax_Syntax.lbname in
             let uu____4247 = FStar_Syntax_Syntax.fv_eq_lid fv lid in
             if uu____4247
             then FStar_Pervasives_Native.Some fv
             else FStar_Pervasives_Native.None) in
      FStar_All.pipe_right uu____4239 FStar_Util.must
let ns_of_lid_equals: FStar_Ident.lident -> FStar_Ident.lident -> Prims.bool
  =
  fun lid  ->
    fun ns  ->
      ((FStar_List.length lid.FStar_Ident.ns) =
         (FStar_List.length (FStar_Ident.ids_of_lid ns)))
        &&
        (let uu____4260 = FStar_Ident.lid_of_ids lid.FStar_Ident.ns in
         FStar_Ident.lid_equals uu____4260 ns)
let try_lookup_name:
  Prims.bool ->
    Prims.bool ->
      env -> FStar_Ident.lident -> foundname FStar_Pervasives_Native.option
  =
  fun any_val  ->
    fun exclude_interf  ->
      fun env  ->
        fun lid  ->
          let occurrence_range = FStar_Ident.range_of_lid lid in
          let k_global_def source_lid uu___171_4290 =
            match uu___171_4290 with
            | (uu____4297,true ) when exclude_interf ->
                FStar_Pervasives_Native.None
            | (se,uu____4299) ->
                (match se.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_inductive_typ uu____4302 ->
                     let uu____4319 =
                       let uu____4320 =
                         let uu____4325 =
                           FStar_Syntax_Syntax.fvar source_lid
                             FStar_Syntax_Syntax.Delta_constant
                             FStar_Pervasives_Native.None in
                         (uu____4325, false) in
                       Term_name uu____4320 in
                     FStar_Pervasives_Native.Some uu____4319
                 | FStar_Syntax_Syntax.Sig_datacon uu____4326 ->
                     let uu____4341 =
                       let uu____4342 =
                         let uu____4347 =
                           let uu____4348 = fv_qual_of_se se in
                           FStar_Syntax_Syntax.fvar source_lid
                             FStar_Syntax_Syntax.Delta_constant uu____4348 in
                         (uu____4347, false) in
                       Term_name uu____4342 in
                     FStar_Pervasives_Native.Some uu____4341
                 | FStar_Syntax_Syntax.Sig_let ((uu____4351,lbs),uu____4353)
                     ->
                     let fv = lb_fv lbs source_lid in
                     let uu____4369 =
                       let uu____4370 =
                         let uu____4375 =
                           FStar_Syntax_Syntax.fvar source_lid
                             fv.FStar_Syntax_Syntax.fv_delta
                             fv.FStar_Syntax_Syntax.fv_qual in
                         (uu____4375, false) in
                       Term_name uu____4370 in
                     FStar_Pervasives_Native.Some uu____4369
                 | FStar_Syntax_Syntax.Sig_declare_typ
                     (lid1,uu____4377,uu____4378) ->
                     let quals = se.FStar_Syntax_Syntax.sigquals in
                     let uu____4382 =
                       any_val ||
                         (FStar_All.pipe_right quals
                            (FStar_Util.for_some
                               (fun uu___167_4386  ->
                                  match uu___167_4386 with
                                  | FStar_Syntax_Syntax.Assumption  -> true
                                  | uu____4387 -> false))) in
                     if uu____4382
                     then
                       let lid2 =
                         FStar_Ident.set_lid_range lid1
                           (FStar_Ident.range_of_lid source_lid) in
                       let dd =
                         let uu____4392 =
                           (FStar_Syntax_Util.is_primop_lid lid2) ||
                             (FStar_All.pipe_right quals
                                (FStar_Util.for_some
                                   (fun uu___168_4397  ->
                                      match uu___168_4397 with
                                      | FStar_Syntax_Syntax.Projector
                                          uu____4398 -> true
                                      | FStar_Syntax_Syntax.Discriminator
                                          uu____4403 -> true
                                      | uu____4404 -> false))) in
                         if uu____4392
                         then FStar_Syntax_Syntax.Delta_equational
                         else FStar_Syntax_Syntax.Delta_constant in
                       let dd1 =
                         let uu____4407 =
                           FStar_All.pipe_right quals
                             (FStar_Util.for_some
                                (fun uu___169_4411  ->
                                   match uu___169_4411 with
                                   | FStar_Syntax_Syntax.Abstract  -> true
                                   | uu____4412 -> false)) in
                         if uu____4407
                         then FStar_Syntax_Syntax.Delta_abstract dd
                         else dd in
                       let uu____4414 =
                         FStar_Util.find_map quals
                           (fun uu___170_4419  ->
                              match uu___170_4419 with
                              | FStar_Syntax_Syntax.Reflectable refl_monad ->
                                  FStar_Pervasives_Native.Some refl_monad
                              | uu____4423 -> FStar_Pervasives_Native.None) in
                       (match uu____4414 with
                        | FStar_Pervasives_Native.Some refl_monad ->
                            let refl_const =
                              FStar_Syntax_Syntax.mk
                                (FStar_Syntax_Syntax.Tm_constant
                                   (FStar_Const.Const_reflect refl_monad))
                                FStar_Pervasives_Native.None occurrence_range in
                            FStar_Pervasives_Native.Some
                              (Term_name (refl_const, false))
                        | uu____4432 ->
                            let uu____4435 =
                              let uu____4436 =
                                let uu____4441 =
                                  let uu____4442 = fv_qual_of_se se in
                                  FStar_Syntax_Syntax.fvar lid2 dd1
                                    uu____4442 in
                                (uu____4441, false) in
                              Term_name uu____4436 in
                            FStar_Pervasives_Native.Some uu____4435)
                     else FStar_Pervasives_Native.None
                 | FStar_Syntax_Syntax.Sig_new_effect_for_free ne ->
                     FStar_Pervasives_Native.Some
                       (Eff_name
                          (se,
                            (FStar_Ident.set_lid_range
                               ne.FStar_Syntax_Syntax.mname
                               (FStar_Ident.range_of_lid source_lid))))
                 | FStar_Syntax_Syntax.Sig_new_effect ne ->
                     FStar_Pervasives_Native.Some
                       (Eff_name
                          (se,
                            (FStar_Ident.set_lid_range
                               ne.FStar_Syntax_Syntax.mname
                               (FStar_Ident.range_of_lid source_lid))))
                 | FStar_Syntax_Syntax.Sig_effect_abbrev uu____4448 ->
                     FStar_Pervasives_Native.Some (Eff_name (se, source_lid))
                 | uu____4461 -> FStar_Pervasives_Native.None) in
          let k_local_binding r =
            let uu____4480 =
              let uu____4481 =
                found_local_binding (FStar_Ident.range_of_lid lid) r in
              Term_name uu____4481 in
            FStar_Pervasives_Native.Some uu____4480 in
          let k_rec_binding uu____4497 =
            match uu____4497 with
            | (id1,l,dd) ->
                let uu____4509 =
                  let uu____4510 =
                    let uu____4515 =
                      FStar_Syntax_Syntax.fvar
                        (FStar_Ident.set_lid_range l
                           (FStar_Ident.range_of_lid lid)) dd
                        FStar_Pervasives_Native.None in
                    (uu____4515, false) in
                  Term_name uu____4510 in
                FStar_Pervasives_Native.Some uu____4509 in
          let found_unmangled =
            match lid.FStar_Ident.ns with
            | [] ->
                let uu____4521 = unmangleOpName lid.FStar_Ident.ident in
                (match uu____4521 with
                 | FStar_Pervasives_Native.Some f ->
                     FStar_Pervasives_Native.Some (Term_name f)
                 | uu____4539 -> FStar_Pervasives_Native.None)
            | uu____4546 -> FStar_Pervasives_Native.None in
          match found_unmangled with
          | FStar_Pervasives_Native.None  ->
              resolve_in_open_namespaces' env lid k_local_binding
                k_rec_binding k_global_def
          | x -> x
let try_lookup_effect_name':
  Prims.bool ->
    env ->
      FStar_Ident.lident ->
        (FStar_Syntax_Syntax.sigelt,FStar_Ident.lident)
          FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option
  =
  fun exclude_interf  ->
    fun env  ->
      fun lid  ->
        let uu____4575 = try_lookup_name true exclude_interf env lid in
        match uu____4575 with
        | FStar_Pervasives_Native.Some (Eff_name (o,l)) ->
            FStar_Pervasives_Native.Some (o, l)
        | uu____4590 -> FStar_Pervasives_Native.None
let try_lookup_effect_name:
  env ->
    FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option
  =
  fun env  ->
    fun l  ->
      let uu____4605 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l in
      match uu____4605 with
      | FStar_Pervasives_Native.Some (o,l1) ->
          FStar_Pervasives_Native.Some l1
      | uu____4620 -> FStar_Pervasives_Native.None
let try_lookup_effect_name_and_attributes:
  env ->
    FStar_Ident.lident ->
      (FStar_Ident.lident,FStar_Syntax_Syntax.cflags Prims.list)
        FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option
  =
  fun env  ->
    fun l  ->
      let uu____4641 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l in
      match uu____4641 with
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect
               ne;
             FStar_Syntax_Syntax.sigrng = uu____4657;
             FStar_Syntax_Syntax.sigquals = uu____4658;
             FStar_Syntax_Syntax.sigmeta = uu____4659;
             FStar_Syntax_Syntax.sigattrs = uu____4660;_},l1)
          ->
          FStar_Pervasives_Native.Some
            (l1, (ne.FStar_Syntax_Syntax.cattributes))
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_new_effect_for_free ne;
             FStar_Syntax_Syntax.sigrng = uu____4679;
             FStar_Syntax_Syntax.sigquals = uu____4680;
             FStar_Syntax_Syntax.sigmeta = uu____4681;
             FStar_Syntax_Syntax.sigattrs = uu____4682;_},l1)
          ->
          FStar_Pervasives_Native.Some
            (l1, (ne.FStar_Syntax_Syntax.cattributes))
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_effect_abbrev
               (uu____4700,uu____4701,uu____4702,uu____4703,cattributes);
             FStar_Syntax_Syntax.sigrng = uu____4705;
             FStar_Syntax_Syntax.sigquals = uu____4706;
             FStar_Syntax_Syntax.sigmeta = uu____4707;
             FStar_Syntax_Syntax.sigattrs = uu____4708;_},l1)
          -> FStar_Pervasives_Native.Some (l1, cattributes)
      | uu____4730 -> FStar_Pervasives_Native.None
let try_lookup_effect_defn:
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.eff_decl FStar_Pervasives_Native.option
  =
  fun env  ->
    fun l  ->
      let uu____4751 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l in
      match uu____4751 with
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_new_effect
               ne;
             FStar_Syntax_Syntax.sigrng = uu____4761;
             FStar_Syntax_Syntax.sigquals = uu____4762;
             FStar_Syntax_Syntax.sigmeta = uu____4763;
             FStar_Syntax_Syntax.sigattrs = uu____4764;_},uu____4765)
          -> FStar_Pervasives_Native.Some ne
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_new_effect_for_free ne;
             FStar_Syntax_Syntax.sigrng = uu____4775;
             FStar_Syntax_Syntax.sigquals = uu____4776;
             FStar_Syntax_Syntax.sigmeta = uu____4777;
             FStar_Syntax_Syntax.sigattrs = uu____4778;_},uu____4779)
          -> FStar_Pervasives_Native.Some ne
      | uu____4788 -> FStar_Pervasives_Native.None
let is_effect_name: env -> FStar_Ident.lident -> Prims.bool =
  fun env  ->
    fun lid  ->
      let uu____4801 = try_lookup_effect_name env lid in
      match uu____4801 with
      | FStar_Pervasives_Native.None  -> false
      | FStar_Pervasives_Native.Some uu____4804 -> true
let try_lookup_root_effect_name:
  env ->
    FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option
  =
  fun env  ->
    fun l  ->
      let uu____4813 =
        try_lookup_effect_name' (Prims.op_Negation env.iface) env l in
      match uu____4813 with
      | FStar_Pervasives_Native.Some
          ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_effect_abbrev
               (l',uu____4823,uu____4824,uu____4825,uu____4826);
             FStar_Syntax_Syntax.sigrng = uu____4827;
             FStar_Syntax_Syntax.sigquals = uu____4828;
             FStar_Syntax_Syntax.sigmeta = uu____4829;
             FStar_Syntax_Syntax.sigattrs = uu____4830;_},uu____4831)
          ->
          let rec aux new_name =
            let uu____4850 =
              FStar_Util.smap_try_find (sigmap env) new_name.FStar_Ident.str in
            match uu____4850 with
            | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
            | FStar_Pervasives_Native.Some (s,uu____4868) ->
                (match s.FStar_Syntax_Syntax.sigel with
                 | FStar_Syntax_Syntax.Sig_new_effect_for_free ne ->
                     FStar_Pervasives_Native.Some
                       (FStar_Ident.set_lid_range
                          ne.FStar_Syntax_Syntax.mname
                          (FStar_Ident.range_of_lid l))
                 | FStar_Syntax_Syntax.Sig_new_effect ne ->
                     FStar_Pervasives_Native.Some
                       (FStar_Ident.set_lid_range
                          ne.FStar_Syntax_Syntax.mname
                          (FStar_Ident.range_of_lid l))
                 | FStar_Syntax_Syntax.Sig_effect_abbrev
                     (uu____4877,uu____4878,uu____4879,cmp,uu____4881) ->
                     let l'' = FStar_Syntax_Util.comp_effect_name cmp in
                     aux l''
                 | uu____4887 -> FStar_Pervasives_Native.None) in
          aux l'
      | FStar_Pervasives_Native.Some (uu____4888,l') ->
          FStar_Pervasives_Native.Some l'
      | uu____4894 -> FStar_Pervasives_Native.None
let lookup_letbinding_quals:
  env -> FStar_Ident.lident -> FStar_Syntax_Syntax.qualifier Prims.list =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___172_4923 =
        match uu___172_4923 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ
               (uu____4932,uu____4933,uu____4934);
             FStar_Syntax_Syntax.sigrng = uu____4935;
             FStar_Syntax_Syntax.sigquals = quals;
             FStar_Syntax_Syntax.sigmeta = uu____4937;
             FStar_Syntax_Syntax.sigattrs = uu____4938;_},uu____4939)
            -> FStar_Pervasives_Native.Some quals
        | uu____4946 -> FStar_Pervasives_Native.None in
      let uu____4953 =
        resolve_in_open_namespaces' env lid
          (fun uu____4961  -> FStar_Pervasives_Native.None)
          (fun uu____4965  -> FStar_Pervasives_Native.None) k_global_def in
      match uu____4953 with
      | FStar_Pervasives_Native.Some quals -> quals
      | uu____4975 -> []
let try_lookup_module:
  env ->
    Prims.string Prims.list ->
      FStar_Syntax_Syntax.modul FStar_Pervasives_Native.option
  =
  fun env  ->
    fun path  ->
      let uu____4992 =
        FStar_List.tryFind
          (fun uu____5007  ->
             match uu____5007 with
             | (mlid,modul) ->
                 let uu____5014 = FStar_Ident.path_of_lid mlid in
                 uu____5014 = path) env.modules in
      match uu____4992 with
      | FStar_Pervasives_Native.Some (uu____5021,modul) ->
          FStar_Pervasives_Native.Some modul
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
let try_lookup_let:
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___173_5051 =
        match uu___173_5051 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
               ((uu____5058,lbs),uu____5060);
             FStar_Syntax_Syntax.sigrng = uu____5061;
             FStar_Syntax_Syntax.sigquals = uu____5062;
             FStar_Syntax_Syntax.sigmeta = uu____5063;
             FStar_Syntax_Syntax.sigattrs = uu____5064;_},uu____5065)
            ->
            let fv = lb_fv lbs lid1 in
            let uu____5085 =
              FStar_Syntax_Syntax.fvar lid1 fv.FStar_Syntax_Syntax.fv_delta
                fv.FStar_Syntax_Syntax.fv_qual in
            FStar_Pervasives_Native.Some uu____5085
        | uu____5086 -> FStar_Pervasives_Native.None in
      resolve_in_open_namespaces' env lid
        (fun uu____5092  -> FStar_Pervasives_Native.None)
        (fun uu____5094  -> FStar_Pervasives_Native.None) k_global_def
let try_lookup_definition:
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___174_5117 =
        match uu___174_5117 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let
               (lbs,uu____5127);
             FStar_Syntax_Syntax.sigrng = uu____5128;
             FStar_Syntax_Syntax.sigquals = uu____5129;
             FStar_Syntax_Syntax.sigmeta = uu____5130;
             FStar_Syntax_Syntax.sigattrs = uu____5131;_},uu____5132)
            ->
            FStar_Util.find_map (FStar_Pervasives_Native.snd lbs)
              (fun lb  ->
                 match lb.FStar_Syntax_Syntax.lbname with
                 | FStar_Util.Inr fv when
                     FStar_Syntax_Syntax.fv_eq_lid fv lid1 ->
                     FStar_Pervasives_Native.Some
                       (lb.FStar_Syntax_Syntax.lbdef)
                 | uu____5155 -> FStar_Pervasives_Native.None)
        | uu____5162 -> FStar_Pervasives_Native.None in
      resolve_in_open_namespaces' env lid
        (fun uu____5172  -> FStar_Pervasives_Native.None)
        (fun uu____5176  -> FStar_Pervasives_Native.None) k_global_def
let empty_include_smap:
  FStar_Ident.lident Prims.list FStar_ST.ref FStar_Util.smap = new_sigmap ()
let empty_exported_id_smap: exported_id_set FStar_Util.smap = new_sigmap ()
let try_lookup_lid':
  Prims.bool ->
    Prims.bool ->
      env ->
        FStar_Ident.lident ->
          (FStar_Syntax_Syntax.term,Prims.bool)
            FStar_Pervasives_Native.tuple2 FStar_Pervasives_Native.option
  =
  fun any_val  ->
    fun exclude_interface  ->
      fun env  ->
        fun lid  ->
          let uu____5215 = try_lookup_name any_val exclude_interface env lid in
          match uu____5215 with
          | FStar_Pervasives_Native.Some (Term_name (e,mut)) ->
              FStar_Pervasives_Native.Some (e, mut)
          | uu____5230 -> FStar_Pervasives_Native.None
let try_lookup_lid:
  env ->
    FStar_Ident.lident ->
      (FStar_Syntax_Syntax.term,Prims.bool) FStar_Pervasives_Native.tuple2
        FStar_Pervasives_Native.option
  = fun env  -> fun l  -> try_lookup_lid' env.iface false env l
let resolve_to_fully_qualified_name:
  env ->
    FStar_Ident.lident -> FStar_Ident.lident FStar_Pervasives_Native.option
  =
  fun env  ->
    fun l  ->
      let uu____5257 = try_lookup_lid env l in
      match uu____5257 with
      | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
      | FStar_Pervasives_Native.Some (e,uu____5271) ->
          let uu____5276 =
            let uu____5277 = FStar_Syntax_Subst.compress e in
            uu____5277.FStar_Syntax_Syntax.n in
          (match uu____5276 with
           | FStar_Syntax_Syntax.Tm_fvar fv ->
               FStar_Pervasives_Native.Some
                 ((fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
           | uu____5283 -> FStar_Pervasives_Native.None)
let try_lookup_lid_no_resolve:
  env ->
    FStar_Ident.lident ->
      (FStar_Syntax_Syntax.term,Prims.bool) FStar_Pervasives_Native.tuple2
        FStar_Pervasives_Native.option
  =
  fun env  ->
    fun l  ->
      let env' =
        let uu___195_5297 = env in
        {
          curmodule = (uu___195_5297.curmodule);
          curmonad = (uu___195_5297.curmonad);
          modules = (uu___195_5297.modules);
          scope_mods = [];
          exported_ids = empty_exported_id_smap;
          trans_exported_ids = (uu___195_5297.trans_exported_ids);
          includes = empty_include_smap;
          sigaccum = (uu___195_5297.sigaccum);
          sigmap = (uu___195_5297.sigmap);
          iface = (uu___195_5297.iface);
          admitted_iface = (uu___195_5297.admitted_iface);
          expect_typ = (uu___195_5297.expect_typ);
          docs = (uu___195_5297.docs);
          remaining_iface_decls = (uu___195_5297.remaining_iface_decls);
          syntax_only = (uu___195_5297.syntax_only);
          ds_hooks = (uu___195_5297.ds_hooks)
        } in
      try_lookup_lid env' l
let try_lookup_doc:
  env ->
    FStar_Ident.lid -> FStar_Parser_AST.fsdoc FStar_Pervasives_Native.option
  = fun env  -> fun l  -> FStar_Util.smap_try_find env.docs l.FStar_Ident.str
let try_lookup_datacon:
  env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.fv FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___176_5326 =
        match uu___176_5326 with
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_declare_typ
               (uu____5333,uu____5334,uu____5335);
             FStar_Syntax_Syntax.sigrng = uu____5336;
             FStar_Syntax_Syntax.sigquals = quals;
             FStar_Syntax_Syntax.sigmeta = uu____5338;
             FStar_Syntax_Syntax.sigattrs = uu____5339;_},uu____5340)
            ->
            let uu____5345 =
              FStar_All.pipe_right quals
                (FStar_Util.for_some
                   (fun uu___175_5349  ->
                      match uu___175_5349 with
                      | FStar_Syntax_Syntax.Assumption  -> true
                      | uu____5350 -> false)) in
            if uu____5345
            then
              let uu____5353 =
                FStar_Syntax_Syntax.lid_as_fv lid1
                  FStar_Syntax_Syntax.Delta_constant
                  FStar_Pervasives_Native.None in
              FStar_Pervasives_Native.Some uu____5353
            else FStar_Pervasives_Native.None
        | ({
             FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_datacon
               uu____5355;
             FStar_Syntax_Syntax.sigrng = uu____5356;
             FStar_Syntax_Syntax.sigquals = uu____5357;
             FStar_Syntax_Syntax.sigmeta = uu____5358;
             FStar_Syntax_Syntax.sigattrs = uu____5359;_},uu____5360)
            ->
            let uu____5379 =
              FStar_Syntax_Syntax.lid_as_fv lid1
                FStar_Syntax_Syntax.Delta_constant
                (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.Data_ctor) in
            FStar_Pervasives_Native.Some uu____5379
        | uu____5380 -> FStar_Pervasives_Native.None in
      resolve_in_open_namespaces' env lid
        (fun uu____5386  -> FStar_Pervasives_Native.None)
        (fun uu____5388  -> FStar_Pervasives_Native.None) k_global_def
let find_all_datacons:
  env ->
    FStar_Ident.lident ->
      FStar_Ident.lident Prims.list FStar_Pervasives_Native.option
  =
  fun env  ->
    fun lid  ->
      let k_global_def lid1 uu___177_5413 =
        match uu___177_5413 with
        | ({
             FStar_Syntax_Syntax.sigel =
               FStar_Syntax_Syntax.Sig_inductive_typ
               (uu____5422,uu____5423,uu____5424,uu____5425,datas,uu____5427);
             FStar_Syntax_Syntax.sigrng = uu____5428;
             FStar_Syntax_Syntax.sigquals = uu____5429;
             FStar_Syntax_Syntax.sigmeta = uu____5430;
             FStar_Syntax_Syntax.sigattrs = uu____5431;_},uu____5432)
            -> FStar_Pervasives_Native.Some datas
        | uu____5447 -> FStar_Pervasives_Native.None in
      resolve_in_open_namespaces' env lid
        (fun uu____5457  -> FStar_Pervasives_Native.None)
        (fun uu____5461  -> FStar_Pervasives_Native.None) k_global_def
let record_cache_aux_with_filter:
  ((Prims.unit -> Prims.unit,Prims.unit -> Prims.unit,Prims.unit ->
                                                        record_or_dc
                                                          Prims.list,
     record_or_dc -> Prims.unit) FStar_Pervasives_Native.tuple4,Prims.unit ->
                                                                  Prims.unit)
    FStar_Pervasives_Native.tuple2
  =
  let record_cache = FStar_Util.mk_ref [[]] in
  let push1 uu____5506 =
    let uu____5507 =
      let uu____5512 =
        let uu____5515 = FStar_ST.op_Bang record_cache in
        FStar_List.hd uu____5515 in
      let uu____5592 = FStar_ST.op_Bang record_cache in uu____5512 ::
        uu____5592 in
    FStar_ST.op_Colon_Equals record_cache uu____5507 in
  let pop1 uu____5742 =
    let uu____5743 =
      let uu____5748 = FStar_ST.op_Bang record_cache in
      FStar_List.tl uu____5748 in
    FStar_ST.op_Colon_Equals record_cache uu____5743 in
  let peek1 uu____5900 =
    let uu____5901 = FStar_ST.op_Bang record_cache in
    FStar_List.hd uu____5901 in
  let insert r =
    let uu____5982 =
      let uu____5987 = let uu____5990 = peek1 () in r :: uu____5990 in
      let uu____5993 =
        let uu____5998 = FStar_ST.op_Bang record_cache in
        FStar_List.tl uu____5998 in
      uu____5987 :: uu____5993 in
    FStar_ST.op_Colon_Equals record_cache uu____5982 in
  let filter1 uu____6150 =
    let rc = peek1 () in
    let filtered =
      FStar_List.filter
        (fun r  -> Prims.op_Negation r.is_private_or_abstract) rc in
    let uu____6159 =
      let uu____6164 =
        let uu____6169 = FStar_ST.op_Bang record_cache in
        FStar_List.tl uu____6169 in
      filtered :: uu____6164 in
    FStar_ST.op_Colon_Equals record_cache uu____6159 in
  let aux = (push1, pop1, peek1, insert) in (aux, filter1)
let record_cache_aux:
  (Prims.unit -> Prims.unit,Prims.unit -> Prims.unit,Prims.unit ->
                                                       record_or_dc
                                                         Prims.list,record_or_dc
                                                                    ->
                                                                    Prims.unit)
    FStar_Pervasives_Native.tuple4
  =
  let uu____6385 = record_cache_aux_with_filter in
  match uu____6385 with | (aux,uu____6429) -> aux
let filter_record_cache: Prims.unit -> Prims.unit =
  let uu____6472 = record_cache_aux_with_filter in
  match uu____6472 with | (uu____6499,filter1) -> filter1
let push_record_cache: Prims.unit -> Prims.unit =
  let uu____6543 = record_cache_aux in
  match uu____6543 with | (push1,uu____6565,uu____6566,uu____6567) -> push1
let pop_record_cache: Prims.unit -> Prims.unit =
  let uu____6590 = record_cache_aux in
  match uu____6590 with | (uu____6611,pop1,uu____6613,uu____6614) -> pop1
let peek_record_cache: Prims.unit -> record_or_dc Prims.list =
  let uu____6639 = record_cache_aux in
  match uu____6639 with | (uu____6662,uu____6663,peek1,uu____6665) -> peek1
let insert_record_cache: record_or_dc -> Prims.unit =
  let uu____6688 = record_cache_aux in
  match uu____6688 with | (uu____6709,uu____6710,uu____6711,insert) -> insert
let extract_record:
  env ->
    scope_mod Prims.list FStar_ST.ref ->
      FStar_Syntax_Syntax.sigelt -> Prims.unit
  =
  fun e  ->
    fun new_globs  ->
      fun se  ->
        match se.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_bundle (sigs,uu____6765) ->
            let is_record =
              FStar_Util.for_some
                (fun uu___178_6781  ->
                   match uu___178_6781 with
                   | FStar_Syntax_Syntax.RecordType uu____6782 -> true
                   | FStar_Syntax_Syntax.RecordConstructor uu____6791 -> true
                   | uu____6800 -> false) in
            let find_dc dc =
              FStar_All.pipe_right sigs
                (FStar_Util.find_opt
                   (fun uu___179_6822  ->
                      match uu___179_6822 with
                      | {
                          FStar_Syntax_Syntax.sigel =
                            FStar_Syntax_Syntax.Sig_datacon
                            (lid,uu____6824,uu____6825,uu____6826,uu____6827,uu____6828);
                          FStar_Syntax_Syntax.sigrng = uu____6829;
                          FStar_Syntax_Syntax.sigquals = uu____6830;
                          FStar_Syntax_Syntax.sigmeta = uu____6831;
                          FStar_Syntax_Syntax.sigattrs = uu____6832;_} ->
                          FStar_Ident.lid_equals dc lid
                      | uu____6841 -> false)) in
            FStar_All.pipe_right sigs
              (FStar_List.iter
                 (fun uu___180_6876  ->
                    match uu___180_6876 with
                    | {
                        FStar_Syntax_Syntax.sigel =
                          FStar_Syntax_Syntax.Sig_inductive_typ
                          (typename,univs1,parms,uu____6880,uu____6881,dc::[]);
                        FStar_Syntax_Syntax.sigrng = uu____6883;
                        FStar_Syntax_Syntax.sigquals = typename_quals;
                        FStar_Syntax_Syntax.sigmeta = uu____6885;
                        FStar_Syntax_Syntax.sigattrs = uu____6886;_} ->
                        let uu____6897 =
                          let uu____6898 = find_dc dc in
                          FStar_All.pipe_left FStar_Util.must uu____6898 in
                        (match uu____6897 with
                         | {
                             FStar_Syntax_Syntax.sigel =
                               FStar_Syntax_Syntax.Sig_datacon
                               (constrname,uu____6904,t,uu____6906,uu____6907,uu____6908);
                             FStar_Syntax_Syntax.sigrng = uu____6909;
                             FStar_Syntax_Syntax.sigquals = uu____6910;
                             FStar_Syntax_Syntax.sigmeta = uu____6911;
                             FStar_Syntax_Syntax.sigattrs = uu____6912;_} ->
                             let uu____6921 =
                               FStar_Syntax_Util.arrow_formals t in
                             (match uu____6921 with
                              | (formals,uu____6935) ->
                                  let is_rec = is_record typename_quals in
                                  let formals' =
                                    FStar_All.pipe_right formals
                                      (FStar_List.collect
                                         (fun uu____6984  ->
                                            match uu____6984 with
                                            | (x,q) ->
                                                let uu____6997 =
                                                  (FStar_Syntax_Syntax.is_null_bv
                                                     x)
                                                    ||
                                                    (is_rec &&
                                                       (FStar_Syntax_Syntax.is_implicit
                                                          q)) in
                                                if uu____6997
                                                then []
                                                else [(x, q)])) in
                                  let fields' =
                                    FStar_All.pipe_right formals'
                                      (FStar_List.map
                                         (fun uu____7054  ->
                                            match uu____7054 with
                                            | (x,q) ->
                                                let uu____7067 =
                                                  if is_rec
                                                  then
                                                    FStar_Syntax_Util.unmangle_field_name
                                                      x.FStar_Syntax_Syntax.ppname
                                                  else
                                                    x.FStar_Syntax_Syntax.ppname in
                                                (uu____7067,
                                                  (x.FStar_Syntax_Syntax.sort)))) in
                                  let fields = fields' in
                                  let record =
                                    {
                                      typename;
                                      constrname =
                                        (constrname.FStar_Ident.ident);
                                      parms;
                                      fields;
                                      is_private_or_abstract =
                                        ((FStar_List.contains
                                            FStar_Syntax_Syntax.Private
                                            typename_quals)
                                           ||
                                           (FStar_List.contains
                                              FStar_Syntax_Syntax.Abstract
                                              typename_quals));
                                      is_record = is_rec
                                    } in
                                  ((let uu____7082 =
                                      let uu____7085 =
                                        FStar_ST.op_Bang new_globs in
                                      (Record_or_dc record) :: uu____7085 in
                                    FStar_ST.op_Colon_Equals new_globs
                                      uu____7082);
                                   (match () with
                                    | () ->
                                        ((let add_field uu____7230 =
                                            match uu____7230 with
                                            | (id1,uu____7238) ->
                                                let modul =
                                                  let uu____7244 =
                                                    FStar_Ident.lid_of_ids
                                                      constrname.FStar_Ident.ns in
                                                  uu____7244.FStar_Ident.str in
                                                let uu____7245 =
                                                  get_exported_id_set e modul in
                                                (match uu____7245 with
                                                 | FStar_Pervasives_Native.Some
                                                     my_ex ->
                                                     let my_exported_ids =
                                                       my_ex
                                                         Exported_id_field in
                                                     ((let uu____7272 =
                                                         let uu____7273 =
                                                           FStar_ST.op_Bang
                                                             my_exported_ids in
                                                         FStar_Util.set_add
                                                           id1.FStar_Ident.idText
                                                           uu____7273 in
                                                       FStar_ST.op_Colon_Equals
                                                         my_exported_ids
                                                         uu____7272);
                                                      (match () with
                                                       | () ->
                                                           let projname =
                                                             let uu____7401 =
                                                               let uu____7402
                                                                 =
                                                                 FStar_Syntax_Util.mk_field_projector_name_from_ident
                                                                   constrname
                                                                   id1 in
                                                               uu____7402.FStar_Ident.ident in
                                                             uu____7401.FStar_Ident.idText in
                                                           let uu____7404 =
                                                             let uu____7405 =
                                                               FStar_ST.op_Bang
                                                                 my_exported_ids in
                                                             FStar_Util.set_add
                                                               projname
                                                               uu____7405 in
                                                           FStar_ST.op_Colon_Equals
                                                             my_exported_ids
                                                             uu____7404))
                                                 | FStar_Pervasives_Native.None
                                                      -> ()) in
                                          FStar_List.iter add_field fields');
                                         (match () with
                                          | () -> insert_record_cache record)))))
                         | uu____7542 -> ())
                    | uu____7543 -> ()))
        | uu____7544 -> ()
let try_lookup_record_or_dc_by_field_name:
  env -> FStar_Ident.lident -> record_or_dc FStar_Pervasives_Native.option =
  fun env  ->
    fun fieldname  ->
      let find_in_cache fieldname1 =
        let uu____7559 =
          ((fieldname1.FStar_Ident.ns), (fieldname1.FStar_Ident.ident)) in
        match uu____7559 with
        | (ns,id1) ->
            let uu____7576 = peek_record_cache () in
            FStar_Util.find_map uu____7576
              (fun record  ->
                 let uu____7582 =
                   find_in_record ns id1 record (fun r  -> Cont_ok r) in
                 option_of_cont
                   (fun uu____7588  -> FStar_Pervasives_Native.None)
                   uu____7582) in
      resolve_in_open_namespaces'' env fieldname Exported_id_field
        (fun uu____7590  -> Cont_ignore) (fun uu____7592  -> Cont_ignore)
        (fun r  -> Cont_ok r)
        (fun fn  ->
           let uu____7598 = find_in_cache fn in
           cont_of_option Cont_ignore uu____7598)
        (fun k  -> fun uu____7604  -> k)
let try_lookup_record_by_field_name:
  env -> FStar_Ident.lident -> record_or_dc FStar_Pervasives_Native.option =
  fun env  ->
    fun fieldname  ->
      let uu____7615 = try_lookup_record_or_dc_by_field_name env fieldname in
      match uu____7615 with
      | FStar_Pervasives_Native.Some r when r.is_record ->
          FStar_Pervasives_Native.Some r
      | uu____7621 -> FStar_Pervasives_Native.None
let belongs_to_record:
  env -> FStar_Ident.lident -> record_or_dc -> Prims.bool =
  fun env  ->
    fun lid  ->
      fun record  ->
        let uu____7633 = try_lookup_record_by_field_name env lid in
        match uu____7633 with
        | FStar_Pervasives_Native.Some record' when
            let uu____7637 =
              let uu____7638 =
                FStar_Ident.path_of_ns (record.typename).FStar_Ident.ns in
              FStar_Ident.text_of_path uu____7638 in
            let uu____7641 =
              let uu____7642 =
                FStar_Ident.path_of_ns (record'.typename).FStar_Ident.ns in
              FStar_Ident.text_of_path uu____7642 in
            uu____7637 = uu____7641 ->
            let uu____7645 =
              find_in_record (record.typename).FStar_Ident.ns
                lid.FStar_Ident.ident record (fun uu____7649  -> Cont_ok ()) in
            (match uu____7645 with
             | Cont_ok uu____7650 -> true
             | uu____7651 -> false)
        | uu____7654 -> false
let try_lookup_dc_by_field_name:
  env ->
    FStar_Ident.lident ->
      (FStar_Ident.lident,Prims.bool) FStar_Pervasives_Native.tuple2
        FStar_Pervasives_Native.option
  =
  fun env  ->
    fun fieldname  ->
      let uu____7669 = try_lookup_record_or_dc_by_field_name env fieldname in
      match uu____7669 with
      | FStar_Pervasives_Native.Some r ->
          let uu____7679 =
            let uu____7684 =
              let uu____7685 =
                FStar_Ident.lid_of_ids
                  (FStar_List.append (r.typename).FStar_Ident.ns
                     [r.constrname]) in
              FStar_Ident.set_lid_range uu____7685
                (FStar_Ident.range_of_lid fieldname) in
            (uu____7684, (r.is_record)) in
          FStar_Pervasives_Native.Some uu____7679
      | uu____7690 -> FStar_Pervasives_Native.None
let string_set_ref_new:
  Prims.unit -> Prims.string FStar_Util.set FStar_ST.ref =
  fun uu____7710  ->
    let uu____7711 = FStar_Util.new_set FStar_Util.compare in
    FStar_Util.mk_ref uu____7711
let exported_id_set_new:
  Prims.unit -> exported_id_kind -> Prims.string FStar_Util.set FStar_ST.ref
  =
  fun uu____7731  ->
    let term_type_set = string_set_ref_new () in
    let field_set = string_set_ref_new () in
    fun uu___181_7742  ->
      match uu___181_7742 with
      | Exported_id_term_type  -> term_type_set
      | Exported_id_field  -> field_set
let unique:
  Prims.bool -> Prims.bool -> env -> FStar_Ident.lident -> Prims.bool =
  fun any_val  ->
    fun exclude_interface  ->
      fun env  ->
        fun lid  ->
          let filter_scope_mods uu___182_7776 =
            match uu___182_7776 with
            | Rec_binding uu____7777 -> true
            | uu____7778 -> false in
          let this_env =
            let uu___196_7780 = env in
            let uu____7781 =
              FStar_List.filter filter_scope_mods env.scope_mods in
            {
              curmodule = (uu___196_7780.curmodule);
              curmonad = (uu___196_7780.curmonad);
              modules = (uu___196_7780.modules);
              scope_mods = uu____7781;
              exported_ids = empty_exported_id_smap;
              trans_exported_ids = (uu___196_7780.trans_exported_ids);
              includes = empty_include_smap;
              sigaccum = (uu___196_7780.sigaccum);
              sigmap = (uu___196_7780.sigmap);
              iface = (uu___196_7780.iface);
              admitted_iface = (uu___196_7780.admitted_iface);
              expect_typ = (uu___196_7780.expect_typ);
              docs = (uu___196_7780.docs);
              remaining_iface_decls = (uu___196_7780.remaining_iface_decls);
              syntax_only = (uu___196_7780.syntax_only);
              ds_hooks = (uu___196_7780.ds_hooks)
            } in
          let uu____7784 =
            try_lookup_lid' any_val exclude_interface this_env lid in
          match uu____7784 with
          | FStar_Pervasives_Native.None  -> true
          | FStar_Pervasives_Native.Some uu____7795 -> false
let push_scope_mod: env -> scope_mod -> env =
  fun env  ->
    fun scope_mod  ->
      let uu___197_7810 = env in
      {
        curmodule = (uu___197_7810.curmodule);
        curmonad = (uu___197_7810.curmonad);
        modules = (uu___197_7810.modules);
        scope_mods = (scope_mod :: (env.scope_mods));
        exported_ids = (uu___197_7810.exported_ids);
        trans_exported_ids = (uu___197_7810.trans_exported_ids);
        includes = (uu___197_7810.includes);
        sigaccum = (uu___197_7810.sigaccum);
        sigmap = (uu___197_7810.sigmap);
        iface = (uu___197_7810.iface);
        admitted_iface = (uu___197_7810.admitted_iface);
        expect_typ = (uu___197_7810.expect_typ);
        docs = (uu___197_7810.docs);
        remaining_iface_decls = (uu___197_7810.remaining_iface_decls);
        syntax_only = (uu___197_7810.syntax_only);
        ds_hooks = (uu___197_7810.ds_hooks)
      }
let push_bv':
  env ->
    FStar_Ident.ident ->
      Prims.bool ->
        (env,FStar_Syntax_Syntax.bv) FStar_Pervasives_Native.tuple2
  =
  fun env  ->
    fun x  ->
      fun is_mutable  ->
        let bv =
          FStar_Syntax_Syntax.gen_bv x.FStar_Ident.idText
            (FStar_Pervasives_Native.Some (x.FStar_Ident.idRange))
            FStar_Syntax_Syntax.tun in
        ((push_scope_mod env (Local_binding (x, bv, is_mutable))), bv)
let push_bv_mutable:
  env ->
    FStar_Ident.ident ->
      (env,FStar_Syntax_Syntax.bv) FStar_Pervasives_Native.tuple2
  = fun env  -> fun x  -> push_bv' env x true
let push_bv:
  env ->
    FStar_Ident.ident ->
      (env,FStar_Syntax_Syntax.bv) FStar_Pervasives_Native.tuple2
  = fun env  -> fun x  -> push_bv' env x false
let push_top_level_rec_binding:
  env -> FStar_Ident.ident -> FStar_Syntax_Syntax.delta_depth -> env =
  fun env  ->
    fun x  ->
      fun dd  ->
        let l = qualify env x in
        let uu____7855 =
          (unique false true env l) || (FStar_Options.interactive ()) in
        if uu____7855
        then push_scope_mod env (Rec_binding (x, l, dd))
        else
          FStar_Exn.raise
            (FStar_Errors.Error
               ((Prims.strcat "Duplicate top-level names " l.FStar_Ident.str),
                 (FStar_Ident.range_of_lid l)))
let push_sigelt: env -> FStar_Syntax_Syntax.sigelt -> env =
  fun env  ->
    fun s  ->
      let err1 l =
        let sopt = FStar_Util.smap_try_find (sigmap env) l.FStar_Ident.str in
        let r =
          match sopt with
          | FStar_Pervasives_Native.Some (se,uu____7880) ->
              let uu____7885 =
                FStar_Util.find_opt (FStar_Ident.lid_equals l)
                  (FStar_Syntax_Util.lids_of_sigelt se) in
              (match uu____7885 with
               | FStar_Pervasives_Native.Some l1 ->
                   FStar_All.pipe_left FStar_Range.string_of_range
                     (FStar_Ident.range_of_lid l1)
               | FStar_Pervasives_Native.None  -> "<unknown>")
          | FStar_Pervasives_Native.None  -> "<unknown>" in
        let uu____7893 =
          let uu____7894 =
            let uu____7899 =
              FStar_Util.format2
                "Duplicate top-level names [%s]; previously declared at %s"
                (FStar_Ident.text_of_lid l) r in
            (uu____7899, (FStar_Ident.range_of_lid l)) in
          FStar_Errors.Error uu____7894 in
        FStar_Exn.raise uu____7893 in
      let globals = FStar_Util.mk_ref env.scope_mods in
      let env1 =
        let uu____7908 =
          match s.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let uu____7917 -> (false, true)
          | FStar_Syntax_Syntax.Sig_bundle uu____7924 -> (false, true)
          | uu____7933 -> (false, false) in
        match uu____7908 with
        | (any_val,exclude_interface) ->
            let lids = FStar_Syntax_Util.lids_of_sigelt s in
            let uu____7939 =
              FStar_Util.find_map lids
                (fun l  ->
                   let uu____7945 =
                     let uu____7946 = unique any_val exclude_interface env l in
                     Prims.op_Negation uu____7946 in
                   if uu____7945
                   then FStar_Pervasives_Native.Some l
                   else FStar_Pervasives_Native.None) in
            (match uu____7939 with
             | FStar_Pervasives_Native.Some l -> err1 l
             | uu____7951 ->
                 (extract_record env globals s;
                  (let uu___198_7969 = env in
                   {
                     curmodule = (uu___198_7969.curmodule);
                     curmonad = (uu___198_7969.curmonad);
                     modules = (uu___198_7969.modules);
                     scope_mods = (uu___198_7969.scope_mods);
                     exported_ids = (uu___198_7969.exported_ids);
                     trans_exported_ids = (uu___198_7969.trans_exported_ids);
                     includes = (uu___198_7969.includes);
                     sigaccum = (s :: (env.sigaccum));
                     sigmap = (uu___198_7969.sigmap);
                     iface = (uu___198_7969.iface);
                     admitted_iface = (uu___198_7969.admitted_iface);
                     expect_typ = (uu___198_7969.expect_typ);
                     docs = (uu___198_7969.docs);
                     remaining_iface_decls =
                       (uu___198_7969.remaining_iface_decls);
                     syntax_only = (uu___198_7969.syntax_only);
                     ds_hooks = (uu___198_7969.ds_hooks)
                   }))) in
      let env2 =
        let uu___199_7971 = env1 in
        let uu____7972 = FStar_ST.op_Bang globals in
        {
          curmodule = (uu___199_7971.curmodule);
          curmonad = (uu___199_7971.curmonad);
          modules = (uu___199_7971.modules);
          scope_mods = uu____7972;
          exported_ids = (uu___199_7971.exported_ids);
          trans_exported_ids = (uu___199_7971.trans_exported_ids);
          includes = (uu___199_7971.includes);
          sigaccum = (uu___199_7971.sigaccum);
          sigmap = (uu___199_7971.sigmap);
          iface = (uu___199_7971.iface);
          admitted_iface = (uu___199_7971.admitted_iface);
          expect_typ = (uu___199_7971.expect_typ);
          docs = (uu___199_7971.docs);
          remaining_iface_decls = (uu___199_7971.remaining_iface_decls);
          syntax_only = (uu___199_7971.syntax_only);
          ds_hooks = (uu___199_7971.ds_hooks)
        } in
      let uu____8041 =
        match s.FStar_Syntax_Syntax.sigel with
        | FStar_Syntax_Syntax.Sig_bundle (ses,uu____8067) ->
            let uu____8076 =
              FStar_List.map
                (fun se  -> ((FStar_Syntax_Util.lids_of_sigelt se), se)) ses in
            (env2, uu____8076)
        | uu____8103 -> (env2, [((FStar_Syntax_Util.lids_of_sigelt s), s)]) in
      match uu____8041 with
      | (env3,lss) ->
          (FStar_All.pipe_right lss
             (FStar_List.iter
                (fun uu____8162  ->
                   match uu____8162 with
                   | (lids,se) ->
                       FStar_All.pipe_right lids
                         (FStar_List.iter
                            (fun lid  ->
                               (let uu____8184 =
                                  let uu____8187 = FStar_ST.op_Bang globals in
                                  (Top_level_def (lid.FStar_Ident.ident)) ::
                                    uu____8187 in
                                FStar_ST.op_Colon_Equals globals uu____8184);
                               (match () with
                                | () ->
                                    let modul =
                                      let uu____8323 =
                                        FStar_Ident.lid_of_ids
                                          lid.FStar_Ident.ns in
                                      uu____8323.FStar_Ident.str in
                                    ((let uu____8325 =
                                        get_exported_id_set env3 modul in
                                      match uu____8325 with
                                      | FStar_Pervasives_Native.Some f ->
                                          let my_exported_ids =
                                            f Exported_id_term_type in
                                          let uu____8351 =
                                            let uu____8352 =
                                              FStar_ST.op_Bang
                                                my_exported_ids in
                                            FStar_Util.set_add
                                              (lid.FStar_Ident.ident).FStar_Ident.idText
                                              uu____8352 in
                                          FStar_ST.op_Colon_Equals
                                            my_exported_ids uu____8351
                                      | FStar_Pervasives_Native.None  -> ());
                                     (match () with
                                      | () ->
                                          let is_iface =
                                            env3.iface &&
                                              (Prims.op_Negation
                                                 env3.admitted_iface) in
                                          FStar_Util.smap_add (sigmap env3)
                                            lid.FStar_Ident.str
                                            (se,
                                              (env3.iface &&
                                                 (Prims.op_Negation
                                                    env3.admitted_iface))))))))));
           (let env4 =
              let uu___200_8489 = env3 in
              let uu____8490 = FStar_ST.op_Bang globals in
              {
                curmodule = (uu___200_8489.curmodule);
                curmonad = (uu___200_8489.curmonad);
                modules = (uu___200_8489.modules);
                scope_mods = uu____8490;
                exported_ids = (uu___200_8489.exported_ids);
                trans_exported_ids = (uu___200_8489.trans_exported_ids);
                includes = (uu___200_8489.includes);
                sigaccum = (uu___200_8489.sigaccum);
                sigmap = (uu___200_8489.sigmap);
                iface = (uu___200_8489.iface);
                admitted_iface = (uu___200_8489.admitted_iface);
                expect_typ = (uu___200_8489.expect_typ);
                docs = (uu___200_8489.docs);
                remaining_iface_decls = (uu___200_8489.remaining_iface_decls);
                syntax_only = (uu___200_8489.syntax_only);
                ds_hooks = (uu___200_8489.ds_hooks)
              } in
            env4))
let push_namespace: env -> FStar_Ident.lident -> env =
  fun env  ->
    fun ns  ->
      let uu____8565 =
        let uu____8570 = resolve_module_name env ns false in
        match uu____8570 with
        | FStar_Pervasives_Native.None  ->
            let modules = env.modules in
            let uu____8584 =
              FStar_All.pipe_right modules
                (FStar_Util.for_some
                   (fun uu____8598  ->
                      match uu____8598 with
                      | (m,uu____8604) ->
                          FStar_Util.starts_with
                            (Prims.strcat (FStar_Ident.text_of_lid m) ".")
                            (Prims.strcat (FStar_Ident.text_of_lid ns) "."))) in
            if uu____8584
            then (ns, Open_namespace)
            else
              (let uu____8610 =
                 let uu____8611 =
                   let uu____8616 =
                     FStar_Util.format1 "Namespace %s cannot be found"
                       (FStar_Ident.text_of_lid ns) in
                   (uu____8616, (FStar_Ident.range_of_lid ns)) in
                 FStar_Errors.Error uu____8611 in
               FStar_Exn.raise uu____8610)
        | FStar_Pervasives_Native.Some ns' ->
            (fail_if_curmodule env ns ns'; (ns', Open_module)) in
      match uu____8565 with
      | (ns',kd) ->
          ((env.ds_hooks).ds_push_open_hook env (ns', kd);
           push_scope_mod env (Open_module_or_namespace (ns', kd)))
let push_include: env -> FStar_Ident.lident -> env =
  fun env  ->
    fun ns  ->
      let ns0 = ns in
      let uu____8633 = resolve_module_name env ns false in
      match uu____8633 with
      | FStar_Pervasives_Native.Some ns1 ->
          ((env.ds_hooks).ds_push_include_hook env ns1;
           fail_if_curmodule env ns0 ns1;
           (let env1 =
              push_scope_mod env
                (Open_module_or_namespace (ns1, Open_module)) in
            let curmod =
              let uu____8641 = current_module env1 in
              uu____8641.FStar_Ident.str in
            (let uu____8643 = FStar_Util.smap_try_find env1.includes curmod in
             match uu____8643 with
             | FStar_Pervasives_Native.None  -> ()
             | FStar_Pervasives_Native.Some incl ->
                 let uu____8667 =
                   let uu____8670 = FStar_ST.op_Bang incl in ns1 ::
                     uu____8670 in
                 FStar_ST.op_Colon_Equals incl uu____8667);
            (match () with
             | () ->
                 let uu____8805 =
                   get_trans_exported_id_set env1 ns1.FStar_Ident.str in
                 (match uu____8805 with
                  | FStar_Pervasives_Native.Some ns_trans_exports ->
                      ((let uu____8822 =
                          let uu____8839 = get_exported_id_set env1 curmod in
                          let uu____8846 =
                            get_trans_exported_id_set env1 curmod in
                          (uu____8839, uu____8846) in
                        match uu____8822 with
                        | (FStar_Pervasives_Native.Some
                           cur_exports,FStar_Pervasives_Native.Some
                           cur_trans_exports) ->
                            let update_exports k =
                              let ns_ex =
                                let uu____8900 = ns_trans_exports k in
                                FStar_ST.op_Bang uu____8900 in
                              let ex = cur_exports k in
                              (let uu____9159 =
                                 let uu____9160 = FStar_ST.op_Bang ex in
                                 FStar_Util.set_difference uu____9160 ns_ex in
                               FStar_ST.op_Colon_Equals ex uu____9159);
                              (match () with
                               | () ->
                                   let trans_ex = cur_trans_exports k in
                                   let uu____9298 =
                                     let uu____9299 =
                                       FStar_ST.op_Bang trans_ex in
                                     FStar_Util.set_union uu____9299 ns_ex in
                                   FStar_ST.op_Colon_Equals trans_ex
                                     uu____9298) in
                            FStar_List.iter update_exports
                              all_exported_id_kinds
                        | uu____9426 -> ());
                       (match () with | () -> env1))
                  | FStar_Pervasives_Native.None  ->
                      let uu____9447 =
                        let uu____9448 =
                          let uu____9453 =
                            FStar_Util.format1
                              "include: Module %s was not prepared"
                              ns1.FStar_Ident.str in
                          (uu____9453, (FStar_Ident.range_of_lid ns1)) in
                        FStar_Errors.Error uu____9448 in
                      FStar_Exn.raise uu____9447))))
      | uu____9454 ->
          let uu____9457 =
            let uu____9458 =
              let uu____9463 =
                FStar_Util.format1 "include: Module %s cannot be found"
                  ns.FStar_Ident.str in
              (uu____9463, (FStar_Ident.range_of_lid ns)) in
            FStar_Errors.Error uu____9458 in
          FStar_Exn.raise uu____9457
let push_module_abbrev: env -> FStar_Ident.ident -> FStar_Ident.lident -> env
  =
  fun env  ->
    fun x  ->
      fun l  ->
        let uu____9473 = module_is_defined env l in
        if uu____9473
        then
          (fail_if_curmodule env l l;
           (env.ds_hooks).ds_push_module_abbrev_hook env x l;
           push_scope_mod env (Module_abbrev (x, l)))
        else
          (let uu____9477 =
             let uu____9478 =
               let uu____9483 =
                 FStar_Util.format1 "Module %s cannot be found"
                   (FStar_Ident.text_of_lid l) in
               (uu____9483, (FStar_Ident.range_of_lid l)) in
             FStar_Errors.Error uu____9478 in
           FStar_Exn.raise uu____9477)
let push_doc:
  env ->
    FStar_Ident.lident ->
      FStar_Parser_AST.fsdoc FStar_Pervasives_Native.option -> env
  =
  fun env  ->
    fun l  ->
      fun doc_opt  ->
        match doc_opt with
        | FStar_Pervasives_Native.None  -> env
        | FStar_Pervasives_Native.Some doc1 ->
            ((let uu____9499 =
                FStar_Util.smap_try_find env.docs l.FStar_Ident.str in
              match uu____9499 with
              | FStar_Pervasives_Native.None  -> ()
              | FStar_Pervasives_Native.Some old_doc ->
                  let uu____9503 =
                    let uu____9504 = FStar_Ident.string_of_lid l in
                    let uu____9505 = FStar_Parser_AST.string_of_fsdoc old_doc in
                    let uu____9506 = FStar_Parser_AST.string_of_fsdoc doc1 in
                    FStar_Util.format3
                      "Overwriting doc of %s; old doc was [%s]; new doc are [%s]"
                      uu____9504 uu____9505 uu____9506 in
                  FStar_Errors.warn (FStar_Ident.range_of_lid l) uu____9503);
             FStar_Util.smap_add env.docs l.FStar_Ident.str doc1;
             env)
let check_admits: env -> Prims.unit =
  fun env  ->
    FStar_All.pipe_right env.sigaccum
      (FStar_List.iter
         (fun se  ->
            match se.FStar_Syntax_Syntax.sigel with
            | FStar_Syntax_Syntax.Sig_declare_typ (l,u,t) ->
                let uu____9522 = try_lookup_lid env l in
                (match uu____9522 with
                 | FStar_Pervasives_Native.None  ->
                     ((let uu____9534 =
                         let uu____9535 = FStar_Options.interactive () in
                         Prims.op_Negation uu____9535 in
                       if uu____9534
                       then
                         let uu____9536 =
                           let uu____9537 =
                             FStar_Syntax_Print.lid_to_string l in
                           FStar_Util.format1
                             "Admitting %s without a definition" uu____9537 in
                         FStar_Errors.warn (FStar_Ident.range_of_lid l)
                           uu____9536
                       else ());
                      (let quals = FStar_Syntax_Syntax.Assumption ::
                         (se.FStar_Syntax_Syntax.sigquals) in
                       FStar_Util.smap_add (sigmap env) l.FStar_Ident.str
                         ((let uu___201_9547 = se in
                           {
                             FStar_Syntax_Syntax.sigel =
                               (uu___201_9547.FStar_Syntax_Syntax.sigel);
                             FStar_Syntax_Syntax.sigrng =
                               (uu___201_9547.FStar_Syntax_Syntax.sigrng);
                             FStar_Syntax_Syntax.sigquals = quals;
                             FStar_Syntax_Syntax.sigmeta =
                               (uu___201_9547.FStar_Syntax_Syntax.sigmeta);
                             FStar_Syntax_Syntax.sigattrs =
                               (uu___201_9547.FStar_Syntax_Syntax.sigattrs)
                           }), false)))
                 | FStar_Pervasives_Native.Some uu____9548 -> ())
            | uu____9557 -> ()))
let finish: env -> FStar_Syntax_Syntax.modul -> env =
  fun env  ->
    fun modul  ->
      FStar_All.pipe_right modul.FStar_Syntax_Syntax.declarations
        (FStar_List.iter
           (fun se  ->
              let quals = se.FStar_Syntax_Syntax.sigquals in
              match se.FStar_Syntax_Syntax.sigel with
              | FStar_Syntax_Syntax.Sig_bundle (ses,uu____9574) ->
                  if
                    (FStar_List.contains FStar_Syntax_Syntax.Private quals)
                      ||
                      (FStar_List.contains FStar_Syntax_Syntax.Abstract quals)
                  then
                    FStar_All.pipe_right ses
                      (FStar_List.iter
                         (fun se1  ->
                            match se1.FStar_Syntax_Syntax.sigel with
                            | FStar_Syntax_Syntax.Sig_datacon
                                (lid,uu____9594,uu____9595,uu____9596,uu____9597,uu____9598)
                                ->
                                FStar_Util.smap_remove (sigmap env)
                                  lid.FStar_Ident.str
                            | uu____9607 -> ()))
                  else ()
              | FStar_Syntax_Syntax.Sig_declare_typ
                  (lid,uu____9610,uu____9611) ->
                  if FStar_List.contains FStar_Syntax_Syntax.Private quals
                  then
                    FStar_Util.smap_remove (sigmap env) lid.FStar_Ident.str
                  else ()
              | FStar_Syntax_Syntax.Sig_let ((uu____9617,lbs),uu____9619) ->
                  (if
                     (FStar_List.contains FStar_Syntax_Syntax.Private quals)
                       ||
                       (FStar_List.contains FStar_Syntax_Syntax.Abstract
                          quals)
                   then
                     FStar_All.pipe_right lbs
                       (FStar_List.iter
                          (fun lb  ->
                             let uu____9640 =
                               let uu____9641 =
                                 let uu____9642 =
                                   let uu____9645 =
                                     FStar_Util.right
                                       lb.FStar_Syntax_Syntax.lbname in
                                   uu____9645.FStar_Syntax_Syntax.fv_name in
                                 uu____9642.FStar_Syntax_Syntax.v in
                               uu____9641.FStar_Ident.str in
                             FStar_Util.smap_remove (sigmap env) uu____9640))
                   else ();
                   if
                     (FStar_List.contains FStar_Syntax_Syntax.Abstract quals)
                       &&
                       (Prims.op_Negation
                          (FStar_List.contains FStar_Syntax_Syntax.Private
                             quals))
                   then
                     FStar_All.pipe_right lbs
                       (FStar_List.iter
                          (fun lb  ->
                             let lid =
                               let uu____9659 =
                                 let uu____9662 =
                                   FStar_Util.right
                                     lb.FStar_Syntax_Syntax.lbname in
                                 uu____9662.FStar_Syntax_Syntax.fv_name in
                               uu____9659.FStar_Syntax_Syntax.v in
                             let quals1 = FStar_Syntax_Syntax.Assumption ::
                               quals in
                             let decl =
                               let uu___202_9667 = se in
                               {
                                 FStar_Syntax_Syntax.sigel =
                                   (FStar_Syntax_Syntax.Sig_declare_typ
                                      (lid, (lb.FStar_Syntax_Syntax.lbunivs),
                                        (lb.FStar_Syntax_Syntax.lbtyp)));
                                 FStar_Syntax_Syntax.sigrng =
                                   (uu___202_9667.FStar_Syntax_Syntax.sigrng);
                                 FStar_Syntax_Syntax.sigquals = quals1;
                                 FStar_Syntax_Syntax.sigmeta =
                                   (uu___202_9667.FStar_Syntax_Syntax.sigmeta);
                                 FStar_Syntax_Syntax.sigattrs =
                                   (uu___202_9667.FStar_Syntax_Syntax.sigattrs)
                               } in
                             FStar_Util.smap_add (sigmap env)
                               lid.FStar_Ident.str (decl, false)))
                   else ())
              | uu____9677 -> ()));
      (let curmod =
         let uu____9679 = current_module env in uu____9679.FStar_Ident.str in
       (let uu____9681 =
          let uu____9698 = get_exported_id_set env curmod in
          let uu____9705 = get_trans_exported_id_set env curmod in
          (uu____9698, uu____9705) in
        match uu____9681 with
        | (FStar_Pervasives_Native.Some cur_ex,FStar_Pervasives_Native.Some
           cur_trans_ex) ->
            let update_exports eikind =
              let cur_ex_set =
                let uu____9759 = cur_ex eikind in FStar_ST.op_Bang uu____9759 in
              let cur_trans_ex_set_ref = cur_trans_ex eikind in
              let uu____10017 =
                let uu____10018 = FStar_ST.op_Bang cur_trans_ex_set_ref in
                FStar_Util.set_union cur_ex_set uu____10018 in
              FStar_ST.op_Colon_Equals cur_trans_ex_set_ref uu____10017 in
            FStar_List.iter update_exports all_exported_id_kinds
        | uu____10145 -> ());
       (match () with
        | () ->
            (filter_record_cache ();
             (match () with
              | () ->
                  let uu___203_10163 = env in
                  {
                    curmodule = FStar_Pervasives_Native.None;
                    curmonad = (uu___203_10163.curmonad);
                    modules = (((modul.FStar_Syntax_Syntax.name), modul) ::
                      (env.modules));
                    scope_mods = [];
                    exported_ids = (uu___203_10163.exported_ids);
                    trans_exported_ids = (uu___203_10163.trans_exported_ids);
                    includes = (uu___203_10163.includes);
                    sigaccum = [];
                    sigmap = (uu___203_10163.sigmap);
                    iface = (uu___203_10163.iface);
                    admitted_iface = (uu___203_10163.admitted_iface);
                    expect_typ = (uu___203_10163.expect_typ);
                    docs = (uu___203_10163.docs);
                    remaining_iface_decls =
                      (uu___203_10163.remaining_iface_decls);
                    syntax_only = (uu___203_10163.syntax_only);
                    ds_hooks = (uu___203_10163.ds_hooks)
                  }))))
let stack: env Prims.list FStar_ST.ref = FStar_Util.mk_ref []
let push: env -> env =
  fun env  ->
    push_record_cache ();
    (let uu____10186 =
       let uu____10189 = FStar_ST.op_Bang stack in env :: uu____10189 in
     FStar_ST.op_Colon_Equals stack uu____10186);
    (let uu___204_10296 = env in
     let uu____10297 = FStar_Util.smap_copy (sigmap env) in
     let uu____10308 = FStar_Util.smap_copy env.docs in
     {
       curmodule = (uu___204_10296.curmodule);
       curmonad = (uu___204_10296.curmonad);
       modules = (uu___204_10296.modules);
       scope_mods = (uu___204_10296.scope_mods);
       exported_ids = (uu___204_10296.exported_ids);
       trans_exported_ids = (uu___204_10296.trans_exported_ids);
       includes = (uu___204_10296.includes);
       sigaccum = (uu___204_10296.sigaccum);
       sigmap = uu____10297;
       iface = (uu___204_10296.iface);
       admitted_iface = (uu___204_10296.admitted_iface);
       expect_typ = (uu___204_10296.expect_typ);
       docs = uu____10308;
       remaining_iface_decls = (uu___204_10296.remaining_iface_decls);
       syntax_only = (uu___204_10296.syntax_only);
       ds_hooks = (uu___204_10296.ds_hooks)
     })
let pop: Prims.unit -> env =
  fun uu____10313  ->
    let uu____10314 = FStar_ST.op_Bang stack in
    match uu____10314 with
    | env::tl1 ->
        (pop_record_cache (); FStar_ST.op_Colon_Equals stack tl1; env)
    | uu____10427 -> failwith "Impossible: Too many pops"
let export_interface: FStar_Ident.lident -> env -> env =
  fun m  ->
    fun env  ->
      let sigelt_in_m se =
        match FStar_Syntax_Util.lids_of_sigelt se with
        | l::uu____10441 -> l.FStar_Ident.nsstr = m.FStar_Ident.str
        | uu____10444 -> false in
      let sm = sigmap env in
      let env1 = pop () in
      let keys = FStar_Util.smap_keys sm in
      let sm' = sigmap env1 in
      FStar_All.pipe_right keys
        (FStar_List.iter
           (fun k  ->
              let uu____10478 = FStar_Util.smap_try_find sm' k in
              match uu____10478 with
              | FStar_Pervasives_Native.Some (se,true ) when sigelt_in_m se
                  ->
                  (FStar_Util.smap_remove sm' k;
                   (let se1 =
                      match se.FStar_Syntax_Syntax.sigel with
                      | FStar_Syntax_Syntax.Sig_declare_typ (l,u,t) ->
                          let uu___205_10503 = se in
                          {
                            FStar_Syntax_Syntax.sigel =
                              (uu___205_10503.FStar_Syntax_Syntax.sigel);
                            FStar_Syntax_Syntax.sigrng =
                              (uu___205_10503.FStar_Syntax_Syntax.sigrng);
                            FStar_Syntax_Syntax.sigquals =
                              (FStar_Syntax_Syntax.Assumption ::
                              (se.FStar_Syntax_Syntax.sigquals));
                            FStar_Syntax_Syntax.sigmeta =
                              (uu___205_10503.FStar_Syntax_Syntax.sigmeta);
                            FStar_Syntax_Syntax.sigattrs =
                              (uu___205_10503.FStar_Syntax_Syntax.sigattrs)
                          }
                      | uu____10504 -> se in
                    FStar_Util.smap_add sm' k (se1, false)))
              | uu____10509 -> ()));
      env1
let finish_module_or_interface: env -> FStar_Syntax_Syntax.modul -> env =
  fun env  ->
    fun modul  ->
      if Prims.op_Negation modul.FStar_Syntax_Syntax.is_interface
      then check_admits env
      else ();
      finish env modul
type exported_ids =
  {
  exported_id_terms: Prims.string Prims.list;
  exported_id_fields: Prims.string Prims.list;}[@@deriving show]
let __proj__Mkexported_ids__item__exported_id_terms:
  exported_ids -> Prims.string Prims.list =
  fun projectee  ->
    match projectee with
    | { exported_id_terms = __fname__exported_id_terms;
        exported_id_fields = __fname__exported_id_fields;_} ->
        __fname__exported_id_terms
let __proj__Mkexported_ids__item__exported_id_fields:
  exported_ids -> Prims.string Prims.list =
  fun projectee  ->
    match projectee with
    | { exported_id_terms = __fname__exported_id_terms;
        exported_id_fields = __fname__exported_id_fields;_} ->
        __fname__exported_id_fields
let as_exported_ids: exported_id_set -> exported_ids =
  fun e  ->
    let terms =
      let uu____10589 =
        let uu____10592 = e Exported_id_term_type in
        FStar_ST.op_Bang uu____10592 in
      FStar_Util.set_elements uu____10589 in
    let fields =
      let uu____10843 =
        let uu____10846 = e Exported_id_field in FStar_ST.op_Bang uu____10846 in
      FStar_Util.set_elements uu____10843 in
    { exported_id_terms = terms; exported_id_fields = fields }
let as_exported_id_set:
  exported_ids FStar_Pervasives_Native.option ->
    exported_id_kind -> Prims.string FStar_Util.set FStar_ST.ref
  =
  fun e  ->
    match e with
    | FStar_Pervasives_Native.None  -> exported_id_set_new ()
    | FStar_Pervasives_Native.Some e1 ->
        let terms =
          let uu____11126 =
            FStar_Util.as_set e1.exported_id_terms FStar_Util.compare in
          FStar_Util.mk_ref uu____11126 in
        let fields =
          let uu____11136 =
            FStar_Util.as_set e1.exported_id_fields FStar_Util.compare in
          FStar_Util.mk_ref uu____11136 in
        (fun uu___183_11141  ->
           match uu___183_11141 with
           | Exported_id_term_type  -> terms
           | Exported_id_field  -> fields)
type module_inclusion_info =
  {
  mii_exported_ids: exported_ids FStar_Pervasives_Native.option;
  mii_trans_exported_ids: exported_ids FStar_Pervasives_Native.option;
  mii_includes: FStar_Ident.lident Prims.list FStar_Pervasives_Native.option;}
[@@deriving show]
let __proj__Mkmodule_inclusion_info__item__mii_exported_ids:
  module_inclusion_info -> exported_ids FStar_Pervasives_Native.option =
  fun projectee  ->
    match projectee with
    | { mii_exported_ids = __fname__mii_exported_ids;
        mii_trans_exported_ids = __fname__mii_trans_exported_ids;
        mii_includes = __fname__mii_includes;_} -> __fname__mii_exported_ids
let __proj__Mkmodule_inclusion_info__item__mii_trans_exported_ids:
  module_inclusion_info -> exported_ids FStar_Pervasives_Native.option =
  fun projectee  ->
    match projectee with
    | { mii_exported_ids = __fname__mii_exported_ids;
        mii_trans_exported_ids = __fname__mii_trans_exported_ids;
        mii_includes = __fname__mii_includes;_} ->
        __fname__mii_trans_exported_ids
let __proj__Mkmodule_inclusion_info__item__mii_includes:
  module_inclusion_info ->
    FStar_Ident.lident Prims.list FStar_Pervasives_Native.option
  =
  fun projectee  ->
    match projectee with
    | { mii_exported_ids = __fname__mii_exported_ids;
        mii_trans_exported_ids = __fname__mii_trans_exported_ids;
        mii_includes = __fname__mii_includes;_} -> __fname__mii_includes
let default_mii: module_inclusion_info =
  {
    mii_exported_ids = FStar_Pervasives_Native.None;
    mii_trans_exported_ids = FStar_Pervasives_Native.None;
    mii_includes = FStar_Pervasives_Native.None
  }
let as_includes:
  'Auu____11249 .
    'Auu____11249 Prims.list FStar_Pervasives_Native.option ->
      'Auu____11249 Prims.list FStar_ST.ref
  =
  fun uu___184_11261  ->
    match uu___184_11261 with
    | FStar_Pervasives_Native.None  -> FStar_Util.mk_ref []
    | FStar_Pervasives_Native.Some l -> FStar_Util.mk_ref l
let inclusion_info: env -> FStar_Ident.lident -> module_inclusion_info =
  fun env  ->
    fun l  ->
      let mname = FStar_Ident.string_of_lid l in
      let as_ids_opt m =
        let uu____11294 = FStar_Util.smap_try_find m mname in
        FStar_Util.map_opt uu____11294 as_exported_ids in
      let uu____11297 = as_ids_opt env.exported_ids in
      let uu____11300 = as_ids_opt env.trans_exported_ids in
      let uu____11303 =
        let uu____11308 = FStar_Util.smap_try_find env.includes mname in
        FStar_Util.map_opt uu____11308 (fun r  -> FStar_ST.op_Bang r) in
      {
        mii_exported_ids = uu____11297;
        mii_trans_exported_ids = uu____11300;
        mii_includes = uu____11303
      }
let prepare_module_or_interface:
  Prims.bool ->
    Prims.bool ->
      env ->
        FStar_Ident.lident ->
          module_inclusion_info ->
            (env,Prims.bool) FStar_Pervasives_Native.tuple2
  =
  fun intf  ->
    fun admitted  ->
      fun env  ->
        fun mname  ->
          fun mii  ->
            let prep env1 =
              let filename =
                FStar_Util.strcat (FStar_Ident.text_of_lid mname) ".fst" in
              let auto_open =
                FStar_Parser_Dep.hard_coded_dependencies filename in
              let auto_open1 =
                let convert_kind uu___185_11445 =
                  match uu___185_11445 with
                  | FStar_Parser_Dep.Open_namespace  -> Open_namespace
                  | FStar_Parser_Dep.Open_module  -> Open_module in
                FStar_List.map
                  (fun uu____11457  ->
                     match uu____11457 with
                     | (lid,kind) -> (lid, (convert_kind kind))) auto_open in
              let namespace_of_module =
                if
                  (FStar_List.length mname.FStar_Ident.ns) >
                    (Prims.parse_int "0")
                then
                  let uu____11481 =
                    let uu____11486 =
                      FStar_Ident.lid_of_ids mname.FStar_Ident.ns in
                    (uu____11486, Open_namespace) in
                  [uu____11481]
                else [] in
              let auto_open2 =
                FStar_List.append namespace_of_module
                  (FStar_List.rev auto_open1) in
              (let uu____11516 = as_exported_id_set mii.mii_exported_ids in
               FStar_Util.smap_add env1.exported_ids mname.FStar_Ident.str
                 uu____11516);
              (match () with
               | () ->
                   ((let uu____11532 =
                       as_exported_id_set mii.mii_trans_exported_ids in
                     FStar_Util.smap_add env1.trans_exported_ids
                       mname.FStar_Ident.str uu____11532);
                    (match () with
                     | () ->
                         ((let uu____11548 = as_includes mii.mii_includes in
                           FStar_Util.smap_add env1.includes
                             mname.FStar_Ident.str uu____11548);
                          (match () with
                           | () ->
                               let env' =
                                 let uu___206_11572 = env1 in
                                 let uu____11573 =
                                   FStar_List.map
                                     (fun x  -> Open_module_or_namespace x)
                                     auto_open2 in
                                 {
                                   curmodule =
                                     (FStar_Pervasives_Native.Some mname);
                                   curmonad = (uu___206_11572.curmonad);
                                   modules = (uu___206_11572.modules);
                                   scope_mods = uu____11573;
                                   exported_ids =
                                     (uu___206_11572.exported_ids);
                                   trans_exported_ids =
                                     (uu___206_11572.trans_exported_ids);
                                   includes = (uu___206_11572.includes);
                                   sigaccum = (uu___206_11572.sigaccum);
                                   sigmap = (env1.sigmap);
                                   iface = intf;
                                   admitted_iface = admitted;
                                   expect_typ = (uu___206_11572.expect_typ);
                                   docs = (uu___206_11572.docs);
                                   remaining_iface_decls =
                                     (uu___206_11572.remaining_iface_decls);
                                   syntax_only = (uu___206_11572.syntax_only);
                                   ds_hooks = (uu___206_11572.ds_hooks)
                                 } in
                               (FStar_List.iter
                                  (fun op  ->
                                     (env1.ds_hooks).ds_push_open_hook env'
                                       op) (FStar_List.rev auto_open2);
                                env')))))) in
            let uu____11585 =
              FStar_All.pipe_right env.modules
                (FStar_Util.find_opt
                   (fun uu____11611  ->
                      match uu____11611 with
                      | (l,uu____11617) -> FStar_Ident.lid_equals l mname)) in
            match uu____11585 with
            | FStar_Pervasives_Native.None  ->
                let uu____11626 = prep env in (uu____11626, false)
            | FStar_Pervasives_Native.Some (uu____11627,m) ->
                ((let uu____11634 =
                    (let uu____11637 = FStar_Options.interactive () in
                     Prims.op_Negation uu____11637) &&
                      ((Prims.op_Negation m.FStar_Syntax_Syntax.is_interface)
                         || intf) in
                  if uu____11634
                  then
                    let uu____11638 =
                      let uu____11639 =
                        let uu____11644 =
                          FStar_Util.format1
                            "Duplicate module or interface name: %s"
                            mname.FStar_Ident.str in
                        (uu____11644, (FStar_Ident.range_of_lid mname)) in
                      FStar_Errors.Error uu____11639 in
                    FStar_Exn.raise uu____11638
                  else ());
                 (let uu____11646 =
                    let uu____11647 = push env in prep uu____11647 in
                  (uu____11646, true)))
let enter_monad_scope: env -> FStar_Ident.ident -> env =
  fun env  ->
    fun mname  ->
      match env.curmonad with
      | FStar_Pervasives_Native.Some mname' ->
          FStar_Exn.raise
            (FStar_Errors.Error
               ((Prims.strcat "Trying to define monad "
                   (Prims.strcat mname.FStar_Ident.idText
                      (Prims.strcat ", but already in monad scope "
                         mname'.FStar_Ident.idText))),
                 (mname.FStar_Ident.idRange)))
      | FStar_Pervasives_Native.None  ->
          let uu___207_11655 = env in
          {
            curmodule = (uu___207_11655.curmodule);
            curmonad = (FStar_Pervasives_Native.Some mname);
            modules = (uu___207_11655.modules);
            scope_mods = (uu___207_11655.scope_mods);
            exported_ids = (uu___207_11655.exported_ids);
            trans_exported_ids = (uu___207_11655.trans_exported_ids);
            includes = (uu___207_11655.includes);
            sigaccum = (uu___207_11655.sigaccum);
            sigmap = (uu___207_11655.sigmap);
            iface = (uu___207_11655.iface);
            admitted_iface = (uu___207_11655.admitted_iface);
            expect_typ = (uu___207_11655.expect_typ);
            docs = (uu___207_11655.docs);
            remaining_iface_decls = (uu___207_11655.remaining_iface_decls);
            syntax_only = (uu___207_11655.syntax_only);
            ds_hooks = (uu___207_11655.ds_hooks)
          }
let fail_or:
  'a .
    env ->
      (FStar_Ident.lident -> 'a FStar_Pervasives_Native.option) ->
        FStar_Ident.lident -> 'a
  =
  fun env  ->
    fun lookup  ->
      fun lid  ->
        let uu____11682 = lookup lid in
        match uu____11682 with
        | FStar_Pervasives_Native.None  ->
            let opened_modules =
              FStar_List.map
                (fun uu____11695  ->
                   match uu____11695 with
                   | (lid1,uu____11701) -> FStar_Ident.text_of_lid lid1)
                env.modules in
            let msg =
              FStar_Util.format1 "Identifier not found: [%s]"
                (FStar_Ident.text_of_lid lid) in
            let msg1 =
              if
                (FStar_List.length lid.FStar_Ident.ns) =
                  (Prims.parse_int "0")
              then msg
              else
                (let modul =
                   let uu____11706 =
                     FStar_Ident.lid_of_ids lid.FStar_Ident.ns in
                   FStar_Ident.set_lid_range uu____11706
                     (FStar_Ident.range_of_lid lid) in
                 let uu____11707 = resolve_module_name env modul true in
                 match uu____11707 with
                 | FStar_Pervasives_Native.None  ->
                     let opened_modules1 =
                       FStar_String.concat ", " opened_modules in
                     FStar_Util.format3
                       "%s\nModule %s does not belong to the list of modules in scope, namely %s"
                       msg modul.FStar_Ident.str opened_modules1
                 | FStar_Pervasives_Native.Some modul' when
                     Prims.op_Negation
                       (FStar_List.existsb
                          (fun m  -> m = modul'.FStar_Ident.str)
                          opened_modules)
                     ->
                     let opened_modules1 =
                       FStar_String.concat ", " opened_modules in
                     FStar_Util.format4
                       "%s\nModule %s resolved into %s, which does not belong to the list of modules in scope, namely %s"
                       msg modul.FStar_Ident.str modul'.FStar_Ident.str
                       opened_modules1
                 | FStar_Pervasives_Native.Some modul' ->
                     FStar_Util.format4
                       "%s\nModule %s resolved into %s, definition %s not found"
                       msg modul.FStar_Ident.str modul'.FStar_Ident.str
                       (lid.FStar_Ident.ident).FStar_Ident.idText) in
            FStar_Exn.raise
              (FStar_Errors.Error (msg1, (FStar_Ident.range_of_lid lid)))
        | FStar_Pervasives_Native.Some r -> r
let fail_or2:
  'a .
    (FStar_Ident.ident -> 'a FStar_Pervasives_Native.option) ->
      FStar_Ident.ident -> 'a
  =
  fun lookup  ->
    fun id1  ->
      let uu____11738 = lookup id1 in
      match uu____11738 with
      | FStar_Pervasives_Native.None  ->
          FStar_Exn.raise
            (FStar_Errors.Error
               ((Prims.strcat "Identifier not found ["
                   (Prims.strcat id1.FStar_Ident.idText "]")),
                 (id1.FStar_Ident.idRange)))
      | FStar_Pervasives_Native.Some r -> r