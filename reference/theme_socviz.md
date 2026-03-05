# A ggplot2 theme for socviz

A custom theme built on \[ggplot2::theme_minimal()\] with opinionated
defaults for axis styling, legends, panels, strips, and plot chrome.
Requires ggplot2 \>= 4.0.0.

## Usage

``` r
theme_socviz(
  base_size = 12,
  base_family = "Source Sans 3",
  header_family = "Source Sans 3",
  base_line_size = base_size/24,
  base_rect_size = base_size/24,
  ink = "black",
  paper = "white",
  accent = "#0072B2"
)
```

## Arguments

- base_size:

  Base font size in points. Default is 12.

- base_family:

  Base font family. Default is \`"Source Sans 3"\`.

- header_family:

  Font family for plot titles. Default is \`"Source Sans 3"\`.

- base_line_size:

  Base line width, scaled from \`base_size\`.

- base_rect_size:

  Base rect border width, scaled from \`base_size\`.

- ink:

  Color used for text, lines, and foreground elements. Default is
  \`"black"\`.

- paper:

  Color used for backgrounds. Default is \`"white"\`.

- accent:

  Accent color for geom defaults. Default is \`"#0072B2"\`.

## Value

A \[ggplot2::theme()\] object.

## Details

The theme uses Source Sans 3 (regular weight) as the base font family
and Source Sans 3 Semibold as the header family. If the fonts are not
installed, they will be downloaded automatically from Google Fonts via
\[systemfonts::require_font()\].

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  theme_socviz()
} # }
```
