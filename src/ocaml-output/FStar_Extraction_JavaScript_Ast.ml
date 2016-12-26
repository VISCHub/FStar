
open Prims

type source_t =
| JS_Statement of statement_t 
 and statement_t =
| JSS_Empty
| JSS_Block of statement_t Prims.list
| JSS_Expression of expression_t
| JSS_If of (expression_t * statement_t * statement_t Prims.option)
| JSS_With of (expression_t * statement_t)
| JSS_TypeAlias of (identifier_t * param_decl_t Prims.option * typ)
| JSS_Switch of (expression_t * (expression_t Prims.option * statement_t Prims.list) Prims.list)
| JSS_Return of expression_t Prims.option
| JSS_Throw of expression_t
| JSS_Try of (statement_t Prims.list * (pattern_t * statement_t Prims.list) Prims.option)
| JSS_FunctionDeclaration of function_t
| JSS_VariableDeclaration of ((pattern_t * expression_t Prims.option) * kind_var_t)
| JSS_ExportDefaultDeclaration of export_default_declaration_t
| JSS_ImportDeclaration of import_declaration_t
| JSS_Seq of statement_t Prims.list 
 and expression_t =
| JSE_Array of expression_t Prims.list Prims.option
| JSE_Object of property_obj_t Prims.list
| JSE_Function of function_t
| JSE_ArrowFunction of function_t
| JSE_Sequence of expression_t Prims.list
| JSE_Unary of (op_un * expression_t)
| JSE_Binary of (op_bin * expression_t * expression_t)
| JSE_Assignment of (pattern_t * expression_t)
| JSE_Logical of (op_log * expression_t * expression_t)
| JSE_Call of (expression_t * expression_t Prims.list)
| JSE_Member of (expression_t * propmem_t)
| JSE_Identifier of identifier_t
| JSE_Literal of literal_t
| JSE_TypeCast of (expression_t * typ) 
 and op_un =
| JSU_Minus
| JSU_Plus
| JSU_Not
| JSU_BitNot
| JSU_Typeof
| JSU_Void
| JSU_Delete
| JSU_Await 
 and op_bin =
| JSB_Equal
| JSB_NotEqual
| JSB_StrictEqual
| JSB_StrictNotEqual
| JSB_LessThan
| JSB_LessThanEqual
| JSB_GreaterThan
| JSB_GreaterThanEqual
| JSB_LShift
| JSB_RShift
| JSB_RShift3
| JSB_Plus
| JSB_Minus
| JSB_Mult
| JSB_Exp
| JSB_Div
| JSB_Mod
| JSB_BitOr
| JSB_Xor
| JSB_BitAnd
| JSB_In
| JSB_Instanceof 
 and op_log =
| JSL_Or
| JSL_And 
 and forinit_t =
| JSF_Declaration of ((pattern_t * expression_t Prims.option) Prims.list * kind_var_t)
| JSF_Expression of expression_t 
 and kind_var_t =
| JSV_Var
| JSV_Let
| JSV_Const 
 and kind_obj_t =
| JSO_Init
| JSO_Get
| JSO_Set 
 and property_obj_t =
| JSPO_Property of (object_prop_key_t * expression_t * kind_obj_t)
| JSPO_SpreadProperty of expression_t 
 and propmem_t =
| JSPM_Identifier of identifier_t
| JSPM_Expression of expression_t 
 and typ =
| JST_Any
| JST_Mixed
| JST_Empty
| JST_Void
| JST_Null
| JST_Number
| JST_String
| JST_Boolean
| JST_Nullable of typ
| JST_Function of ((identifier_t * typ) Prims.list * typ * param_decl_t Prims.option)
| JST_Object of ((object_prop_key_t * typ) Prims.list * (identifier_t * typ * typ) Prims.list * function_t Prims.list)
| JST_Array of typ
| JST_Generic of (generic_t * typ Prims.list Prims.option)
| JST_Union of typ Prims.list
| JST_Intersection of typ Prims.list
| JST_Typeof of typ
| JST_Tuple of typ Prims.list
| JST_StringLiteral of (Prims.string * Prims.string)
| JST_NumberLiteral of (FStar_BaseTypes.float * Prims.string)
| JST_BooleanLiteral of (Prims.bool * Prims.string)
| JST_Exists 
 and generic_t =
| Unqualified of identifier_t
| Qualified of (generic_t * identifier_t) 
 and body_t =
| JS_BodyBlock of statement_t Prims.list
| JS_BodyExpression of expression_t 
 and value_t =
| JSV_String of Prims.string
| JSV_Boolean of Prims.bool
| JSV_Null
| JSV_Number of FStar_BaseTypes.float 
 and predicate_t =
| JSP_Declared of expression_t
| JSP_Inferred 
 and pattern_t =
| JGP_Object of (property_t Prims.list * typ Prims.option)
| JGP_Array of (pattern_t Prims.list Prims.option * typ Prims.option)
| JGP_Assignment of (pattern_t * expression_t)
| JGP_Identifier of identifier_t
| JGP_Expression of expression_t 
 and property_t =
| JSP_SpreadProperty of pattern_t
| JSP_Property of (object_prop_key_t * pattern_t) 
 and object_prop_key_t =
| JSO_Literal of literal_t
| JSO_Identifier of identifier_t
| JSO_Computed of expression_t 
 and declaration =
| JSE_Declaration of statement_t
| JSE_Expression of expression_t 
 and export_kind =
| ExportType
| ExportValue 
 and t =
source_t Prims.list 
 and identifier_t =
(Prims.string * typ Prims.option) 
 and function_t =
(identifier_t Prims.option * pattern_t Prims.list * body_t * typ Prims.option * param_decl_t Prims.option) 
 and literal_t =
(value_t * Prims.string) 
 and param_decl_t =
Prims.string Prims.list 
 and export_default_declaration_t =
(declaration * export_kind) 
 and import_declaration_t =
identifier_t


let is_JS_Statement = (fun _discr_ -> (match (_discr_) with
| JS_Statement (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Empty = (fun _discr_ -> (match (_discr_) with
| JSS_Empty (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Block = (fun _discr_ -> (match (_discr_) with
| JSS_Block (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Expression = (fun _discr_ -> (match (_discr_) with
| JSS_Expression (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_If = (fun _discr_ -> (match (_discr_) with
| JSS_If (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_With = (fun _discr_ -> (match (_discr_) with
| JSS_With (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_TypeAlias = (fun _discr_ -> (match (_discr_) with
| JSS_TypeAlias (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Switch = (fun _discr_ -> (match (_discr_) with
| JSS_Switch (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Return = (fun _discr_ -> (match (_discr_) with
| JSS_Return (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Throw = (fun _discr_ -> (match (_discr_) with
| JSS_Throw (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Try = (fun _discr_ -> (match (_discr_) with
| JSS_Try (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_FunctionDeclaration = (fun _discr_ -> (match (_discr_) with
| JSS_FunctionDeclaration (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_VariableDeclaration = (fun _discr_ -> (match (_discr_) with
| JSS_VariableDeclaration (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_ExportDefaultDeclaration = (fun _discr_ -> (match (_discr_) with
| JSS_ExportDefaultDeclaration (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_ImportDeclaration = (fun _discr_ -> (match (_discr_) with
| JSS_ImportDeclaration (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSS_Seq = (fun _discr_ -> (match (_discr_) with
| JSS_Seq (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Array = (fun _discr_ -> (match (_discr_) with
| JSE_Array (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Object = (fun _discr_ -> (match (_discr_) with
| JSE_Object (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Function = (fun _discr_ -> (match (_discr_) with
| JSE_Function (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_ArrowFunction = (fun _discr_ -> (match (_discr_) with
| JSE_ArrowFunction (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Sequence = (fun _discr_ -> (match (_discr_) with
| JSE_Sequence (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Unary = (fun _discr_ -> (match (_discr_) with
| JSE_Unary (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Binary = (fun _discr_ -> (match (_discr_) with
| JSE_Binary (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Assignment = (fun _discr_ -> (match (_discr_) with
| JSE_Assignment (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Logical = (fun _discr_ -> (match (_discr_) with
| JSE_Logical (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Call = (fun _discr_ -> (match (_discr_) with
| JSE_Call (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Member = (fun _discr_ -> (match (_discr_) with
| JSE_Member (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Identifier = (fun _discr_ -> (match (_discr_) with
| JSE_Identifier (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Literal = (fun _discr_ -> (match (_discr_) with
| JSE_Literal (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_TypeCast = (fun _discr_ -> (match (_discr_) with
| JSE_TypeCast (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_Minus = (fun _discr_ -> (match (_discr_) with
| JSU_Minus (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_Plus = (fun _discr_ -> (match (_discr_) with
| JSU_Plus (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_Not = (fun _discr_ -> (match (_discr_) with
| JSU_Not (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_BitNot = (fun _discr_ -> (match (_discr_) with
| JSU_BitNot (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_Typeof = (fun _discr_ -> (match (_discr_) with
| JSU_Typeof (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_Void = (fun _discr_ -> (match (_discr_) with
| JSU_Void (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_Delete = (fun _discr_ -> (match (_discr_) with
| JSU_Delete (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSU_Await = (fun _discr_ -> (match (_discr_) with
| JSU_Await (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Equal = (fun _discr_ -> (match (_discr_) with
| JSB_Equal (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_NotEqual = (fun _discr_ -> (match (_discr_) with
| JSB_NotEqual (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_StrictEqual = (fun _discr_ -> (match (_discr_) with
| JSB_StrictEqual (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_StrictNotEqual = (fun _discr_ -> (match (_discr_) with
| JSB_StrictNotEqual (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_LessThan = (fun _discr_ -> (match (_discr_) with
| JSB_LessThan (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_LessThanEqual = (fun _discr_ -> (match (_discr_) with
| JSB_LessThanEqual (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_GreaterThan = (fun _discr_ -> (match (_discr_) with
| JSB_GreaterThan (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_GreaterThanEqual = (fun _discr_ -> (match (_discr_) with
| JSB_GreaterThanEqual (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_LShift = (fun _discr_ -> (match (_discr_) with
| JSB_LShift (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_RShift = (fun _discr_ -> (match (_discr_) with
| JSB_RShift (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_RShift3 = (fun _discr_ -> (match (_discr_) with
| JSB_RShift3 (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Plus = (fun _discr_ -> (match (_discr_) with
| JSB_Plus (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Minus = (fun _discr_ -> (match (_discr_) with
| JSB_Minus (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Mult = (fun _discr_ -> (match (_discr_) with
| JSB_Mult (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Exp = (fun _discr_ -> (match (_discr_) with
| JSB_Exp (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Div = (fun _discr_ -> (match (_discr_) with
| JSB_Div (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Mod = (fun _discr_ -> (match (_discr_) with
| JSB_Mod (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_BitOr = (fun _discr_ -> (match (_discr_) with
| JSB_BitOr (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Xor = (fun _discr_ -> (match (_discr_) with
| JSB_Xor (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_BitAnd = (fun _discr_ -> (match (_discr_) with
| JSB_BitAnd (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_In = (fun _discr_ -> (match (_discr_) with
| JSB_In (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSB_Instanceof = (fun _discr_ -> (match (_discr_) with
| JSB_Instanceof (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSL_Or = (fun _discr_ -> (match (_discr_) with
| JSL_Or (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSL_And = (fun _discr_ -> (match (_discr_) with
| JSL_And (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSF_Declaration = (fun _discr_ -> (match (_discr_) with
| JSF_Declaration (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSF_Expression = (fun _discr_ -> (match (_discr_) with
| JSF_Expression (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSV_Var = (fun _discr_ -> (match (_discr_) with
| JSV_Var (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSV_Let = (fun _discr_ -> (match (_discr_) with
| JSV_Let (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSV_Const = (fun _discr_ -> (match (_discr_) with
| JSV_Const (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSO_Init = (fun _discr_ -> (match (_discr_) with
| JSO_Init (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSO_Get = (fun _discr_ -> (match (_discr_) with
| JSO_Get (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSO_Set = (fun _discr_ -> (match (_discr_) with
| JSO_Set (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSPO_Property = (fun _discr_ -> (match (_discr_) with
| JSPO_Property (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSPO_SpreadProperty = (fun _discr_ -> (match (_discr_) with
| JSPO_SpreadProperty (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSPM_Identifier = (fun _discr_ -> (match (_discr_) with
| JSPM_Identifier (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSPM_Expression = (fun _discr_ -> (match (_discr_) with
| JSPM_Expression (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Any = (fun _discr_ -> (match (_discr_) with
| JST_Any (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Mixed = (fun _discr_ -> (match (_discr_) with
| JST_Mixed (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Empty = (fun _discr_ -> (match (_discr_) with
| JST_Empty (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Void = (fun _discr_ -> (match (_discr_) with
| JST_Void (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Null = (fun _discr_ -> (match (_discr_) with
| JST_Null (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Number = (fun _discr_ -> (match (_discr_) with
| JST_Number (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_String = (fun _discr_ -> (match (_discr_) with
| JST_String (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Boolean = (fun _discr_ -> (match (_discr_) with
| JST_Boolean (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Nullable = (fun _discr_ -> (match (_discr_) with
| JST_Nullable (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Function = (fun _discr_ -> (match (_discr_) with
| JST_Function (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Object = (fun _discr_ -> (match (_discr_) with
| JST_Object (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Array = (fun _discr_ -> (match (_discr_) with
| JST_Array (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Generic = (fun _discr_ -> (match (_discr_) with
| JST_Generic (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Union = (fun _discr_ -> (match (_discr_) with
| JST_Union (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Intersection = (fun _discr_ -> (match (_discr_) with
| JST_Intersection (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Typeof = (fun _discr_ -> (match (_discr_) with
| JST_Typeof (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Tuple = (fun _discr_ -> (match (_discr_) with
| JST_Tuple (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_StringLiteral = (fun _discr_ -> (match (_discr_) with
| JST_StringLiteral (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_NumberLiteral = (fun _discr_ -> (match (_discr_) with
| JST_NumberLiteral (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_BooleanLiteral = (fun _discr_ -> (match (_discr_) with
| JST_BooleanLiteral (_) -> begin
true
end
| _ -> begin
false
end))


let is_JST_Exists = (fun _discr_ -> (match (_discr_) with
| JST_Exists (_) -> begin
true
end
| _ -> begin
false
end))


let is_Unqualified = (fun _discr_ -> (match (_discr_) with
| Unqualified (_) -> begin
true
end
| _ -> begin
false
end))


let is_Qualified = (fun _discr_ -> (match (_discr_) with
| Qualified (_) -> begin
true
end
| _ -> begin
false
end))


let is_JS_BodyBlock = (fun _discr_ -> (match (_discr_) with
| JS_BodyBlock (_) -> begin
true
end
| _ -> begin
false
end))


let is_JS_BodyExpression = (fun _discr_ -> (match (_discr_) with
| JS_BodyExpression (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSV_String = (fun _discr_ -> (match (_discr_) with
| JSV_String (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSV_Boolean = (fun _discr_ -> (match (_discr_) with
| JSV_Boolean (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSV_Null = (fun _discr_ -> (match (_discr_) with
| JSV_Null (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSV_Number = (fun _discr_ -> (match (_discr_) with
| JSV_Number (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSP_Declared = (fun _discr_ -> (match (_discr_) with
| JSP_Declared (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSP_Inferred = (fun _discr_ -> (match (_discr_) with
| JSP_Inferred (_) -> begin
true
end
| _ -> begin
false
end))


let is_JGP_Object = (fun _discr_ -> (match (_discr_) with
| JGP_Object (_) -> begin
true
end
| _ -> begin
false
end))


let is_JGP_Array = (fun _discr_ -> (match (_discr_) with
| JGP_Array (_) -> begin
true
end
| _ -> begin
false
end))


let is_JGP_Assignment = (fun _discr_ -> (match (_discr_) with
| JGP_Assignment (_) -> begin
true
end
| _ -> begin
false
end))


let is_JGP_Identifier = (fun _discr_ -> (match (_discr_) with
| JGP_Identifier (_) -> begin
true
end
| _ -> begin
false
end))


let is_JGP_Expression = (fun _discr_ -> (match (_discr_) with
| JGP_Expression (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSP_SpreadProperty = (fun _discr_ -> (match (_discr_) with
| JSP_SpreadProperty (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSP_Property = (fun _discr_ -> (match (_discr_) with
| JSP_Property (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSO_Literal = (fun _discr_ -> (match (_discr_) with
| JSO_Literal (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSO_Identifier = (fun _discr_ -> (match (_discr_) with
| JSO_Identifier (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSO_Computed = (fun _discr_ -> (match (_discr_) with
| JSO_Computed (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Declaration = (fun _discr_ -> (match (_discr_) with
| JSE_Declaration (_) -> begin
true
end
| _ -> begin
false
end))


let is_JSE_Expression = (fun _discr_ -> (match (_discr_) with
| JSE_Expression (_) -> begin
true
end
| _ -> begin
false
end))


let is_ExportType = (fun _discr_ -> (match (_discr_) with
| ExportType (_) -> begin
true
end
| _ -> begin
false
end))


let is_ExportValue = (fun _discr_ -> (match (_discr_) with
| ExportValue (_) -> begin
true
end
| _ -> begin
false
end))


let ___JS_Statement____0 = (fun projectee -> (match (projectee) with
| JS_Statement (_83_2) -> begin
_83_2
end))


let ___JSS_Block____0 = (fun projectee -> (match (projectee) with
| JSS_Block (_83_5) -> begin
_83_5
end))


let ___JSS_Expression____0 = (fun projectee -> (match (projectee) with
| JSS_Expression (_83_8) -> begin
_83_8
end))


let ___JSS_If____0 = (fun projectee -> (match (projectee) with
| JSS_If (_83_11) -> begin
_83_11
end))


let ___JSS_With____0 = (fun projectee -> (match (projectee) with
| JSS_With (_83_14) -> begin
_83_14
end))


let ___JSS_TypeAlias____0 = (fun projectee -> (match (projectee) with
| JSS_TypeAlias (_83_17) -> begin
_83_17
end))


let ___JSS_Switch____0 = (fun projectee -> (match (projectee) with
| JSS_Switch (_83_20) -> begin
_83_20
end))


let ___JSS_Return____0 = (fun projectee -> (match (projectee) with
| JSS_Return (_83_23) -> begin
_83_23
end))


let ___JSS_Throw____0 = (fun projectee -> (match (projectee) with
| JSS_Throw (_83_26) -> begin
_83_26
end))


let ___JSS_Try____0 = (fun projectee -> (match (projectee) with
| JSS_Try (_83_29) -> begin
_83_29
end))


let ___JSS_FunctionDeclaration____0 = (fun projectee -> (match (projectee) with
| JSS_FunctionDeclaration (_83_32) -> begin
_83_32
end))


let ___JSS_VariableDeclaration____0 = (fun projectee -> (match (projectee) with
| JSS_VariableDeclaration (_83_35) -> begin
_83_35
end))


let ___JSS_ExportDefaultDeclaration____0 = (fun projectee -> (match (projectee) with
| JSS_ExportDefaultDeclaration (_83_38) -> begin
_83_38
end))


let ___JSS_ImportDeclaration____0 = (fun projectee -> (match (projectee) with
| JSS_ImportDeclaration (_83_41) -> begin
_83_41
end))


let ___JSS_Seq____0 = (fun projectee -> (match (projectee) with
| JSS_Seq (_83_44) -> begin
_83_44
end))


let ___JSE_Array____0 = (fun projectee -> (match (projectee) with
| JSE_Array (_83_47) -> begin
_83_47
end))


let ___JSE_Object____0 = (fun projectee -> (match (projectee) with
| JSE_Object (_83_50) -> begin
_83_50
end))


let ___JSE_Function____0 = (fun projectee -> (match (projectee) with
| JSE_Function (_83_53) -> begin
_83_53
end))


let ___JSE_ArrowFunction____0 = (fun projectee -> (match (projectee) with
| JSE_ArrowFunction (_83_56) -> begin
_83_56
end))


let ___JSE_Sequence____0 = (fun projectee -> (match (projectee) with
| JSE_Sequence (_83_59) -> begin
_83_59
end))


let ___JSE_Unary____0 = (fun projectee -> (match (projectee) with
| JSE_Unary (_83_62) -> begin
_83_62
end))


let ___JSE_Binary____0 = (fun projectee -> (match (projectee) with
| JSE_Binary (_83_65) -> begin
_83_65
end))


let ___JSE_Assignment____0 = (fun projectee -> (match (projectee) with
| JSE_Assignment (_83_68) -> begin
_83_68
end))


let ___JSE_Logical____0 = (fun projectee -> (match (projectee) with
| JSE_Logical (_83_71) -> begin
_83_71
end))


let ___JSE_Call____0 = (fun projectee -> (match (projectee) with
| JSE_Call (_83_74) -> begin
_83_74
end))


let ___JSE_Member____0 = (fun projectee -> (match (projectee) with
| JSE_Member (_83_77) -> begin
_83_77
end))


let ___JSE_Identifier____0 = (fun projectee -> (match (projectee) with
| JSE_Identifier (_83_80) -> begin
_83_80
end))


let ___JSE_Literal____0 = (fun projectee -> (match (projectee) with
| JSE_Literal (_83_83) -> begin
_83_83
end))


let ___JSE_TypeCast____0 = (fun projectee -> (match (projectee) with
| JSE_TypeCast (_83_86) -> begin
_83_86
end))


let ___JSF_Declaration____0 = (fun projectee -> (match (projectee) with
| JSF_Declaration (_83_89) -> begin
_83_89
end))


let ___JSF_Expression____0 = (fun projectee -> (match (projectee) with
| JSF_Expression (_83_92) -> begin
_83_92
end))


let ___JSPO_Property____0 = (fun projectee -> (match (projectee) with
| JSPO_Property (_83_95) -> begin
_83_95
end))


let ___JSPO_SpreadProperty____0 = (fun projectee -> (match (projectee) with
| JSPO_SpreadProperty (_83_98) -> begin
_83_98
end))


let ___JSPM_Identifier____0 = (fun projectee -> (match (projectee) with
| JSPM_Identifier (_83_101) -> begin
_83_101
end))


let ___JSPM_Expression____0 = (fun projectee -> (match (projectee) with
| JSPM_Expression (_83_104) -> begin
_83_104
end))


let ___JST_Nullable____0 = (fun projectee -> (match (projectee) with
| JST_Nullable (_83_107) -> begin
_83_107
end))


let ___JST_Function____0 = (fun projectee -> (match (projectee) with
| JST_Function (_83_110) -> begin
_83_110
end))


let ___JST_Object____0 = (fun projectee -> (match (projectee) with
| JST_Object (_83_113) -> begin
_83_113
end))


let ___JST_Array____0 = (fun projectee -> (match (projectee) with
| JST_Array (_83_116) -> begin
_83_116
end))


let ___JST_Generic____0 = (fun projectee -> (match (projectee) with
| JST_Generic (_83_119) -> begin
_83_119
end))


let ___JST_Union____0 = (fun projectee -> (match (projectee) with
| JST_Union (_83_122) -> begin
_83_122
end))


let ___JST_Intersection____0 = (fun projectee -> (match (projectee) with
| JST_Intersection (_83_125) -> begin
_83_125
end))


let ___JST_Typeof____0 = (fun projectee -> (match (projectee) with
| JST_Typeof (_83_128) -> begin
_83_128
end))


let ___JST_Tuple____0 = (fun projectee -> (match (projectee) with
| JST_Tuple (_83_131) -> begin
_83_131
end))


let ___JST_StringLiteral____0 = (fun projectee -> (match (projectee) with
| JST_StringLiteral (_83_134) -> begin
_83_134
end))


let ___JST_NumberLiteral____0 = (fun projectee -> (match (projectee) with
| JST_NumberLiteral (_83_137) -> begin
_83_137
end))


let ___JST_BooleanLiteral____0 = (fun projectee -> (match (projectee) with
| JST_BooleanLiteral (_83_140) -> begin
_83_140
end))


let ___Unqualified____0 = (fun projectee -> (match (projectee) with
| Unqualified (_83_143) -> begin
_83_143
end))


let ___Qualified____0 = (fun projectee -> (match (projectee) with
| Qualified (_83_146) -> begin
_83_146
end))


let ___JS_BodyBlock____0 = (fun projectee -> (match (projectee) with
| JS_BodyBlock (_83_149) -> begin
_83_149
end))


let ___JS_BodyExpression____0 = (fun projectee -> (match (projectee) with
| JS_BodyExpression (_83_152) -> begin
_83_152
end))


let ___JSV_String____0 = (fun projectee -> (match (projectee) with
| JSV_String (_83_155) -> begin
_83_155
end))


let ___JSV_Boolean____0 = (fun projectee -> (match (projectee) with
| JSV_Boolean (_83_158) -> begin
_83_158
end))


let ___JSV_Number____0 = (fun projectee -> (match (projectee) with
| JSV_Number (_83_161) -> begin
_83_161
end))


let ___JSP_Declared____0 = (fun projectee -> (match (projectee) with
| JSP_Declared (_83_164) -> begin
_83_164
end))


let ___JGP_Object____0 = (fun projectee -> (match (projectee) with
| JGP_Object (_83_167) -> begin
_83_167
end))


let ___JGP_Array____0 = (fun projectee -> (match (projectee) with
| JGP_Array (_83_170) -> begin
_83_170
end))


let ___JGP_Assignment____0 = (fun projectee -> (match (projectee) with
| JGP_Assignment (_83_173) -> begin
_83_173
end))


let ___JGP_Identifier____0 = (fun projectee -> (match (projectee) with
| JGP_Identifier (_83_176) -> begin
_83_176
end))


let ___JGP_Expression____0 = (fun projectee -> (match (projectee) with
| JGP_Expression (_83_179) -> begin
_83_179
end))


let ___JSP_SpreadProperty____0 = (fun projectee -> (match (projectee) with
| JSP_SpreadProperty (_83_182) -> begin
_83_182
end))


let ___JSP_Property____0 = (fun projectee -> (match (projectee) with
| JSP_Property (_83_185) -> begin
_83_185
end))


let ___JSO_Literal____0 = (fun projectee -> (match (projectee) with
| JSO_Literal (_83_188) -> begin
_83_188
end))


let ___JSO_Identifier____0 = (fun projectee -> (match (projectee) with
| JSO_Identifier (_83_191) -> begin
_83_191
end))


let ___JSO_Computed____0 = (fun projectee -> (match (projectee) with
| JSO_Computed (_83_194) -> begin
_83_194
end))


let ___JSE_Declaration____0 = (fun projectee -> (match (projectee) with
| JSE_Declaration (_83_197) -> begin
_83_197
end))


let ___JSE_Expression____0 = (fun projectee -> (match (projectee) with
| JSE_Expression (_83_200) -> begin
_83_200
end))




