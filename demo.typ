
#let numblex(numberings: (), depth: ()) = {
  
  let ret = (..numbers) => {
    let nums = numbers.pos()
    let this_depth = depth.at(nums.len() - 1)
    let ans = ""

    for d in range(nums.len() - this_depth, nums.len()){
      ans = ans + numbering(numberings.at(d), nums.at(d))
    }

    ans
  }
  return ret
}

#let circle_numbers(n) = {
  let nums = (
    "①", "②", "③", "④", "⑤", "⑥", "⑦", "⑧", "⑨", "⑩",
    "⑪", "⑫", "⑬", "⑭", "⑮", "⑯", "⑰", "⑱", "⑲", "⑳"
  )
  nums.at(n - 1)
}


#set heading(
  numbering: numblex(numberings: ("一.", "1.", "(1).", circle_numbers), depth: (1, 1, 2, 4)) 
)

= 你说得对
== 但是
=== 原神
=== 是一款
==== 对