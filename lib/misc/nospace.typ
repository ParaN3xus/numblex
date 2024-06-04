
/// No space
/// don't show #v(0.3em) after number of the title
#let numblex_nospace = {
  it => context {
    [#counter(heading).display()#it.body#parbreak()]    
  }
}
