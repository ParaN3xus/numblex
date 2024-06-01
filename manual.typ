#import "@preview/pinit:0.1.4": *

// Copied from https://github.com/typst-doc-cn/tutorial/blob/main/src/mod.typ
#let exec-code(cc, res: none, scope: (:), eval: eval) = {

  rect(
    width: 100%,
    inset: 10pt,
    {
      // Don't corrupt normal headings
      set heading(outlined: false)

      if res != none {
        res
      } else {
        eval(cc.text, mode: "markup", scope: scope)
      }
    },
  )
}

// al: alignment
#let code(cc, code-as: none, res: none, scope: (:), eval: eval, exec-code: exec-code, al: left) = {
  let code-as = if code-as == none {
    cc
  } else {
    code-as
  }

  let vv = exec-code(cc, res: res, scope: scope, eval: eval)
  if al == left {
    layout(lw => style(styles => {
      let width = lw.width * 0.5 - 0.5em
      let u = box(width: width, code-as)
      let v = box(width: width, vv)

      let u-box = measure(u, styles)
      let v-box = measure(v, styles)

      let height = calc.max(u-box.height, v-box.height)
      stack(
        dir: ltr,
        {
          set rect(height: height)
          u
        },
        1em,
        {
          rect(height: height, width: width, inset: 10pt, vv.body)
        },
      )
    }))
  } else {
    code-as
    vv
  }
}

#let entry(name, type: "function") = {
  set box(inset: 0.3em, radius: 0.3em)
  box(fill: purple.transparentize(80%))[#raw(type)]
  box[#name]
}

// Manual content
#align(center)[#text(size: 24pt)[Numblex 0.2 Manual]]

// #outline()

= Concepts

== Numbering

Numbering is just a function that takes a list of numbers and returns a string. The result string could be like this

#align(center)[
  #set text(size: 16pt)
  ~\<1-(3).4.\>
]

We can split the string into several parts

#align(center)[
  #set text(size: 16pt)
  ~#pin(0)\<#pin(1)1#pin(2)-#pin(3);(3).#pin(4)4.#pin(5)\>#pin(6)
]
#let style = (stroke: (thickness: 1pt, paint: black.transparentize(70%)), radius: 0pt)
#pinit-highlight(0, 1, fill: blue.transparentize(60%), ..style)
#pinit-highlight(1, 2, fill: green.transparentize(60%), ..style)
#pinit-highlight(2, 3, fill: yellow.transparentize(60%), ..style)
#pinit-highlight(3, 4, fill: red.transparentize(60%), ..style)
#pinit-highlight(4, 5, fill: purple.transparentize(60%), ..style)
#pinit-highlight(5, 6, fill: orange.transparentize(60%), ..style)

The elements are categorized into two types: ordinals and constants. Here "<", "-", ">" are constants, and "1", "(3).", "4." are ordinals.

The element can be different in different contexts. For example, we might need them not to show up when the depth is not enough, or show up in different forms according to the depth.

== Numbering String

The Typst official numbering string is not powerful enough, we usually need to set the numbering to a custom function to implement more complex numbering. However, this leads to redundancy. We define a new format to represent the numbering.

#align(center)[
  #set text(size: 16pt)
  `{<} {[1]} {-} {([3]).} {[4].} {>}`
]

Each element is enclosed in a pair of curly braces(`{}`), and anything else is ignored. The element can be a constant(with no `[]` in it) or an ordinal(with `[]` in it).

// TODO: Conditions format

== Conditions

Conditions are functions that take the current numbering configuration and return a boolean value. Currently the following configuration options are defined:

=== Depth: `int`

The depth of the numbering.

From Typst v0.11.1 on, we can use heading.depth to get the depth of the heading. Similarly, we introduce the numbering depth, which is the length of the list of numbers passed to the numbering function.

== Reference

#show heading.where(level: 3): entry

=== `numblex`

==== Parameters
