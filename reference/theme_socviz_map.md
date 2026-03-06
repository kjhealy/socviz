# A map theme for socviz

A theme based on \[theme_socviz\] with all axes, grids, and borders
removed, suitable for plotting maps.

## Usage

``` r
theme_socviz_map(
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

A ggplot2 theme object.

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)
ggplot(map_data("state"), aes(long, lat, group = group)) +
  geom_polygon(fill = "gray90", colour = "white") +
  coord_map() +
  theme_socviz_map()
} # }
```
