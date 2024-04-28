/// Numblex main function
///
/// docs TBD
#let numblex(numberings: (), depth: ()) = {
  let ret = (..numbers) => {
    let nums = numbers.pos()
    let this_depth = depth.at(nums.len() - 1)
    let ans = ""

    for d in range(nums.len() - this_depth, nums.len()) {
      ans = ans + numbering(numberings.at(d), nums.at(d))
    }

    ans
  }
  return ret
}
