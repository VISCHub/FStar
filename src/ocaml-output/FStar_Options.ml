open Prims
type debug_level_t =
  | Low
  | Medium
  | High
  | Extreme
  | Other of Prims.string[@@deriving show]
let uu___is_Low: debug_level_t -> Prims.bool =
  fun projectee  -> match projectee with | Low  -> true | uu____8 -> false
let uu___is_Medium: debug_level_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Medium  -> true | uu____12 -> false
let uu___is_High: debug_level_t -> Prims.bool =
  fun projectee  -> match projectee with | High  -> true | uu____16 -> false
let uu___is_Extreme: debug_level_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Extreme  -> true | uu____20 -> false
let uu___is_Other: debug_level_t -> Prims.bool =
  fun projectee  ->
    match projectee with | Other _0 -> true | uu____25 -> false
let __proj__Other__item___0: debug_level_t -> Prims.string =
  fun projectee  -> match projectee with | Other _0 -> _0
type option_val =
  | Bool of Prims.bool
  | String of Prims.string
  | Path of Prims.string
  | Int of Prims.int
  | List of option_val Prims.list
  | Unset[@@deriving show]
let uu___is_Bool: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | Bool _0 -> true | uu____59 -> false
let __proj__Bool__item___0: option_val -> Prims.bool =
  fun projectee  -> match projectee with | Bool _0 -> _0
let uu___is_String: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | String _0 -> true | uu____71 -> false
let __proj__String__item___0: option_val -> Prims.string =
  fun projectee  -> match projectee with | String _0 -> _0
let uu___is_Path: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | Path _0 -> true | uu____83 -> false
let __proj__Path__item___0: option_val -> Prims.string =
  fun projectee  -> match projectee with | Path _0 -> _0
let uu___is_Int: option_val -> Prims.bool =
  fun projectee  -> match projectee with | Int _0 -> true | uu____95 -> false
let __proj__Int__item___0: option_val -> Prims.int =
  fun projectee  -> match projectee with | Int _0 -> _0
let uu___is_List: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | List _0 -> true | uu____109 -> false
let __proj__List__item___0: option_val -> option_val Prims.list =
  fun projectee  -> match projectee with | List _0 -> _0
let uu___is_Unset: option_val -> Prims.bool =
  fun projectee  ->
    match projectee with | Unset  -> true | uu____126 -> false
let mk_bool: Prims.bool -> option_val = fun _0_27  -> Bool _0_27
let mk_string: Prims.string -> option_val = fun _0_28  -> String _0_28
let mk_path: Prims.string -> option_val = fun _0_29  -> Path _0_29
let mk_int: Prims.int -> option_val = fun _0_30  -> Int _0_30
let mk_list: option_val Prims.list -> option_val = fun _0_31  -> List _0_31
type options =
  | Set
  | Reset
  | Restore[@@deriving show]
let uu___is_Set: options -> Prims.bool =
  fun projectee  -> match projectee with | Set  -> true | uu____142 -> false
let uu___is_Reset: options -> Prims.bool =
  fun projectee  ->
    match projectee with | Reset  -> true | uu____146 -> false
let uu___is_Restore: options -> Prims.bool =
  fun projectee  ->
    match projectee with | Restore  -> true | uu____150 -> false
let __unit_tests__: Prims.bool FStar_ST.ref = FStar_Util.mk_ref false
let __unit_tests: Prims.unit -> Prims.bool =
  fun uu____162  -> FStar_ST.op_Bang __unit_tests__
let __set_unit_tests: Prims.unit -> Prims.unit =
  fun uu____213  -> FStar_ST.op_Colon_Equals __unit_tests__ true
let __clear_unit_tests: Prims.unit -> Prims.unit =
  fun uu____264  -> FStar_ST.op_Colon_Equals __unit_tests__ false
let as_bool: option_val -> Prims.bool =
  fun uu___35_315  ->
    match uu___35_315 with
    | Bool b -> b
    | uu____317 -> failwith "Impos: expected Bool"
let as_int: option_val -> Prims.int =
  fun uu___36_320  ->
    match uu___36_320 with
    | Int b -> b
    | uu____322 -> failwith "Impos: expected Int"
let as_string: option_val -> Prims.string =
  fun uu___37_325  ->
    match uu___37_325 with
    | String b -> b
    | Path b -> FStar_Common.try_convert_file_name_to_mixed b
    | uu____328 -> failwith "Impos: expected String"
let as_list': option_val -> option_val Prims.list =
  fun uu___38_333  ->
    match uu___38_333 with
    | List ts -> ts
    | uu____339 -> failwith "Impos: expected List"
let as_list:
  'Auu____345 .
    (option_val -> 'Auu____345) -> option_val -> 'Auu____345 Prims.list
  =
  fun as_t  ->
    fun x  ->
      let uu____361 = as_list' x in
      FStar_All.pipe_right uu____361 (FStar_List.map as_t)
let as_option:
  'Auu____371 .
    (option_val -> 'Auu____371) ->
      option_val -> 'Auu____371 FStar_Pervasives_Native.option
  =
  fun as_t  ->
    fun uu___39_384  ->
      match uu___39_384 with
      | Unset  -> FStar_Pervasives_Native.None
      | v1 ->
          let uu____388 = as_t v1 in FStar_Pervasives_Native.Some uu____388
type optionstate = option_val FStar_Util.smap[@@deriving show]
let fstar_options: optionstate Prims.list FStar_ST.ref = FStar_Util.mk_ref []
let peek: Prims.unit -> optionstate =
  fun uu____406  ->
    let uu____407 = FStar_ST.op_Bang fstar_options in FStar_List.hd uu____407
let pop: Prims.unit -> Prims.unit =
  fun uu____464  ->
    let uu____465 = FStar_ST.op_Bang fstar_options in
    match uu____465 with
    | [] -> failwith "TOO MANY POPS!"
    | uu____520::[] -> failwith "TOO MANY POPS!"
    | uu____521::tl1 -> FStar_ST.op_Colon_Equals fstar_options tl1
let push: Prims.unit -> Prims.unit =
  fun uu____579  ->
    let uu____580 =
      let uu____583 =
        let uu____586 = peek () in FStar_Util.smap_copy uu____586 in
      let uu____589 = FStar_ST.op_Bang fstar_options in uu____583 ::
        uu____589 in
    FStar_ST.op_Colon_Equals fstar_options uu____580
let set: optionstate -> Prims.unit =
  fun o  ->
    let uu____703 = FStar_ST.op_Bang fstar_options in
    match uu____703 with
    | [] -> failwith "set on empty option stack"
    | uu____758::os -> FStar_ST.op_Colon_Equals fstar_options (o :: os)
let set_option: Prims.string -> option_val -> Prims.unit =
  fun k  ->
    fun v1  -> let uu____820 = peek () in FStar_Util.smap_add uu____820 k v1
let set_option':
  (Prims.string,option_val) FStar_Pervasives_Native.tuple2 -> Prims.unit =
  fun uu____829  -> match uu____829 with | (k,v1) -> set_option k v1
let with_saved_options: 'a . (Prims.unit -> 'a) -> 'a =
  fun f  -> push (); (let retv = f () in pop (); retv)
let light_off_files: Prims.string Prims.list FStar_ST.ref =
  FStar_Util.mk_ref []
let add_light_off_file: Prims.string -> Prims.unit =
  fun filename  ->
    let uu____867 =
      let uu____870 = FStar_ST.op_Bang light_off_files in filename ::
        uu____870 in
    FStar_ST.op_Colon_Equals light_off_files uu____867
let defaults:
  (Prims.string,option_val) FStar_Pervasives_Native.tuple2 Prims.list =
  [("__temp_no_proj", (List []));
  ("admit_smt_queries", (Bool false));
  ("admit_except", Unset);
  ("cache_checked_modules", (Bool false));
  ("codegen", Unset);
  ("codegen-lib", (List []));
  ("debug", (List []));
  ("debug_level", (List []));
  ("dep", Unset);
  ("detail_errors", (Bool false));
  ("detail_hint_replay", (Bool false));
  ("doc", (Bool false));
  ("dump_module", (List []));
  ("eager_inference", (Bool false));
  ("expose_interfaces", (Bool false));
  ("extract_all", (Bool false));
  ("extract_module", (List []));
  ("extract_namespace", (List []));
  ("fs_typ_app", (Bool false));
  ("fstar_home", Unset);
  ("full_context_dependency", (Bool true));
  ("gen_native_tactics", Unset);
  ("hide_uvar_nums", (Bool false));
  ("hint_info", (Bool false));
  ("hint_file", Unset);
  ("in", (Bool false));
  ("ide", (Bool false));
  ("include", (List []));
  ("indent", (Bool false));
  ("initial_fuel", (Int (Prims.parse_int "2")));
  ("initial_ifuel", (Int (Prims.parse_int "1")));
  ("lax", (Bool false));
  ("load", (List []));
  ("log_queries", (Bool false));
  ("log_types", (Bool false));
  ("max_fuel", (Int (Prims.parse_int "8")));
  ("max_ifuel", (Int (Prims.parse_int "2")));
  ("min_fuel", (Int (Prims.parse_int "1")));
  ("MLish", (Bool false));
  ("n_cores", (Int (Prims.parse_int "1")));
  ("no_default_includes", (Bool false));
  ("no_extract", (List []));
  ("no_location_info", (Bool false));
  ("no_tactics", (Bool false));
  ("odir", Unset);
  ("prims", Unset);
  ("pretype", (Bool true));
  ("prims_ref", Unset);
  ("print_bound_var_types", (Bool false));
  ("print_effect_args", (Bool false));
  ("print_full_names", (Bool false));
  ("print_implicits", (Bool false));
  ("print_universes", (Bool false));
  ("print_z3_statistics", (Bool false));
  ("prn", (Bool false));
  ("query_stats", (Bool false));
  ("record_hints", (Bool false));
  ("reuse_hint_for", Unset);
  ("silent", (Bool false));
  ("smt", Unset);
  ("smtencoding.elim_box", (Bool false));
  ("smtencoding.nl_arith_repr", (String "boxwrap"));
  ("smtencoding.l_arith_repr", (String "boxwrap"));
  ("split_cases", (Int (Prims.parse_int "0")));
  ("tactic_raw_binders", (Bool false));
  ("tactic_trace", (Bool false));
  ("tactic_trace_d", (Int (Prims.parse_int "0")));
  ("timing", (Bool false));
  ("trace_error", (Bool false));
  ("ugly", (Bool false));
  ("unthrottle_inductives", (Bool false));
  ("unsafe_tactic_exec", (Bool false));
  ("use_native_tactics", Unset);
  ("use_eq_at_higher_order", (Bool false));
  ("use_hints", (Bool false));
  ("use_hint_hashes", (Bool false));
  ("using_facts_from", Unset);
  ("verify_module", (List []));
  ("warn_default_effects", (Bool false));
  ("z3refresh", (Bool false));
  ("z3rlimit", (Int (Prims.parse_int "5")));
  ("z3rlimit_factor", (Int (Prims.parse_int "1")));
  ("z3seed", (Int (Prims.parse_int "0")));
  ("z3cliopt", (List []));
  ("use_two_phase_tc", (Bool false));
  ("__no_positivity", (Bool false));
  ("__ml_no_eta_expand_coertions", (Bool false))]
let init: Prims.unit -> Prims.unit =
  fun uu____1337  ->
    let o = peek () in
    FStar_Util.smap_clear o;
    FStar_All.pipe_right defaults (FStar_List.iter set_option')
let clear: Prims.unit -> Prims.unit =
  fun uu____1352  ->
    let o = FStar_Util.smap_create (Prims.parse_int "50") in
    FStar_ST.op_Colon_Equals fstar_options [o];
    FStar_ST.op_Colon_Equals light_off_files [];
    init ()
let _run: Prims.unit = clear ()
let get_option: Prims.string -> option_val =
  fun s  ->
    let uu____1469 =
      let uu____1472 = peek () in FStar_Util.smap_try_find uu____1472 s in
    match uu____1469 with
    | FStar_Pervasives_Native.None  ->
        failwith
          (Prims.strcat "Impossible: option " (Prims.strcat s " not found"))
    | FStar_Pervasives_Native.Some s1 -> s1
let lookup_opt:
  'Auu____1479 . Prims.string -> (option_val -> 'Auu____1479) -> 'Auu____1479
  = fun s  -> fun c  -> c (get_option s)
let get_admit_smt_queries: Prims.unit -> Prims.bool =
  fun uu____1495  -> lookup_opt "admit_smt_queries" as_bool
let get_admit_except:
  Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1500  -> lookup_opt "admit_except" (as_option as_string)
let get_cache_checked_modules: Prims.unit -> Prims.bool =
  fun uu____1505  -> lookup_opt "cache_checked_modules" as_bool
let get_codegen: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1510  -> lookup_opt "codegen" (as_option as_string)
let get_codegen_lib: Prims.unit -> Prims.string Prims.list =
  fun uu____1517  -> lookup_opt "codegen-lib" (as_list as_string)
let get_debug: Prims.unit -> Prims.string Prims.list =
  fun uu____1524  -> lookup_opt "debug" (as_list as_string)
let get_debug_level: Prims.unit -> Prims.string Prims.list =
  fun uu____1531  -> lookup_opt "debug_level" (as_list as_string)
let get_dep: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1538  -> lookup_opt "dep" (as_option as_string)
let get_detail_errors: Prims.unit -> Prims.bool =
  fun uu____1543  -> lookup_opt "detail_errors" as_bool
let get_detail_hint_replay: Prims.unit -> Prims.bool =
  fun uu____1546  -> lookup_opt "detail_hint_replay" as_bool
let get_doc: Prims.unit -> Prims.bool =
  fun uu____1549  -> lookup_opt "doc" as_bool
let get_dump_module: Prims.unit -> Prims.string Prims.list =
  fun uu____1554  -> lookup_opt "dump_module" (as_list as_string)
let get_eager_inference: Prims.unit -> Prims.bool =
  fun uu____1559  -> lookup_opt "eager_inference" as_bool
let get_expose_interfaces: Prims.unit -> Prims.bool =
  fun uu____1562  -> lookup_opt "expose_interfaces" as_bool
let get_extract_module: Prims.unit -> Prims.string Prims.list =
  fun uu____1567  -> lookup_opt "extract_module" (as_list as_string)
let get_extract_namespace: Prims.unit -> Prims.string Prims.list =
  fun uu____1574  -> lookup_opt "extract_namespace" (as_list as_string)
let get_fs_typ_app: Prims.unit -> Prims.bool =
  fun uu____1579  -> lookup_opt "fs_typ_app" as_bool
let get_fstar_home: Prims.unit -> Prims.string FStar_Pervasives_Native.option
  = fun uu____1584  -> lookup_opt "fstar_home" (as_option as_string)
let get_gen_native_tactics:
  Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1591  -> lookup_opt "gen_native_tactics" (as_option as_string)
let get_hide_uvar_nums: Prims.unit -> Prims.bool =
  fun uu____1596  -> lookup_opt "hide_uvar_nums" as_bool
let get_hint_info: Prims.unit -> Prims.bool =
  fun uu____1599  -> lookup_opt "hint_info" as_bool
let get_hint_file: Prims.unit -> Prims.string FStar_Pervasives_Native.option
  = fun uu____1604  -> lookup_opt "hint_file" (as_option as_string)
let get_in: Prims.unit -> Prims.bool =
  fun uu____1609  -> lookup_opt "in" as_bool
let get_ide: Prims.unit -> Prims.bool =
  fun uu____1612  -> lookup_opt "ide" as_bool
let get_include: Prims.unit -> Prims.string Prims.list =
  fun uu____1617  -> lookup_opt "include" (as_list as_string)
let get_indent: Prims.unit -> Prims.bool =
  fun uu____1622  -> lookup_opt "indent" as_bool
let get_initial_fuel: Prims.unit -> Prims.int =
  fun uu____1625  -> lookup_opt "initial_fuel" as_int
let get_initial_ifuel: Prims.unit -> Prims.int =
  fun uu____1628  -> lookup_opt "initial_ifuel" as_int
let get_lax: Prims.unit -> Prims.bool =
  fun uu____1631  -> lookup_opt "lax" as_bool
let get_load: Prims.unit -> Prims.string Prims.list =
  fun uu____1636  -> lookup_opt "load" (as_list as_string)
let get_log_queries: Prims.unit -> Prims.bool =
  fun uu____1641  -> lookup_opt "log_queries" as_bool
let get_log_types: Prims.unit -> Prims.bool =
  fun uu____1644  -> lookup_opt "log_types" as_bool
let get_max_fuel: Prims.unit -> Prims.int =
  fun uu____1647  -> lookup_opt "max_fuel" as_int
let get_max_ifuel: Prims.unit -> Prims.int =
  fun uu____1650  -> lookup_opt "max_ifuel" as_int
let get_min_fuel: Prims.unit -> Prims.int =
  fun uu____1653  -> lookup_opt "min_fuel" as_int
let get_MLish: Prims.unit -> Prims.bool =
  fun uu____1656  -> lookup_opt "MLish" as_bool
let get_n_cores: Prims.unit -> Prims.int =
  fun uu____1659  -> lookup_opt "n_cores" as_int
let get_no_default_includes: Prims.unit -> Prims.bool =
  fun uu____1662  -> lookup_opt "no_default_includes" as_bool
let get_no_extract: Prims.unit -> Prims.string Prims.list =
  fun uu____1667  -> lookup_opt "no_extract" (as_list as_string)
let get_no_location_info: Prims.unit -> Prims.bool =
  fun uu____1672  -> lookup_opt "no_location_info" as_bool
let get_odir: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1677  -> lookup_opt "odir" (as_option as_string)
let get_ugly: Prims.unit -> Prims.bool =
  fun uu____1682  -> lookup_opt "ugly" as_bool
let get_prims: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1687  -> lookup_opt "prims" (as_option as_string)
let get_print_bound_var_types: Prims.unit -> Prims.bool =
  fun uu____1692  -> lookup_opt "print_bound_var_types" as_bool
let get_print_effect_args: Prims.unit -> Prims.bool =
  fun uu____1695  -> lookup_opt "print_effect_args" as_bool
let get_print_full_names: Prims.unit -> Prims.bool =
  fun uu____1698  -> lookup_opt "print_full_names" as_bool
let get_print_implicits: Prims.unit -> Prims.bool =
  fun uu____1701  -> lookup_opt "print_implicits" as_bool
let get_print_universes: Prims.unit -> Prims.bool =
  fun uu____1704  -> lookup_opt "print_universes" as_bool
let get_print_z3_statistics: Prims.unit -> Prims.bool =
  fun uu____1707  -> lookup_opt "print_z3_statistics" as_bool
let get_prn: Prims.unit -> Prims.bool =
  fun uu____1710  -> lookup_opt "prn" as_bool
let get_query_stats: Prims.unit -> Prims.bool =
  fun uu____1713  -> lookup_opt "query_stats" as_bool
let get_record_hints: Prims.unit -> Prims.bool =
  fun uu____1716  -> lookup_opt "record_hints" as_bool
let get_reuse_hint_for:
  Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1721  -> lookup_opt "reuse_hint_for" (as_option as_string)
let get_silent: Prims.unit -> Prims.bool =
  fun uu____1726  -> lookup_opt "silent" as_bool
let get_smt: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1731  -> lookup_opt "smt" (as_option as_string)
let get_smtencoding_elim_box: Prims.unit -> Prims.bool =
  fun uu____1736  -> lookup_opt "smtencoding.elim_box" as_bool
let get_smtencoding_nl_arith_repr: Prims.unit -> Prims.string =
  fun uu____1739  -> lookup_opt "smtencoding.nl_arith_repr" as_string
let get_smtencoding_l_arith_repr: Prims.unit -> Prims.string =
  fun uu____1742  -> lookup_opt "smtencoding.l_arith_repr" as_string
let get_split_cases: Prims.unit -> Prims.int =
  fun uu____1745  -> lookup_opt "split_cases" as_int
let get_tactic_raw_binders: Prims.unit -> Prims.bool =
  fun uu____1748  -> lookup_opt "tactic_raw_binders" as_bool
let get_tactic_trace: Prims.unit -> Prims.bool =
  fun uu____1751  -> lookup_opt "tactic_trace" as_bool
let get_tactic_trace_d: Prims.unit -> Prims.int =
  fun uu____1754  -> lookup_opt "tactic_trace_d" as_int
let get_timing: Prims.unit -> Prims.bool =
  fun uu____1757  -> lookup_opt "timing" as_bool
let get_trace_error: Prims.unit -> Prims.bool =
  fun uu____1760  -> lookup_opt "trace_error" as_bool
let get_unthrottle_inductives: Prims.unit -> Prims.bool =
  fun uu____1763  -> lookup_opt "unthrottle_inductives" as_bool
let get_unsafe_tactic_exec: Prims.unit -> Prims.bool =
  fun uu____1766  -> lookup_opt "unsafe_tactic_exec" as_bool
let get_use_eq_at_higher_order: Prims.unit -> Prims.bool =
  fun uu____1769  -> lookup_opt "use_eq_at_higher_order" as_bool
let get_use_hints: Prims.unit -> Prims.bool =
  fun uu____1772  -> lookup_opt "use_hints" as_bool
let get_use_hint_hashes: Prims.unit -> Prims.bool =
  fun uu____1775  -> lookup_opt "use_hint_hashes" as_bool
let get_use_native_tactics:
  Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____1780  -> lookup_opt "use_native_tactics" (as_option as_string)
let get_use_tactics: Prims.unit -> Prims.bool =
  fun uu____1785  ->
    let uu____1786 = lookup_opt "no_tactics" as_bool in
    Prims.op_Negation uu____1786
let get_using_facts_from:
  Prims.unit -> Prims.string Prims.list FStar_Pervasives_Native.option =
  fun uu____1793  ->
    lookup_opt "using_facts_from" (as_option (as_list as_string))
let get_verify_module: Prims.unit -> Prims.string Prims.list =
  fun uu____1804  -> lookup_opt "verify_module" (as_list as_string)
let get___temp_no_proj: Prims.unit -> Prims.string Prims.list =
  fun uu____1811  -> lookup_opt "__temp_no_proj" (as_list as_string)
let get_version: Prims.unit -> Prims.bool =
  fun uu____1816  -> lookup_opt "version" as_bool
let get_warn_default_effects: Prims.unit -> Prims.bool =
  fun uu____1819  -> lookup_opt "warn_default_effects" as_bool
let get_z3cliopt: Prims.unit -> Prims.string Prims.list =
  fun uu____1824  -> lookup_opt "z3cliopt" (as_list as_string)
let get_z3refresh: Prims.unit -> Prims.bool =
  fun uu____1829  -> lookup_opt "z3refresh" as_bool
let get_z3rlimit: Prims.unit -> Prims.int =
  fun uu____1832  -> lookup_opt "z3rlimit" as_int
let get_z3rlimit_factor: Prims.unit -> Prims.int =
  fun uu____1835  -> lookup_opt "z3rlimit_factor" as_int
let get_z3seed: Prims.unit -> Prims.int =
  fun uu____1838  -> lookup_opt "z3seed" as_int
let get_use_two_phase_tc: Prims.unit -> Prims.bool =
  fun uu____1841  -> lookup_opt "use_two_phase_tc" as_bool
let get_no_positivity: Prims.unit -> Prims.bool =
  fun uu____1844  -> lookup_opt "__no_positivity" as_bool
let get_ml_no_eta_expand_coertions: Prims.unit -> Prims.bool =
  fun uu____1847  -> lookup_opt "__ml_no_eta_expand_coertions" as_bool
let dlevel: Prims.string -> debug_level_t =
  fun uu___40_1850  ->
    match uu___40_1850 with
    | "Low" -> Low
    | "Medium" -> Medium
    | "High" -> High
    | "Extreme" -> Extreme
    | s -> Other s
let one_debug_level_geq: debug_level_t -> debug_level_t -> Prims.bool =
  fun l1  ->
    fun l2  ->
      match l1 with
      | Other uu____1858 -> l1 = l2
      | Low  -> l1 = l2
      | Medium  -> (l2 = Low) || (l2 = Medium)
      | High  -> ((l2 = Low) || (l2 = Medium)) || (l2 = High)
      | Extreme  ->
          (((l2 = Low) || (l2 = Medium)) || (l2 = High)) || (l2 = Extreme)
let debug_level_geq: debug_level_t -> Prims.bool =
  fun l2  ->
    let uu____1862 = get_debug_level () in
    FStar_All.pipe_right uu____1862
      (FStar_Util.for_some (fun l1  -> one_debug_level_geq (dlevel l1) l2))
let universe_include_path_base_dirs: Prims.string Prims.list =
  ["/ulib"; "/lib/fstar"]
let _version: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _platform: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _compiler: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _date: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let _commit: Prims.string FStar_ST.ref = FStar_Util.mk_ref ""
let display_version: Prims.unit -> Prims.unit =
  fun uu____1953  ->
    let uu____1954 =
      let uu____1955 = FStar_ST.op_Bang _version in
      let uu____2004 = FStar_ST.op_Bang _platform in
      let uu____2053 = FStar_ST.op_Bang _compiler in
      let uu____2102 = FStar_ST.op_Bang _date in
      let uu____2151 = FStar_ST.op_Bang _commit in
      FStar_Util.format5
        "F* %s\nplatform=%s\ncompiler=%s\ndate=%s\ncommit=%s\n" uu____1955
        uu____2004 uu____2053 uu____2102 uu____2151 in
    FStar_Util.print_string uu____1954
let display_usage_aux:
  'Auu____2203 'Auu____2204 .
    ('Auu____2204,Prims.string,'Auu____2203 FStar_Getopt.opt_variant,
      Prims.string) FStar_Pervasives_Native.tuple4 Prims.list -> Prims.unit
  =
  fun specs  ->
    FStar_Util.print_string "fstar.exe [options] file[s]\n";
    FStar_List.iter
      (fun uu____2251  ->
         match uu____2251 with
         | (uu____2262,flag,p,doc) ->
             (match p with
              | FStar_Getopt.ZeroArgs ig ->
                  if doc = ""
                  then
                    let uu____2273 =
                      let uu____2274 = FStar_Util.colorize_bold flag in
                      FStar_Util.format1 "  --%s\n" uu____2274 in
                    FStar_Util.print_string uu____2273
                  else
                    (let uu____2276 =
                       let uu____2277 = FStar_Util.colorize_bold flag in
                       FStar_Util.format2 "  --%s  %s\n" uu____2277 doc in
                     FStar_Util.print_string uu____2276)
              | FStar_Getopt.OneArg (uu____2278,argname) ->
                  if doc = ""
                  then
                    let uu____2284 =
                      let uu____2285 = FStar_Util.colorize_bold flag in
                      let uu____2286 = FStar_Util.colorize_bold argname in
                      FStar_Util.format2 "  --%s %s\n" uu____2285 uu____2286 in
                    FStar_Util.print_string uu____2284
                  else
                    (let uu____2288 =
                       let uu____2289 = FStar_Util.colorize_bold flag in
                       let uu____2290 = FStar_Util.colorize_bold argname in
                       FStar_Util.format3 "  --%s %s  %s\n" uu____2289
                         uu____2290 doc in
                     FStar_Util.print_string uu____2288))) specs
let mk_spec:
  (FStar_BaseTypes.char,Prims.string,option_val FStar_Getopt.opt_variant,
    Prims.string) FStar_Pervasives_Native.tuple4 -> FStar_Getopt.opt
  =
  fun o  ->
    let uu____2314 = o in
    match uu____2314 with
    | (ns,name,arg,desc) ->
        let arg1 =
          match arg with
          | FStar_Getopt.ZeroArgs f ->
              let g uu____2344 =
                let uu____2345 = f () in set_option name uu____2345 in
              FStar_Getopt.ZeroArgs g
          | FStar_Getopt.OneArg (f,d) ->
              let g x = let uu____2356 = f x in set_option name uu____2356 in
              FStar_Getopt.OneArg (g, d) in
        (ns, name, arg1, desc)
let accumulated_option: Prims.string -> option_val -> option_val =
  fun name  ->
    fun value  ->
      let prev_values =
        let uu____2370 = lookup_opt name (as_option as_list') in
        FStar_Util.dflt [] uu____2370 in
      mk_list (value :: prev_values)
let reverse_accumulated_option: Prims.string -> option_val -> option_val =
  fun name  ->
    fun value  ->
      let uu____2389 =
        let uu____2392 = lookup_opt name as_list' in
        FStar_List.append uu____2392 [value] in
      mk_list uu____2389
let accumulate_string:
  'Auu____2401 .
    Prims.string ->
      ('Auu____2401 -> Prims.string) -> 'Auu____2401 -> Prims.unit
  =
  fun name  ->
    fun post_processor  ->
      fun value  ->
        let uu____2419 =
          let uu____2420 =
            let uu____2421 = post_processor value in mk_string uu____2421 in
          accumulated_option name uu____2420 in
        set_option name uu____2419
let add_extract_module: Prims.string -> Prims.unit =
  fun s  -> accumulate_string "extract_module" FStar_String.lowercase s
let add_extract_namespace: Prims.string -> Prims.unit =
  fun s  -> accumulate_string "extract_namespace" FStar_String.lowercase s
let add_verify_module: Prims.string -> Prims.unit =
  fun s  -> accumulate_string "verify_module" FStar_String.lowercase s
type opt_type =
  | Const of option_val
  | IntStr of Prims.string
  | BoolStr
  | PathStr of Prims.string
  | SimpleStr of Prims.string
  | EnumStr of Prims.string Prims.list
  | OpenEnumStr of (Prims.string Prims.list,Prims.string)
  FStar_Pervasives_Native.tuple2
  | PostProcessed of (option_val -> option_val,opt_type)
  FStar_Pervasives_Native.tuple2
  | Accumulated of opt_type
  | ReverseAccumulated of opt_type
  | WithSideEffect of (Prims.unit -> Prims.unit,opt_type)
  FStar_Pervasives_Native.tuple2[@@deriving show]
let uu___is_Const: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | Const _0 -> true | uu____2499 -> false
let __proj__Const__item___0: opt_type -> option_val =
  fun projectee  -> match projectee with | Const _0 -> _0
let uu___is_IntStr: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | IntStr _0 -> true | uu____2511 -> false
let __proj__IntStr__item___0: opt_type -> Prims.string =
  fun projectee  -> match projectee with | IntStr _0 -> _0
let uu___is_BoolStr: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | BoolStr  -> true | uu____2522 -> false
let uu___is_PathStr: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | PathStr _0 -> true | uu____2527 -> false
let __proj__PathStr__item___0: opt_type -> Prims.string =
  fun projectee  -> match projectee with | PathStr _0 -> _0
let uu___is_SimpleStr: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | SimpleStr _0 -> true | uu____2539 -> false
let __proj__SimpleStr__item___0: opt_type -> Prims.string =
  fun projectee  -> match projectee with | SimpleStr _0 -> _0
let uu___is_EnumStr: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | EnumStr _0 -> true | uu____2553 -> false
let __proj__EnumStr__item___0: opt_type -> Prims.string Prims.list =
  fun projectee  -> match projectee with | EnumStr _0 -> _0
let uu___is_OpenEnumStr: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | OpenEnumStr _0 -> true | uu____2577 -> false
let __proj__OpenEnumStr__item___0:
  opt_type ->
    (Prims.string Prims.list,Prims.string) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | OpenEnumStr _0 -> _0
let uu___is_PostProcessed: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | PostProcessed _0 -> true | uu____2613 -> false
let __proj__PostProcessed__item___0:
  opt_type ->
    (option_val -> option_val,opt_type) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | PostProcessed _0 -> _0
let uu___is_Accumulated: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | Accumulated _0 -> true | uu____2643 -> false
let __proj__Accumulated__item___0: opt_type -> opt_type =
  fun projectee  -> match projectee with | Accumulated _0 -> _0
let uu___is_ReverseAccumulated: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with
    | ReverseAccumulated _0 -> true
    | uu____2655 -> false
let __proj__ReverseAccumulated__item___0: opt_type -> opt_type =
  fun projectee  -> match projectee with | ReverseAccumulated _0 -> _0
let uu___is_WithSideEffect: opt_type -> Prims.bool =
  fun projectee  ->
    match projectee with | WithSideEffect _0 -> true | uu____2673 -> false
let __proj__WithSideEffect__item___0:
  opt_type ->
    (Prims.unit -> Prims.unit,opt_type) FStar_Pervasives_Native.tuple2
  = fun projectee  -> match projectee with | WithSideEffect _0 -> _0
exception InvalidArgument of Prims.string
let uu___is_InvalidArgument: Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with
    | InvalidArgument uu____2705 -> true
    | uu____2706 -> false
let __proj__InvalidArgument__item__uu___: Prims.exn -> Prims.string =
  fun projectee  ->
    match projectee with | InvalidArgument uu____2713 -> uu____2713
let rec parse_opt_val: Prims.string -> opt_type -> Prims.string -> option_val
  =
  fun opt_name  ->
    fun typ  ->
      fun str_val  ->
        try
          match typ with
          | Const c -> c
          | IntStr uu____2727 ->
              let uu____2728 = FStar_Util.safe_int_of_string str_val in
              (match uu____2728 with
               | FStar_Pervasives_Native.Some v1 -> mk_int v1
               | FStar_Pervasives_Native.None  ->
                   FStar_Exn.raise (InvalidArgument opt_name))
          | BoolStr  ->
              let uu____2732 =
                if str_val = "true"
                then true
                else
                  if str_val = "false"
                  then false
                  else FStar_Exn.raise (InvalidArgument opt_name) in
              mk_bool uu____2732
          | PathStr uu____2735 -> mk_path str_val
          | SimpleStr uu____2736 -> mk_string str_val
          | EnumStr strs ->
              if FStar_List.mem str_val strs
              then mk_string str_val
              else FStar_Exn.raise (InvalidArgument opt_name)
          | OpenEnumStr uu____2741 -> mk_string str_val
          | PostProcessed (pp,elem_spec) ->
              let uu____2754 = parse_opt_val opt_name elem_spec str_val in
              pp uu____2754
          | Accumulated elem_spec ->
              let v1 = parse_opt_val opt_name elem_spec str_val in
              accumulated_option opt_name v1
          | ReverseAccumulated elem_spec ->
              let v1 = parse_opt_val opt_name elem_spec str_val in
              reverse_accumulated_option opt_name v1
          | WithSideEffect (side_effect,elem_spec) ->
              (side_effect (); parse_opt_val opt_name elem_spec str_val)
        with
        | InvalidArgument opt_name1 ->
            let uu____2771 =
              FStar_Util.format1 "Invalid argument to --%s" opt_name1 in
            failwith uu____2771
let rec desc_of_opt_type:
  opt_type -> Prims.string FStar_Pervasives_Native.option =
  fun typ  ->
    let desc_of_enum cases =
      FStar_Pervasives_Native.Some
        (Prims.strcat "[" (Prims.strcat (FStar_String.concat "|" cases) "]")) in
    match typ with
    | Const c -> FStar_Pervasives_Native.None
    | IntStr desc -> FStar_Pervasives_Native.Some desc
    | BoolStr  -> desc_of_enum ["true"; "false"]
    | PathStr desc -> FStar_Pervasives_Native.Some desc
    | SimpleStr desc -> FStar_Pervasives_Native.Some desc
    | EnumStr strs -> desc_of_enum strs
    | OpenEnumStr (strs,desc) -> desc_of_enum (FStar_List.append strs [desc])
    | PostProcessed (uu____2804,elem_spec) -> desc_of_opt_type elem_spec
    | Accumulated elem_spec -> desc_of_opt_type elem_spec
    | ReverseAccumulated elem_spec -> desc_of_opt_type elem_spec
    | WithSideEffect (uu____2812,elem_spec) -> desc_of_opt_type elem_spec
let rec arg_spec_of_opt_type:
  Prims.string -> opt_type -> option_val FStar_Getopt.opt_variant =
  fun opt_name  ->
    fun typ  ->
      let parser = parse_opt_val opt_name typ in
      let uu____2831 = desc_of_opt_type typ in
      match uu____2831 with
      | FStar_Pervasives_Native.None  ->
          FStar_Getopt.ZeroArgs ((fun uu____2837  -> parser ""))
      | FStar_Pervasives_Native.Some desc ->
          FStar_Getopt.OneArg (parser, desc)
let pp_validate_dir: option_val -> option_val =
  fun p  -> let pp = as_string p in FStar_Util.mkdir false pp; p
let pp_lowercase: option_val -> option_val =
  fun s  ->
    let uu____2849 =
      let uu____2850 = as_string s in FStar_String.lowercase uu____2850 in
    mk_string uu____2849
let rec specs_with_types:
  Prims.unit ->
    (FStar_BaseTypes.char,Prims.string,opt_type,Prims.string)
      FStar_Pervasives_Native.tuple4 Prims.list
  =
  fun uu____2867  ->
    let uu____2878 =
      let uu____2889 =
        let uu____2900 =
          let uu____2909 = let uu____2910 = mk_bool true in Const uu____2910 in
          (FStar_Getopt.noshort, "cache_checked_modules", uu____2909,
            "Write a '.checked' file for each module after verification and read from it if present, instead of re-verifying") in
        let uu____2911 =
          let uu____2922 =
            let uu____2933 =
              let uu____2944 =
                let uu____2955 =
                  let uu____2966 =
                    let uu____2977 =
                      let uu____2986 =
                        let uu____2987 = mk_bool true in Const uu____2987 in
                      (FStar_Getopt.noshort, "detail_errors", uu____2986,
                        "Emit a detailed error report by asking the SMT solver many queries; will take longer;\n         implies n_cores=1") in
                    let uu____2988 =
                      let uu____2999 =
                        let uu____3008 =
                          let uu____3009 = mk_bool true in Const uu____3009 in
                        (FStar_Getopt.noshort, "detail_hint_replay",
                          uu____3008,
                          "Emit a detailed report for proof whose unsat core fails to replay;\n         implies n_cores=1") in
                      let uu____3010 =
                        let uu____3021 =
                          let uu____3030 =
                            let uu____3031 = mk_bool true in Const uu____3031 in
                          (FStar_Getopt.noshort, "doc", uu____3030,
                            "Extract Markdown documentation files for the input modules, as well as an index. Output is written to --odir directory.") in
                        let uu____3032 =
                          let uu____3043 =
                            let uu____3054 =
                              let uu____3063 =
                                let uu____3064 = mk_bool true in
                                Const uu____3064 in
                              (FStar_Getopt.noshort, "eager_inference",
                                uu____3063,
                                "Solve all type-inference constraints eagerly; more efficient but at the cost of generality") in
                            let uu____3065 =
                              let uu____3076 =
                                let uu____3087 =
                                  let uu____3098 =
                                    let uu____3107 =
                                      let uu____3108 = mk_bool true in
                                      Const uu____3108 in
                                    (FStar_Getopt.noshort,
                                      "expose_interfaces", uu____3107,
                                      "Explicitly break the abstraction imposed by the interface of any implementation file that appears on the command line (use with care!)") in
                                  let uu____3109 =
                                    let uu____3120 =
                                      let uu____3131 =
                                        let uu____3142 =
                                          let uu____3151 =
                                            let uu____3152 = mk_bool true in
                                            Const uu____3152 in
                                          (FStar_Getopt.noshort,
                                            "hide_uvar_nums", uu____3151,
                                            "Don't print unification variable numbers") in
                                        let uu____3153 =
                                          let uu____3164 =
                                            let uu____3175 =
                                              let uu____3184 =
                                                let uu____3185 = mk_bool true in
                                                Const uu____3185 in
                                              (FStar_Getopt.noshort,
                                                "hint_info", uu____3184,
                                                "Print information regarding hints (deprecated; use --query_stats instead)") in
                                            let uu____3186 =
                                              let uu____3197 =
                                                let uu____3206 =
                                                  let uu____3207 =
                                                    mk_bool true in
                                                  Const uu____3207 in
                                                (FStar_Getopt.noshort, "in",
                                                  uu____3206,
                                                  "Legacy interactive mode; reads input from stdin") in
                                              let uu____3208 =
                                                let uu____3219 =
                                                  let uu____3228 =
                                                    let uu____3229 =
                                                      mk_bool true in
                                                    Const uu____3229 in
                                                  (FStar_Getopt.noshort,
                                                    "ide", uu____3228,
                                                    "JSON-based interactive mode for IDEs") in
                                                let uu____3230 =
                                                  let uu____3241 =
                                                    let uu____3252 =
                                                      let uu____3261 =
                                                        let uu____3262 =
                                                          mk_bool true in
                                                        Const uu____3262 in
                                                      (FStar_Getopt.noshort,
                                                        "indent", uu____3261,
                                                        "Parses and outputs the files on the command line") in
                                                    let uu____3263 =
                                                      let uu____3274 =
                                                        let uu____3285 =
                                                          let uu____3296 =
                                                            let uu____3305 =
                                                              let uu____3306
                                                                =
                                                                mk_bool true in
                                                              Const
                                                                uu____3306 in
                                                            (FStar_Getopt.noshort,
                                                              "lax",
                                                              uu____3305,
                                                              "Run the lax-type checker only (admit all verification conditions)") in
                                                          let uu____3307 =
                                                            let uu____3318 =
                                                              let uu____3329
                                                                =
                                                                let uu____3338
                                                                  =
                                                                  let uu____3339
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                  Const
                                                                    uu____3339 in
                                                                (FStar_Getopt.noshort,
                                                                  "log_types",
                                                                  uu____3338,
                                                                  "Print types computed for data/val/let-bindings") in
                                                              let uu____3340
                                                                =
                                                                let uu____3351
                                                                  =
                                                                  let uu____3360
                                                                    =
                                                                    let uu____3361
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3361 in
                                                                  (FStar_Getopt.noshort,
                                                                    "log_queries",
                                                                    uu____3360,
                                                                    "Log the Z3 queries in several queries-*.smt2 files, as we go") in
                                                                let uu____3362
                                                                  =
                                                                  let uu____3373
                                                                    =
                                                                    let uu____3384
                                                                    =
                                                                    let uu____3395
                                                                    =
                                                                    let uu____3406
                                                                    =
                                                                    let uu____3415
                                                                    =
                                                                    let uu____3416
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3416 in
                                                                    (FStar_Getopt.noshort,
                                                                    "MLish",
                                                                    uu____3415,
                                                                    "Trigger various specializations for compiling the F* compiler itself (not meant for user code)") in
                                                                    let uu____3417
                                                                    =
                                                                    let uu____3428
                                                                    =
                                                                    let uu____3439
                                                                    =
                                                                    let uu____3448
                                                                    =
                                                                    let uu____3449
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3449 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_default_includes",
                                                                    uu____3448,
                                                                    "Ignore the default module search paths") in
                                                                    let uu____3450
                                                                    =
                                                                    let uu____3461
                                                                    =
                                                                    let uu____3472
                                                                    =
                                                                    let uu____3481
                                                                    =
                                                                    let uu____3482
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3482 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_location_info",
                                                                    uu____3481,
                                                                    "Suppress location information in the generated OCaml output (only relevant with --codegen OCaml)") in
                                                                    let uu____3483
                                                                    =
                                                                    let uu____3494
                                                                    =
                                                                    let uu____3505
                                                                    =
                                                                    let uu____3516
                                                                    =
                                                                    let uu____3525
                                                                    =
                                                                    let uu____3526
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3526 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_bound_var_types",
                                                                    uu____3525,
                                                                    "Print the types of bound variables") in
                                                                    let uu____3527
                                                                    =
                                                                    let uu____3538
                                                                    =
                                                                    let uu____3547
                                                                    =
                                                                    let uu____3548
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3548 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_effect_args",
                                                                    uu____3547,
                                                                    "Print inferred predicate transformers for all computation types") in
                                                                    let uu____3549
                                                                    =
                                                                    let uu____3560
                                                                    =
                                                                    let uu____3569
                                                                    =
                                                                    let uu____3570
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3570 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_full_names",
                                                                    uu____3569,
                                                                    "Print full names of variables") in
                                                                    let uu____3571
                                                                    =
                                                                    let uu____3582
                                                                    =
                                                                    let uu____3591
                                                                    =
                                                                    let uu____3592
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3592 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_implicits",
                                                                    uu____3591,
                                                                    "Print implicit arguments") in
                                                                    let uu____3593
                                                                    =
                                                                    let uu____3604
                                                                    =
                                                                    let uu____3613
                                                                    =
                                                                    let uu____3614
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3614 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_universes",
                                                                    uu____3613,
                                                                    "Print universes") in
                                                                    let uu____3615
                                                                    =
                                                                    let uu____3626
                                                                    =
                                                                    let uu____3635
                                                                    =
                                                                    let uu____3636
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3636 in
                                                                    (FStar_Getopt.noshort,
                                                                    "print_z3_statistics",
                                                                    uu____3635,
                                                                    "Print Z3 statistics for each SMT query (deprecated; use --query_stats instead)") in
                                                                    let uu____3637
                                                                    =
                                                                    let uu____3648
                                                                    =
                                                                    let uu____3657
                                                                    =
                                                                    let uu____3658
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3658 in
                                                                    (FStar_Getopt.noshort,
                                                                    "prn",
                                                                    uu____3657,
                                                                    "Print full names (deprecated; use --print_full_names instead)") in
                                                                    let uu____3659
                                                                    =
                                                                    let uu____3670
                                                                    =
                                                                    let uu____3679
                                                                    =
                                                                    let uu____3680
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3680 in
                                                                    (FStar_Getopt.noshort,
                                                                    "query_stats",
                                                                    uu____3679,
                                                                    "Print SMT query statistics") in
                                                                    let uu____3681
                                                                    =
                                                                    let uu____3692
                                                                    =
                                                                    let uu____3701
                                                                    =
                                                                    let uu____3702
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3702 in
                                                                    (FStar_Getopt.noshort,
                                                                    "record_hints",
                                                                    uu____3701,
                                                                    "Record a database of hints for efficient proof replay") in
                                                                    let uu____3703
                                                                    =
                                                                    let uu____3714
                                                                    =
                                                                    let uu____3725
                                                                    =
                                                                    let uu____3734
                                                                    =
                                                                    let uu____3735
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3735 in
                                                                    (FStar_Getopt.noshort,
                                                                    "silent",
                                                                    uu____3734,
                                                                    " ") in
                                                                    let uu____3736
                                                                    =
                                                                    let uu____3747
                                                                    =
                                                                    let uu____3758
                                                                    =
                                                                    let uu____3769
                                                                    =
                                                                    let uu____3780
                                                                    =
                                                                    let uu____3791
                                                                    =
                                                                    let uu____3802
                                                                    =
                                                                    let uu____3811
                                                                    =
                                                                    let uu____3812
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3812 in
                                                                    (FStar_Getopt.noshort,
                                                                    "tactic_raw_binders",
                                                                    uu____3811,
                                                                    "Do not use the lexical scope of tactics to improve binder names") in
                                                                    let uu____3813
                                                                    =
                                                                    let uu____3824
                                                                    =
                                                                    let uu____3833
                                                                    =
                                                                    let uu____3834
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3834 in
                                                                    (FStar_Getopt.noshort,
                                                                    "tactic_trace",
                                                                    uu____3833,
                                                                    "Print a depth-indexed trace of tactic execution (Warning: very verbose)") in
                                                                    let uu____3835
                                                                    =
                                                                    let uu____3846
                                                                    =
                                                                    let uu____3857
                                                                    =
                                                                    let uu____3866
                                                                    =
                                                                    let uu____3867
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3867 in
                                                                    (FStar_Getopt.noshort,
                                                                    "timing",
                                                                    uu____3866,
                                                                    "Print the time it takes to verify each top-level definition") in
                                                                    let uu____3868
                                                                    =
                                                                    let uu____3879
                                                                    =
                                                                    let uu____3888
                                                                    =
                                                                    let uu____3889
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3889 in
                                                                    (FStar_Getopt.noshort,
                                                                    "trace_error",
                                                                    uu____3888,
                                                                    "Don't print an error message; show an exception trace instead") in
                                                                    let uu____3890
                                                                    =
                                                                    let uu____3901
                                                                    =
                                                                    let uu____3910
                                                                    =
                                                                    let uu____3911
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3911 in
                                                                    (FStar_Getopt.noshort,
                                                                    "ugly",
                                                                    uu____3910,
                                                                    "Emit output formatted for debugging") in
                                                                    let uu____3912
                                                                    =
                                                                    let uu____3923
                                                                    =
                                                                    let uu____3932
                                                                    =
                                                                    let uu____3933
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3933 in
                                                                    (FStar_Getopt.noshort,
                                                                    "unthrottle_inductives",
                                                                    uu____3932,
                                                                    "Let the SMT solver unfold inductive types to arbitrary depths (may affect verifier performance)") in
                                                                    let uu____3934
                                                                    =
                                                                    let uu____3945
                                                                    =
                                                                    let uu____3954
                                                                    =
                                                                    let uu____3955
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3955 in
                                                                    (FStar_Getopt.noshort,
                                                                    "unsafe_tactic_exec",
                                                                    uu____3954,
                                                                    "Allow tactics to run external processes. WARNING: checking an untrusted F* file while using this option can have disastrous effects.") in
                                                                    let uu____3956
                                                                    =
                                                                    let uu____3967
                                                                    =
                                                                    let uu____3976
                                                                    =
                                                                    let uu____3977
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3977 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_eq_at_higher_order",
                                                                    uu____3976,
                                                                    "Use equality constraints when comparing higher-order types (Temporary)") in
                                                                    let uu____3978
                                                                    =
                                                                    let uu____3989
                                                                    =
                                                                    let uu____3998
                                                                    =
                                                                    let uu____3999
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____3999 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_hints",
                                                                    uu____3998,
                                                                    "Use a previously recorded hints database for proof replay") in
                                                                    let uu____4000
                                                                    =
                                                                    let uu____4011
                                                                    =
                                                                    let uu____4020
                                                                    =
                                                                    let uu____4021
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4021 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_hint_hashes",
                                                                    uu____4020,
                                                                    "Admit queries if their hash matches the hash recorded in the hints database") in
                                                                    let uu____4022
                                                                    =
                                                                    let uu____4033
                                                                    =
                                                                    let uu____4044
                                                                    =
                                                                    let uu____4053
                                                                    =
                                                                    let uu____4054
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4054 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_tactics",
                                                                    uu____4053,
                                                                    "Do not run the tactic engine before discharging a VC") in
                                                                    let uu____4055
                                                                    =
                                                                    let uu____4066
                                                                    =
                                                                    let uu____4077
                                                                    =
                                                                    let uu____4088
                                                                    =
                                                                    let uu____4098
                                                                    =
                                                                    let uu____4099
                                                                    =
                                                                    let uu____4106
                                                                    =
                                                                    let uu____4107
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4107 in
                                                                    ((fun
                                                                    uu____4112
                                                                     ->
                                                                    display_version
                                                                    ();
                                                                    FStar_All.exit
                                                                    (Prims.parse_int
                                                                    "0")),
                                                                    uu____4106) in
                                                                    WithSideEffect
                                                                    uu____4099 in
                                                                    (118,
                                                                    "version",
                                                                    uu____4098,
                                                                    "Display version number") in
                                                                    let uu____4116
                                                                    =
                                                                    let uu____4128
                                                                    =
                                                                    let uu____4137
                                                                    =
                                                                    let uu____4138
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4138 in
                                                                    (FStar_Getopt.noshort,
                                                                    "warn_default_effects",
                                                                    uu____4137,
                                                                    "Warn when (a -> b) is desugared to (a -> Tot b)") in
                                                                    let uu____4139
                                                                    =
                                                                    let uu____4150
                                                                    =
                                                                    let uu____4161
                                                                    =
                                                                    let uu____4170
                                                                    =
                                                                    let uu____4171
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4171 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3refresh",
                                                                    uu____4170,
                                                                    "Restart Z3 after each query; useful for ensuring proof robustness") in
                                                                    let uu____4172
                                                                    =
                                                                    let uu____4183
                                                                    =
                                                                    let uu____4194
                                                                    =
                                                                    let uu____4205
                                                                    =
                                                                    let uu____4216
                                                                    =
                                                                    let uu____4227
                                                                    =
                                                                    let uu____4236
                                                                    =
                                                                    let uu____4237
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4237 in
                                                                    (FStar_Getopt.noshort,
                                                                    "__no_positivity",
                                                                    uu____4236,
                                                                    "Don't check positivity of inductive types") in
                                                                    let uu____4238
                                                                    =
                                                                    let uu____4249
                                                                    =
                                                                    let uu____4258
                                                                    =
                                                                    let uu____4259
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4259 in
                                                                    (FStar_Getopt.noshort,
                                                                    "__ml_no_eta_expand_coertions",
                                                                    uu____4258,
                                                                    "Do not eta-expand coertions in generated OCaml") in
                                                                    let uu____4260
                                                                    =
                                                                    let uu____4271
                                                                    =
                                                                    let uu____4281
                                                                    =
                                                                    let uu____4282
                                                                    =
                                                                    let uu____4289
                                                                    =
                                                                    let uu____4290
                                                                    =
                                                                    mk_bool
                                                                    true in
                                                                    Const
                                                                    uu____4290 in
                                                                    ((fun
                                                                    uu____4295
                                                                     ->
                                                                    (
                                                                    let uu____4297
                                                                    =
                                                                    specs () in
                                                                    display_usage_aux
                                                                    uu____4297);
                                                                    FStar_All.exit
                                                                    (Prims.parse_int
                                                                    "0")),
                                                                    uu____4289) in
                                                                    WithSideEffect
                                                                    uu____4282 in
                                                                    (104,
                                                                    "help",
                                                                    uu____4281,
                                                                    "Display this information") in
                                                                    [uu____4271] in
                                                                    uu____4249
                                                                    ::
                                                                    uu____4260 in
                                                                    uu____4227
                                                                    ::
                                                                    uu____4238 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_two_phase_tc",
                                                                    BoolStr,
                                                                    "Use the two phase typechecker (default 'false')")
                                                                    ::
                                                                    uu____4216 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3seed",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Set the Z3 random seed (default 0)")
                                                                    ::
                                                                    uu____4205 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3rlimit_factor",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Set the Z3 per-query resource limit multiplier. This is useful when, say, regenerating hints and you want to be more lax. (default 1)")
                                                                    ::
                                                                    uu____4194 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3rlimit",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Set the Z3 per-query resource limit (default 5 units, taking roughtly 5s)")
                                                                    ::
                                                                    uu____4183 in
                                                                    uu____4161
                                                                    ::
                                                                    uu____4172 in
                                                                    (FStar_Getopt.noshort,
                                                                    "z3cliopt",
                                                                    (ReverseAccumulated
                                                                    (SimpleStr
                                                                    "option")),
                                                                    "Z3 command line options")
                                                                    ::
                                                                    uu____4150 in
                                                                    uu____4128
                                                                    ::
                                                                    uu____4139 in
                                                                    uu____4088
                                                                    ::
                                                                    uu____4116 in
                                                                    (FStar_Getopt.noshort,
                                                                    "__temp_no_proj",
                                                                    (Accumulated
                                                                    (SimpleStr
                                                                    "module_name")),
                                                                    "Don't generate projectors for this module")
                                                                    ::
                                                                    uu____4077 in
                                                                    (FStar_Getopt.noshort,
                                                                    "using_facts_from",
                                                                    (Accumulated
                                                                    (SimpleStr
                                                                    "One or more space-separated occurrences of '[+|-]( * | namespace | fact id)'")),
                                                                    "\n\t\tPrunes the context to include only the facts from the given namespace or fact id. \n\t\t\tFacts can be include or excluded using the [+|-] qualifier. \n\t\t\tFor example --using_facts_from '* -FStar.Reflection +FStar.List -FStar.List.Tot' will \n\t\t\t\tremove all facts from FStar.List.Tot.*, \n\t\t\t\tretain all remaining facts from FStar.List.*, \n\t\t\t\tremove all facts from FStar.Reflection.*, \n\t\t\t\tand retain all the rest.\n\t\tNote, the '+' is optional: --using_facts_from 'FStar.List' is equivalent to --using_facts_from '+FStar.List'. \n\t\tMultiple uses of this option accumulate, e.g., --using_facts_from A --using_facts_from B is interpreted as --using_facts_from A^B.")
                                                                    ::
                                                                    uu____4066 in
                                                                    uu____4044
                                                                    ::
                                                                    uu____4055 in
                                                                    (FStar_Getopt.noshort,
                                                                    "use_native_tactics",
                                                                    (PathStr
                                                                    "path"),
                                                                    "Use compiled tactics from <path>")
                                                                    ::
                                                                    uu____4033 in
                                                                    uu____4011
                                                                    ::
                                                                    uu____4022 in
                                                                    uu____3989
                                                                    ::
                                                                    uu____4000 in
                                                                    uu____3967
                                                                    ::
                                                                    uu____3978 in
                                                                    uu____3945
                                                                    ::
                                                                    uu____3956 in
                                                                    uu____3923
                                                                    ::
                                                                    uu____3934 in
                                                                    uu____3901
                                                                    ::
                                                                    uu____3912 in
                                                                    uu____3879
                                                                    ::
                                                                    uu____3890 in
                                                                    uu____3857
                                                                    ::
                                                                    uu____3868 in
                                                                    (FStar_Getopt.noshort,
                                                                    "tactic_trace_d",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Trace tactics up to a certain binding depth")
                                                                    ::
                                                                    uu____3846 in
                                                                    uu____3824
                                                                    ::
                                                                    uu____3835 in
                                                                    uu____3802
                                                                    ::
                                                                    uu____3813 in
                                                                    (FStar_Getopt.noshort,
                                                                    "split_cases",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Partition VC of a match into groups of <positive_integer> cases")
                                                                    ::
                                                                    uu____3791 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smtencoding.l_arith_repr",
                                                                    (EnumStr
                                                                    ["native";
                                                                    "boxwrap"]),
                                                                    "Toggle the representation of linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap', use 'Prims.op_Addition, Prims.op_Subtraction, Prims.op_Minus'; \n\t\tif 'native', use '+, -, -'; \n\t\t(default 'boxwrap')")
                                                                    ::
                                                                    uu____3780 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smtencoding.nl_arith_repr",
                                                                    (EnumStr
                                                                    ["native";
                                                                    "wrapped";
                                                                    "boxwrap"]),
                                                                    "Control the representation of non-linear arithmetic functions in the SMT encoding:\n\t\ti.e., if 'boxwrap' use 'Prims.op_Multiply, Prims.op_Division, Prims.op_Modulus'; \n\t\tif 'native' use '*, div, mod';\n\t\tif 'wrapped' use '_mul, _div, _mod : Int*Int -> Int'; \n\t\t(default 'boxwrap')")
                                                                    ::
                                                                    uu____3769 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smtencoding.elim_box",
                                                                    BoolStr,
                                                                    "Toggle a peephole optimization that eliminates redundant uses of boxing/unboxing in the SMT encoding (default 'false')")
                                                                    ::
                                                                    uu____3758 in
                                                                    (FStar_Getopt.noshort,
                                                                    "smt",
                                                                    (PathStr
                                                                    "path"),
                                                                    "Path to the Z3 SMT solver (we could eventually support other solvers)")
                                                                    ::
                                                                    uu____3747 in
                                                                    uu____3725
                                                                    ::
                                                                    uu____3736 in
                                                                    (FStar_Getopt.noshort,
                                                                    "reuse_hint_for",
                                                                    (SimpleStr
                                                                    "toplevel_name"),
                                                                    "Optimistically, attempt using the recorded hint for <toplevel_name> (a top-level name in the current module) when trying to verify some other term 'g'")
                                                                    ::
                                                                    uu____3714 in
                                                                    uu____3692
                                                                    ::
                                                                    uu____3703 in
                                                                    uu____3670
                                                                    ::
                                                                    uu____3681 in
                                                                    uu____3648
                                                                    ::
                                                                    uu____3659 in
                                                                    uu____3626
                                                                    ::
                                                                    uu____3637 in
                                                                    uu____3604
                                                                    ::
                                                                    uu____3615 in
                                                                    uu____3582
                                                                    ::
                                                                    uu____3593 in
                                                                    uu____3560
                                                                    ::
                                                                    uu____3571 in
                                                                    uu____3538
                                                                    ::
                                                                    uu____3549 in
                                                                    uu____3516
                                                                    ::
                                                                    uu____3527 in
                                                                    (FStar_Getopt.noshort,
                                                                    "prims",
                                                                    (PathStr
                                                                    "file"),
                                                                    "") ::
                                                                    uu____3505 in
                                                                    (FStar_Getopt.noshort,
                                                                    "odir",
                                                                    (PostProcessed
                                                                    (pp_validate_dir,
                                                                    (PathStr
                                                                    "dir"))),
                                                                    "Place output in directory <dir>")
                                                                    ::
                                                                    uu____3494 in
                                                                    uu____3472
                                                                    ::
                                                                    uu____3483 in
                                                                    (FStar_Getopt.noshort,
                                                                    "no_extract",
                                                                    (Accumulated
                                                                    (PathStr
                                                                    "module name")),
                                                                    "Do not extract code from this module")
                                                                    ::
                                                                    uu____3461 in
                                                                    uu____3439
                                                                    ::
                                                                    uu____3450 in
                                                                    (FStar_Getopt.noshort,
                                                                    "n_cores",
                                                                    (IntStr
                                                                    "positive_integer"),
                                                                    "Maximum number of cores to use for the solver (implies detail_errors = false) (default 1)")
                                                                    ::
                                                                    uu____3428 in
                                                                    uu____3406
                                                                    ::
                                                                    uu____3417 in
                                                                    (FStar_Getopt.noshort,
                                                                    "min_fuel",
                                                                    (IntStr
                                                                    "non-negative integer"),
                                                                    "Minimum number of unrolling of recursive functions to try (default 1)")
                                                                    ::
                                                                    uu____3395 in
                                                                    (FStar_Getopt.noshort,
                                                                    "max_ifuel",
                                                                    (IntStr
                                                                    "non-negative integer"),
                                                                    "Number of unrolling of inductive datatypes to try at most (default 2)")
                                                                    ::
                                                                    uu____3384 in
                                                                  (FStar_Getopt.noshort,
                                                                    "max_fuel",
                                                                    (
                                                                    IntStr
                                                                    "non-negative integer"),
                                                                    "Number of unrolling of recursive functions to try at most (default 8)")
                                                                    ::
                                                                    uu____3373 in
                                                                uu____3351 ::
                                                                  uu____3362 in
                                                              uu____3329 ::
                                                                uu____3340 in
                                                            (FStar_Getopt.noshort,
                                                              "load",
                                                              (ReverseAccumulated
                                                                 (PathStr
                                                                    "module")),
                                                              "Load compiled module")
                                                              :: uu____3318 in
                                                          uu____3296 ::
                                                            uu____3307 in
                                                        (FStar_Getopt.noshort,
                                                          "initial_ifuel",
                                                          (IntStr
                                                             "non-negative integer"),
                                                          "Number of unrolling of inductive datatypes to try at first (default 1)")
                                                          :: uu____3285 in
                                                      (FStar_Getopt.noshort,
                                                        "initial_fuel",
                                                        (IntStr
                                                           "non-negative integer"),
                                                        "Number of unrolling of recursive functions to try initially (default 2)")
                                                        :: uu____3274 in
                                                    uu____3252 :: uu____3263 in
                                                  (FStar_Getopt.noshort,
                                                    "include",
                                                    (ReverseAccumulated
                                                       (PathStr "path")),
                                                    "A directory in which to search for files included on the command line")
                                                    :: uu____3241 in
                                                uu____3219 :: uu____3230 in
                                              uu____3197 :: uu____3208 in
                                            uu____3175 :: uu____3186 in
                                          (FStar_Getopt.noshort, "hint_file",
                                            (PathStr "path"),
                                            "Read/write hints to <path> (instead of module-specific hints files)")
                                            :: uu____3164 in
                                        uu____3142 :: uu____3153 in
                                      (FStar_Getopt.noshort,
                                        "gen_native_tactics",
                                        (PathStr "[path]"),
                                        "Compile all user tactics used in the module in <path>")
                                        :: uu____3131 in
                                    (FStar_Getopt.noshort, "fstar_home",
                                      (PathStr "dir"),
                                      "Set the FSTAR_HOME variable to <dir>")
                                      :: uu____3120 in
                                  uu____3098 :: uu____3109 in
                                (FStar_Getopt.noshort, "extract_namespace",
                                  (Accumulated
                                     (PostProcessed
                                        (pp_lowercase,
                                          (SimpleStr "namespace name")))),
                                  "Only extract modules in the specified namespace")
                                  :: uu____3087 in
                              (FStar_Getopt.noshort, "extract_module",
                                (Accumulated
                                   (PostProcessed
                                      (pp_lowercase,
                                        (SimpleStr "module_name")))),
                                "Only extract the specified modules (instead of the possibly-partial dependency graph)")
                                :: uu____3076 in
                            uu____3054 :: uu____3065 in
                          (FStar_Getopt.noshort, "dump_module",
                            (Accumulated (SimpleStr "module_name")), "") ::
                            uu____3043 in
                        uu____3021 :: uu____3032 in
                      uu____2999 :: uu____3010 in
                    uu____2977 :: uu____2988 in
                  (FStar_Getopt.noshort, "dep",
                    (EnumStr ["make"; "graph"; "full"]),
                    "Output the transitive closure of the full dependency graph in three formats:\n\t 'graph': a format suitable the 'dot' tool from 'GraphViz'\n\t 'full': a format suitable for 'make', including dependences for producing .ml files\n\t 'make': (deprecated) a format suitable for 'make', including only dependences among source files")
                    :: uu____2966 in
                (FStar_Getopt.noshort, "debug_level",
                  (Accumulated
                     (OpenEnumStr
                        (["Low"; "Medium"; "High"; "Extreme"], "..."))),
                  "Control the verbosity of debugging info") :: uu____2955 in
              (FStar_Getopt.noshort, "debug",
                (Accumulated (SimpleStr "module_name")),
                "Print lots of debugging information while checking module")
                :: uu____2944 in
            (FStar_Getopt.noshort, "codegen-lib",
              (Accumulated (SimpleStr "namespace")),
              "External runtime library (i.e. M.N.x extracts to M.N.X instead of M_N.x)")
              :: uu____2933 in
          (FStar_Getopt.noshort, "codegen",
            (EnumStr ["OCaml"; "FSharp"; "Kremlin"; "tactics"]),
            "Generate code for execution") :: uu____2922 in
        uu____2900 :: uu____2911 in
      (FStar_Getopt.noshort, "admit_except",
        (SimpleStr "[symbol|(symbol, id)]"),
        "Admit all queries, except those with label (<symbol>, <id>)) (e.g. --admit_except '(FStar.Fin.pigeonhole, 1)' or --admit_except FStar.Fin.pigeonhole)")
        :: uu____2889 in
    (FStar_Getopt.noshort, "admit_smt_queries", BoolStr,
      "Admit SMT queries, unsafe! (default 'false')") :: uu____2878
and specs: Prims.unit -> FStar_Getopt.opt Prims.list =
  fun uu____4995  ->
    let uu____4998 = specs_with_types () in
    FStar_List.map
      (fun uu____5023  ->
         match uu____5023 with
         | (short,long,typ,doc) ->
             let uu____5036 =
               let uu____5047 = arg_spec_of_opt_type long typ in
               (short, long, uu____5047, doc) in
             mk_spec uu____5036) uu____4998
let settable: Prims.string -> Prims.bool =
  fun uu___41_5054  ->
    match uu___41_5054 with
    | "admit_smt_queries" -> true
    | "admit_except" -> true
    | "debug" -> true
    | "debug_level" -> true
    | "detail_errors" -> true
    | "detail_hint_replay" -> true
    | "eager_inference" -> true
    | "hide_uvar_nums" -> true
    | "hint_info" -> true
    | "hint_file" -> true
    | "initial_fuel" -> true
    | "initial_ifuel" -> true
    | "lax" -> true
    | "load" -> true
    | "log_types" -> true
    | "log_queries" -> true
    | "max_fuel" -> true
    | "max_ifuel" -> true
    | "min_fuel" -> true
    | "ugly" -> true
    | "print_bound_var_types" -> true
    | "print_effect_args" -> true
    | "print_full_names" -> true
    | "print_implicits" -> true
    | "print_universes" -> true
    | "print_z3_statistics" -> true
    | "prn" -> true
    | "query_stats" -> true
    | "silent" -> true
    | "smtencoding.elim_box" -> true
    | "smtencoding.nl_arith_repr" -> true
    | "smtencoding.l_arith_repr" -> true
    | "split_cases" -> true
    | "timing" -> true
    | "trace_error" -> true
    | "unthrottle_inductives" -> true
    | "use_eq_at_higher_order" -> true
    | "no_tactics" -> true
    | "tactic_raw_binders" -> true
    | "tactic_trace" -> true
    | "tactic_trace_d" -> true
    | "__temp_no_proj" -> true
    | "reuse_hint_for" -> true
    | "z3rlimit_factor" -> true
    | "z3rlimit" -> true
    | "z3refresh" -> true
    | "use_two_phase_tc" -> true
    | uu____5055 -> false
let resettable: Prims.string -> Prims.bool =
  fun s  ->
    (((settable s) || (s = "z3seed")) || (s = "z3cliopt")) ||
      (s = "using_facts_from")
let all_specs: FStar_Getopt.opt Prims.list = specs ()
let all_specs_with_types:
  (FStar_BaseTypes.char,Prims.string,opt_type,Prims.string)
    FStar_Pervasives_Native.tuple4 Prims.list
  = specs_with_types ()
let settable_specs:
  (FStar_BaseTypes.char,Prims.string,Prims.unit FStar_Getopt.opt_variant,
    Prims.string) FStar_Pervasives_Native.tuple4 Prims.list
  =
  FStar_All.pipe_right all_specs
    (FStar_List.filter
       (fun uu____5112  ->
          match uu____5112 with
          | (uu____5123,x,uu____5125,uu____5126) -> settable x))
let resettable_specs:
  (FStar_BaseTypes.char,Prims.string,Prims.unit FStar_Getopt.opt_variant,
    Prims.string) FStar_Pervasives_Native.tuple4 Prims.list
  =
  FStar_All.pipe_right all_specs
    (FStar_List.filter
       (fun uu____5172  ->
          match uu____5172 with
          | (uu____5183,x,uu____5185,uu____5186) -> resettable x))
let display_usage: Prims.unit -> Prims.unit =
  fun uu____5193  ->
    let uu____5194 = specs () in display_usage_aux uu____5194
let fstar_home: Prims.unit -> Prims.string =
  fun uu____5209  ->
    let uu____5210 = get_fstar_home () in
    match uu____5210 with
    | FStar_Pervasives_Native.None  ->
        let x = FStar_Util.get_exec_dir () in
        let x1 = Prims.strcat x "/.." in
        ((let uu____5216 =
            let uu____5221 = mk_string x1 in ("fstar_home", uu____5221) in
          set_option' uu____5216);
         x1)
    | FStar_Pervasives_Native.Some x -> x
exception File_argument of Prims.string
let uu___is_File_argument: Prims.exn -> Prims.bool =
  fun projectee  ->
    match projectee with
    | File_argument uu____5229 -> true
    | uu____5230 -> false
let __proj__File_argument__item__uu___: Prims.exn -> Prims.string =
  fun projectee  ->
    match projectee with | File_argument uu____5237 -> uu____5237
let set_options: options -> Prims.string -> FStar_Getopt.parse_cmdline_res =
  fun o  ->
    fun s  ->
      let specs1 =
        match o with
        | Set  -> settable_specs
        | Reset  -> resettable_specs
        | Restore  -> all_specs in
      try
        if s = ""
        then FStar_Getopt.Success
        else
          FStar_Getopt.parse_string specs1
            (fun s1  -> FStar_Exn.raise (File_argument s1)) s
      with
      | File_argument s1 ->
          let uu____5281 =
            FStar_Util.format1 "File %s is not a valid option" s1 in
          FStar_Getopt.Error uu____5281
let file_list_: Prims.string Prims.list FStar_ST.ref = FStar_Util.mk_ref []
let parse_cmd_line:
  Prims.unit ->
    (FStar_Getopt.parse_cmdline_res,Prims.string Prims.list)
      FStar_Pervasives_Native.tuple2
  =
  fun uu____5303  ->
    let res =
      FStar_Getopt.parse_cmdline all_specs
        (fun i  ->
           let uu____5308 =
             let uu____5311 = FStar_ST.op_Bang file_list_ in
             FStar_List.append uu____5311 [i] in
           FStar_ST.op_Colon_Equals file_list_ uu____5308) in
    let uu____5418 =
      let uu____5421 = FStar_ST.op_Bang file_list_ in
      FStar_List.map FStar_Common.try_convert_file_name_to_mixed uu____5421 in
    (res, uu____5418)
let file_list: Prims.unit -> Prims.string Prims.list =
  fun uu____5482  -> FStar_ST.op_Bang file_list_
let restore_cmd_line_options: Prims.bool -> FStar_Getopt.parse_cmdline_res =
  fun should_clear  ->
    let old_verify_module = get_verify_module () in
    if should_clear then clear () else init ();
    (let r =
       let uu____5544 = specs () in
       FStar_Getopt.parse_cmdline uu____5544 (fun x  -> ()) in
     (let uu____5550 =
        let uu____5555 =
          let uu____5556 = FStar_List.map mk_string old_verify_module in
          List uu____5556 in
        ("verify_module", uu____5555) in
      set_option' uu____5550);
     r)
let module_name_of_file_name: Prims.string -> Prims.string =
  fun f  ->
    let f1 = FStar_Util.basename f in
    let f2 =
      let uu____5564 =
        let uu____5565 =
          let uu____5566 =
            let uu____5567 = FStar_Util.get_file_extension f1 in
            FStar_String.length uu____5567 in
          (FStar_String.length f1) - uu____5566 in
        uu____5565 - (Prims.parse_int "1") in
      FStar_String.substring f1 (Prims.parse_int "0") uu____5564 in
    FStar_String.lowercase f2
let should_verify: Prims.string -> Prims.bool =
  fun m  ->
    let uu____5571 = get_lax () in
    if uu____5571
    then false
    else
      (let l = get_verify_module () in
       FStar_List.contains (FStar_String.lowercase m) l)
let should_verify_file: Prims.string -> Prims.bool =
  fun fn  ->
    let uu____5579 = module_name_of_file_name fn in should_verify uu____5579
let dont_gen_projectors: Prims.string -> Prims.bool =
  fun m  ->
    let uu____5583 = get___temp_no_proj () in
    FStar_List.contains m uu____5583
let should_print_message: Prims.string -> Prims.bool =
  fun m  ->
    let uu____5589 = should_verify m in
    if uu____5589 then m <> "Prims" else false
let include_path: Prims.unit -> Prims.string Prims.list =
  fun uu____5595  ->
    let uu____5596 = get_no_default_includes () in
    if uu____5596
    then get_include ()
    else
      (let h = fstar_home () in
       let defs = universe_include_path_base_dirs in
       let uu____5604 =
         let uu____5607 =
           FStar_All.pipe_right defs
             (FStar_List.map (fun x  -> Prims.strcat h x)) in
         FStar_All.pipe_right uu____5607
           (FStar_List.filter FStar_Util.file_exists) in
       let uu____5620 =
         let uu____5623 = get_include () in
         FStar_List.append uu____5623 ["."] in
       FStar_List.append uu____5604 uu____5620)
let find_file: Prims.string -> Prims.string FStar_Pervasives_Native.option =
  fun filename  ->
    let uu____5631 = FStar_Util.is_path_absolute filename in
    if uu____5631
    then
      (if FStar_Util.file_exists filename
       then FStar_Pervasives_Native.Some filename
       else FStar_Pervasives_Native.None)
    else
      (let uu____5638 =
         let uu____5641 = include_path () in FStar_List.rev uu____5641 in
       FStar_Util.find_map uu____5638
         (fun p  ->
            let path = FStar_Util.join_paths p filename in
            if FStar_Util.file_exists path
            then FStar_Pervasives_Native.Some path
            else FStar_Pervasives_Native.None))
let prims: Prims.unit -> Prims.string =
  fun uu____5653  ->
    let uu____5654 = get_prims () in
    match uu____5654 with
    | FStar_Pervasives_Native.None  ->
        let filename = "prims.fst" in
        let uu____5658 = find_file filename in
        (match uu____5658 with
         | FStar_Pervasives_Native.Some result -> result
         | FStar_Pervasives_Native.None  ->
             let uu____5662 =
               FStar_Util.format1
                 "unable to find required file \"%s\" in the module search path.\n"
                 filename in
             failwith uu____5662)
    | FStar_Pervasives_Native.Some x -> x
let prims_basename: Prims.unit -> Prims.string =
  fun uu____5666  ->
    let uu____5667 = prims () in FStar_Util.basename uu____5667
let pervasives: Prims.unit -> Prims.string =
  fun uu____5670  ->
    let filename = "FStar.Pervasives.fst" in
    let uu____5672 = find_file filename in
    match uu____5672 with
    | FStar_Pervasives_Native.Some result -> result
    | FStar_Pervasives_Native.None  ->
        let uu____5676 =
          FStar_Util.format1
            "unable to find required file \"%s\" in the module search path.\n"
            filename in
        failwith uu____5676
let pervasives_basename: Prims.unit -> Prims.string =
  fun uu____5679  ->
    let uu____5680 = pervasives () in FStar_Util.basename uu____5680
let pervasives_native_basename: Prims.unit -> Prims.string =
  fun uu____5683  ->
    let filename = "FStar.Pervasives.Native.fst" in
    let uu____5685 = find_file filename in
    match uu____5685 with
    | FStar_Pervasives_Native.Some result -> FStar_Util.basename result
    | FStar_Pervasives_Native.None  ->
        let uu____5689 =
          FStar_Util.format1
            "unable to find required file \"%s\" in the module search path.\n"
            filename in
        failwith uu____5689
let prepend_output_dir: Prims.string -> Prims.string =
  fun fname  ->
    let uu____5693 = get_odir () in
    match uu____5693 with
    | FStar_Pervasives_Native.None  -> fname
    | FStar_Pervasives_Native.Some x ->
        Prims.strcat x (Prims.strcat "/" fname)
let __temp_no_proj: Prims.string -> Prims.bool =
  fun s  ->
    let uu____5700 = get___temp_no_proj () in
    FStar_All.pipe_right uu____5700 (FStar_List.contains s)
let admit_smt_queries: Prims.unit -> Prims.bool =
  fun uu____5707  -> get_admit_smt_queries ()
let admit_except: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____5712  -> get_admit_except ()
let cache_checked_modules: Prims.unit -> Prims.bool =
  fun uu____5715  -> get_cache_checked_modules ()
let codegen: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____5720  -> get_codegen ()
let codegen_libs: Prims.unit -> Prims.string Prims.list Prims.list =
  fun uu____5727  ->
    let uu____5728 = get_codegen_lib () in
    FStar_All.pipe_right uu____5728
      (FStar_List.map (fun x  -> FStar_Util.split x "."))
let debug_any: Prims.unit -> Prims.bool =
  fun uu____5743  -> let uu____5744 = get_debug () in uu____5744 <> []
let debug_at_level: Prims.string -> debug_level_t -> Prims.bool =
  fun modul  ->
    fun level  ->
      (let uu____5757 = get_debug () in
       FStar_All.pipe_right uu____5757 (FStar_List.contains modul)) &&
        (debug_level_geq level)
let dep: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____5766  -> get_dep ()
let detail_errors: Prims.unit -> Prims.bool =
  fun uu____5769  -> get_detail_errors ()
let detail_hint_replay: Prims.unit -> Prims.bool =
  fun uu____5772  -> get_detail_hint_replay ()
let doc: Prims.unit -> Prims.bool = fun uu____5775  -> get_doc ()
let dump_module: Prims.string -> Prims.bool =
  fun s  ->
    let uu____5779 = get_dump_module () in
    FStar_All.pipe_right uu____5779 (FStar_List.contains s)
let eager_inference: Prims.unit -> Prims.bool =
  fun uu____5786  -> get_eager_inference ()
let expose_interfaces: Prims.unit -> Prims.bool =
  fun uu____5789  -> get_expose_interfaces ()
let fs_typ_app: Prims.string -> Prims.bool =
  fun filename  ->
    let uu____5793 = FStar_ST.op_Bang light_off_files in
    FStar_List.contains filename uu____5793
let gen_native_tactics:
  Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____5852  -> get_gen_native_tactics ()
let full_context_dependency: Prims.unit -> Prims.bool =
  fun uu____5855  -> true
let hide_uvar_nums: Prims.unit -> Prims.bool =
  fun uu____5858  -> get_hide_uvar_nums ()
let hint_info: Prims.unit -> Prims.bool =
  fun uu____5861  -> (get_hint_info ()) || (get_query_stats ())
let hint_file: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____5866  -> get_hint_file ()
let ide: Prims.unit -> Prims.bool = fun uu____5869  -> get_ide ()
let indent: Prims.unit -> Prims.bool = fun uu____5872  -> get_indent ()
let initial_fuel: Prims.unit -> Prims.int =
  fun uu____5875  ->
    let uu____5876 = get_initial_fuel () in
    let uu____5877 = get_max_fuel () in Prims.min uu____5876 uu____5877
let initial_ifuel: Prims.unit -> Prims.int =
  fun uu____5880  ->
    let uu____5881 = get_initial_ifuel () in
    let uu____5882 = get_max_ifuel () in Prims.min uu____5881 uu____5882
let interactive: Prims.unit -> Prims.bool =
  fun uu____5885  -> (get_in ()) || (get_ide ())
let lax: Prims.unit -> Prims.bool = fun uu____5888  -> get_lax ()
let load: Prims.unit -> Prims.string Prims.list =
  fun uu____5893  -> get_load ()
let legacy_interactive: Prims.unit -> Prims.bool =
  fun uu____5896  -> get_in ()
let log_queries: Prims.unit -> Prims.bool =
  fun uu____5899  -> get_log_queries ()
let log_types: Prims.unit -> Prims.bool = fun uu____5902  -> get_log_types ()
let max_fuel: Prims.unit -> Prims.int = fun uu____5905  -> get_max_fuel ()
let max_ifuel: Prims.unit -> Prims.int = fun uu____5908  -> get_max_ifuel ()
let min_fuel: Prims.unit -> Prims.int = fun uu____5911  -> get_min_fuel ()
let ml_ish: Prims.unit -> Prims.bool = fun uu____5914  -> get_MLish ()
let set_ml_ish: Prims.unit -> Prims.unit =
  fun uu____5917  -> set_option "MLish" (Bool true)
let n_cores: Prims.unit -> Prims.int = fun uu____5920  -> get_n_cores ()
let no_default_includes: Prims.unit -> Prims.bool =
  fun uu____5923  -> get_no_default_includes ()
let no_extract: Prims.string -> Prims.bool =
  fun s  ->
    let s1 = FStar_String.lowercase s in
    let uu____5928 = get_no_extract () in
    FStar_All.pipe_right uu____5928
      (FStar_Util.for_some (fun f  -> (FStar_String.lowercase f) = s1))
let no_location_info: Prims.unit -> Prims.bool =
  fun uu____5937  -> get_no_location_info ()
let output_dir: Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____5942  -> get_odir ()
let ugly: Prims.unit -> Prims.bool = fun uu____5945  -> get_ugly ()
let print_bound_var_types: Prims.unit -> Prims.bool =
  fun uu____5948  -> get_print_bound_var_types ()
let print_effect_args: Prims.unit -> Prims.bool =
  fun uu____5951  -> get_print_effect_args ()
let print_implicits: Prims.unit -> Prims.bool =
  fun uu____5954  -> get_print_implicits ()
let print_real_names: Prims.unit -> Prims.bool =
  fun uu____5957  -> (get_prn ()) || (get_print_full_names ())
let print_universes: Prims.unit -> Prims.bool =
  fun uu____5960  -> get_print_universes ()
let print_z3_statistics: Prims.unit -> Prims.bool =
  fun uu____5963  -> (get_print_z3_statistics ()) || (get_query_stats ())
let query_stats: Prims.unit -> Prims.bool =
  fun uu____5966  -> get_query_stats ()
let record_hints: Prims.unit -> Prims.bool =
  fun uu____5969  -> get_record_hints ()
let reuse_hint_for: Prims.unit -> Prims.string FStar_Pervasives_Native.option
  = fun uu____5974  -> get_reuse_hint_for ()
let silent: Prims.unit -> Prims.bool = fun uu____5977  -> get_silent ()
let smtencoding_elim_box: Prims.unit -> Prims.bool =
  fun uu____5980  -> get_smtencoding_elim_box ()
let smtencoding_nl_arith_native: Prims.unit -> Prims.bool =
  fun uu____5983  ->
    let uu____5984 = get_smtencoding_nl_arith_repr () in
    uu____5984 = "native"
let smtencoding_nl_arith_wrapped: Prims.unit -> Prims.bool =
  fun uu____5987  ->
    let uu____5988 = get_smtencoding_nl_arith_repr () in
    uu____5988 = "wrapped"
let smtencoding_nl_arith_default: Prims.unit -> Prims.bool =
  fun uu____5991  ->
    let uu____5992 = get_smtencoding_nl_arith_repr () in
    uu____5992 = "boxwrap"
let smtencoding_l_arith_native: Prims.unit -> Prims.bool =
  fun uu____5995  ->
    let uu____5996 = get_smtencoding_l_arith_repr () in uu____5996 = "native"
let smtencoding_l_arith_default: Prims.unit -> Prims.bool =
  fun uu____5999  ->
    let uu____6000 = get_smtencoding_l_arith_repr () in
    uu____6000 = "boxwrap"
let split_cases: Prims.unit -> Prims.int =
  fun uu____6003  -> get_split_cases ()
let tactic_raw_binders: Prims.unit -> Prims.bool =
  fun uu____6006  -> get_tactic_raw_binders ()
let tactic_trace: Prims.unit -> Prims.bool =
  fun uu____6009  -> get_tactic_trace ()
let tactic_trace_d: Prims.unit -> Prims.int =
  fun uu____6012  -> get_tactic_trace_d ()
let timing: Prims.unit -> Prims.bool = fun uu____6015  -> get_timing ()
let trace_error: Prims.unit -> Prims.bool =
  fun uu____6018  -> get_trace_error ()
let unthrottle_inductives: Prims.unit -> Prims.bool =
  fun uu____6021  -> get_unthrottle_inductives ()
let unsafe_tactic_exec: Prims.unit -> Prims.bool =
  fun uu____6024  -> get_unsafe_tactic_exec ()
let use_eq_at_higher_order: Prims.unit -> Prims.bool =
  fun uu____6027  -> get_use_eq_at_higher_order ()
let use_hints: Prims.unit -> Prims.bool = fun uu____6030  -> get_use_hints ()
let use_hint_hashes: Prims.unit -> Prims.bool =
  fun uu____6033  -> get_use_hint_hashes ()
let use_native_tactics:
  Prims.unit -> Prims.string FStar_Pervasives_Native.option =
  fun uu____6038  -> get_use_native_tactics ()
let use_tactics: Prims.unit -> Prims.bool =
  fun uu____6041  -> get_use_tactics ()
let using_facts_from:
  Prims.unit ->
    (FStar_Ident.path,Prims.bool) FStar_Pervasives_Native.tuple2 Prims.list
  =
  fun uu____6050  ->
    let parse_one_setting s =
      if s = "*"
      then ([], true)
      else
        if FStar_Util.starts_with s "-"
        then
          (let path =
             let uu____6079 =
               FStar_Util.substring_from s (Prims.parse_int "1") in
             FStar_Ident.path_of_text uu____6079 in
           (path, false))
        else
          (let s1 =
             if FStar_Util.starts_with s "+"
             then FStar_Util.substring_from s (Prims.parse_int "1")
             else s in
           ((FStar_Ident.path_of_text s1), true)) in
    let parse_setting s =
      FStar_All.pipe_right (FStar_Util.split s " ")
        (FStar_List.map parse_one_setting) in
    let uu____6115 = get_using_facts_from () in
    match uu____6115 with
    | FStar_Pervasives_Native.None  -> [([], true)]
    | FStar_Pervasives_Native.Some ns ->
        let uu____6147 = FStar_List.collect parse_setting ns in
        FStar_All.pipe_right uu____6147 FStar_List.rev
let warn_default_effects: Prims.unit -> Prims.bool =
  fun uu____6186  -> get_warn_default_effects ()
let z3_exe: Prims.unit -> Prims.string =
  fun uu____6189  ->
    let uu____6190 = get_smt () in
    match uu____6190 with
    | FStar_Pervasives_Native.None  -> FStar_Platform.exe "z3"
    | FStar_Pervasives_Native.Some s -> s
let z3_cliopt: Prims.unit -> Prims.string Prims.list =
  fun uu____6198  -> get_z3cliopt ()
let z3_refresh: Prims.unit -> Prims.bool =
  fun uu____6201  -> get_z3refresh ()
let z3_rlimit: Prims.unit -> Prims.int = fun uu____6204  -> get_z3rlimit ()
let z3_rlimit_factor: Prims.unit -> Prims.int =
  fun uu____6207  -> get_z3rlimit_factor ()
let z3_seed: Prims.unit -> Prims.int = fun uu____6210  -> get_z3seed ()
let use_two_phase_tc: Prims.unit -> Prims.bool =
  fun uu____6213  -> get_use_two_phase_tc ()
let no_positivity: Prims.unit -> Prims.bool =
  fun uu____6216  -> get_no_positivity ()
let ml_no_eta_expand_coertions: Prims.unit -> Prims.bool =
  fun uu____6219  -> get_ml_no_eta_expand_coertions ()
let should_extract_namespace: Prims.string -> Prims.bool =
  fun m  ->
    let uu____6223 = get_extract_namespace () in
    match uu____6223 with
    | [] -> false
    | ns ->
        FStar_All.pipe_right ns
          (FStar_Util.for_some
             (fun n1  -> FStar_Util.starts_with m (FStar_String.lowercase n1)))
let should_extract_module: Prims.string -> Prims.bool =
  fun m  ->
    let uu____6236 = get_extract_module () in
    match uu____6236 with
    | [] -> false
    | l ->
        FStar_All.pipe_right l
          (FStar_Util.for_some (fun n1  -> (FStar_String.lowercase n1) = m))
let should_extract: Prims.string -> Prims.bool =
  fun m  ->
    let m1 = FStar_String.lowercase m in
    (let uu____6252 = no_extract m1 in Prims.op_Negation uu____6252) &&
      (let uu____6254 =
         let uu____6263 = get_extract_namespace () in
         let uu____6266 = get_extract_module () in (uu____6263, uu____6266) in
       match uu____6254 with
       | ([],[]) -> true
       | uu____6277 ->
           (should_extract_namespace m1) || (should_extract_module m1))
let codegen_fsharp: Prims.unit -> Prims.bool =
  fun uu____6288  ->
    let uu____6289 = codegen () in
    uu____6289 = (FStar_Pervasives_Native.Some "FSharp")