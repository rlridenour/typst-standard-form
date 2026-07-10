// Format an ordered list as a standard-form logical argument: numbered
// premises, a rule under the final premise, and an unnumbered conclusion.
#let standard-form(
  numbering-style: "1.",
  stroke: .8pt,
  spacing: .35em,
  body,
) = {
  let items = if body.func() == enum.item {
    (body,)
  } else {
    body.children.filter(c => c.func() == enum.item)
  }
  let premises = items.map(i => i.body)
  let n = premises.len()

  let styled = premises.enumerate().map(((i, premise)) => {
    if i == n - 2 {
      // The final premise: underline it, sized to its own width.
      context {
        let w = measure(premise).width
        stack(
          dir: ttb,
          spacing: spacing,
          premise,
          line(length: w, stroke: stroke),
        )
      }
    } else {
      premise
    }
  })

  enum(
    numbering: (..nums) => {
      if nums.pos().first() == n {
        // The conclusion: no number.
        []
      } else {
        numbering(numbering-style, ..nums)
      }
    },
    ..styled
  )
}
