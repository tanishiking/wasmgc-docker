(module
  (type $add_ty (func (param i32 i32) (result i32)))
  (func $add (type $add_ty) (param $l i32) (param $r i32) (result i32)
    local.get $l
    local.get $r
    i32.add
    return
  )
  (global $add_ref (ref $add_ty) ref.func $add)

  (func (export "plus")
    (param $a i32) (param $b i32)
    (result i32)
    local.get $a
    local.get $b
    global.get $add_ref
    call_ref $add_ty
  )
)
