
/// TODO: doc
///
/// "{[1]}"
///
/// "{{AbCdEfG}}"
///
/// "{Chapter}"
///
/// "{[1]:l>2}"
///
/// "{Chapter:l>2&l<4}"
///
/// ...
#let parser(s) = {
  assert(type(s) == str)
  let res = ()
  // Ohno this is not supported
  // `let elements = s.matches(regex("(?<!\\)\{([^{}]*)\}"))`
  // TODO: support `\{` quoting
  let elements = s.matches(regex("\{([^{}]*)\}"))
  return s
}