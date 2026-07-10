# typst-standard-form

A Typst package that formats an ordered list as a "standard form" logical
argument: numbered premises, a rule under the final premise, and an
unnumbered conclusion.

## Usage

Import `standard-form` and pass it a normal Typst ordered list. The last
item is treated as the conclusion; the item before it is the final premise
and gets underlined.

```typst
#import "@preview/standard-form:0.1.0": standard-form

#standard-form[
  + All humans are mortal
  + Socrates is human.
  + Socrates is mortal.
]
```

This produces:

1. All humans are mortal
2. <u>Socrates is human.</u>
&nbsp;&nbsp;&nbsp;Socrates is mortal.

Until the package is published, symlink it into Typst's local package
directory and import it as `@local/standard-form:0.1.0` instead (see
`example/example.typ`):

```sh
mkdir -p ~/Library/"Application Support"/typst/packages/local/standard-form
ln -s /path/to/typst-standard-form ~/Library/"Application Support"/typst/packages/local/standard-form/0.1.0
```

### Options

- `numbering-style` (default `"1."`): passed straight to Typst's
  `numbering()` function to control how premises are numbered.
- `stroke` (default `.8pt`): the stroke of the rule under the final premise.
- `spacing` (default `.35em`): the gap between the final premise and its
  rule.

```typst
#standard-form(numbering-style: "(1)", stroke: 1pt)[
  + All humans are mortal
  + Socrates is human.
  + Socrates is mortal.
]
```
