-- Enums in parametric modules.
-- ==
-- input { }
-- output { 4 }

module type foobar_mod = {
  type foobar
  val f : foobar -> i32
  val foo : foobar
  val bar : foobar
}

module sum (M: foobar_mod) = {
  let sum (a: []M.foobar): i32 =
    reduce (+) 0 (map M.f a)
}

module enum_module : foobar_mod = {
  type foobar = #foo | #bar
  let f (x : foobar) : i32 =
    match x
      case #foo -> 1 
      case #bar -> 2
  let foo = #foo : foobar
  let bar = #bar : foobar
}

module sum_enum = sum enum_module

let main : i32 = sum_enum.sum [enum_module.foo, enum_module.bar, enum_module.foo]
