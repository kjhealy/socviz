#' @importFrom ggplot2 %+replace%
NULL

## Socviz theme; ggplot2 >= 4.0.0

#' A ggplot2 theme for socviz
#'
#' A ggplot theme with
#' defaults for axis styling, legends, panels,
#' strips, and plot chrome. Requires ggplot2 >= 4.0.0.
#'
#' The theme uses Source Sans 3 (regular weight) as the base
#' font family and Source Sans 3 Semibold as the header family.
#' If the fonts are not installed, they will be downloaded
#' automatically from Google Fonts via
#' [systemfonts::require_font].
#'
#' @param base_size Base font size in points. Default is 12.
#' @param base_family Base font family. Default is
#'   `"Source Sans 3"`.
#' @param header_family Font family for plot titles. Default is
#'   `"Source Sans 3"`.
#' @param base_line_size Base line width, scaled from
#'   `base_size`.
#' @param base_rect_size Base rect border width, scaled from
#'   `base_size`.
#' @param ink Color used for text, lines, and foreground
#'   elements. Default is `"black"`.
#' @param paper Color used for backgrounds. Default is
#'   `"white"`.
#' @param accent Accent color for geom defaults. Default is
#'   `"#0072B2"`.
#'
#' @return A ggplot2 theme object.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() +
#'   theme_socviz()
#' }
#'
#' @export
theme_socviz <- function(
  base_size = 12,
  base_family = "Source Sans 3",
  header_family = "Source Sans 3",
  base_line_size = base_size / 24,
  base_rect_size = base_size / 24,
  ink = "black",
  paper = "white",
  accent = "#0072B2"
) {
  systemfonts::require_font(
    base_family,
    fallback = "sans",
    error = FALSE,
    verbose = FALSE
  )
  if (!identical(header_family, base_family)) {
    systemfonts::require_font(
      header_family,
      fallback = "sans",
      error = FALSE,
      verbose = FALSE
    )
  }

  half_line <- base_size / 2
  quarter_line <- base_size / 4

  discrete_palette <- c(
    "#E69F00",
    "#56B4E9",
    "#009E73",
    "#D55E00",
    "#CC79A7",
    "#0072B2",
    "#F0E442",
    "#000000"
  )

  t <- ggplot2::theme_minimal(
    base_size = base_size,
    base_family = base_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,
    ink = ink,
    paper = paper
  )

  ## Base elements and geom defaults
  t <- t +
    ggplot2::theme(
      line = ggplot2::element_line(
        colour = ink,
        linewidth = base_line_size,
        linetype = 1,
        lineend = "butt"
      ),
      rect = ggplot2::element_rect(
        fill = paper,
        colour = ink,
        linewidth = base_rect_size,
        linetype = 1
      ),
      text = ggplot2::element_text(
        family = base_family,
        face = "plain",
        colour = ink,
        size = base_size,
        lineheight = 0.9,
        hjust = 0.5,
        vjust = 0.5,
        angle = 0
      ),
      geom = ggplot2::element_geom(
        ink = ink,
        paper = paper,
        accent = accent,
        family = base_family,
        fontsize = base_size
      )
    )

  ## Axes: shared properties
  t <- t +
    ggplot2::theme_sub_axis(
      line = ggplot2::element_line(
        color = "gray10",
        linewidth = 0.5
      ),
      text = ggplot2::element_text(
        color = ink,
        size = base_size * 1.3
      ),
      ticks = ggplot2::element_line(colour = "grey10"),
      ticks.length = grid::unit(quarter_line, "pt"),
      title = ggplot2::element_text(size = base_size * 1.2)
    )

  ## Axes: x-axis specifics
  t <- t +
    ggplot2::theme_sub_axis_x(
      text = ggplot2::element_text(
        margin = ggplot2::margin(t = 0.8 * half_line / 2),
        vjust = 1
      ),
      title = ggplot2::element_text(
        margin = ggplot2::margin(t = half_line / 2),
        vjust = 1
      )
    ) +
    ggplot2::theme_sub_axis_top(
      text = ggplot2::element_text(
        margin = ggplot2::margin(b = 0.8 * half_line / 2),
        vjust = 0
      ),
      title = ggplot2::element_text(
        margin = ggplot2::margin(b = half_line / 2),
        vjust = 0
      )
    )

  ## Axes: y-axis specifics
  t <- t +
    ggplot2::theme_sub_axis_y(
      text = ggplot2::element_text(
        margin = ggplot2::margin(r = 0.8 * half_line / 2),
        hjust = 1
      ),
      title = ggplot2::element_text(
        angle = 90,
        margin = ggplot2::margin(r = half_line / 2),
        vjust = 1
      )
    ) +
    ggplot2::theme_sub_axis_right(
      text = ggplot2::element_text(
        margin = ggplot2::margin(l = 0.8 * half_line / 2),
        hjust = 0
      ),
      title = ggplot2::element_text(
        angle = -90,
        margin = ggplot2::margin(l = half_line / 2),
        vjust = 0
      )
    )

  ## Legend
  t <- t +
    ggplot2::theme_sub_legend(
      background = ggplot2::element_blank(),
      spacing = grid::unit(base_size, "pt"),
      margin = ggplot2::margin(
        half_line,
        half_line,
        half_line,
        half_line
      ),
      key = ggplot2::element_rect(fill = paper, colour = NA),
      key.size = grid::unit(1.2, "lines"),
      text = ggplot2::element_text(size = base_size * 0.9),
      title = ggplot2::element_text(hjust = 0),
      position = "top",
      direction = "horizontal",
      box = "horizontal",
      justification = "center",
      box.margin = ggplot2::margin(0, 0, 0, 0, "cm"),
      box.background = ggplot2::element_blank(),
      box.spacing = grid::unit(base_size, "pt")
    )

  ## Panel
  t <- t +
    ggplot2::theme_sub_panel(
      background = ggplot2::element_rect(
        fill = paper,
        colour = NA
      ),
      border = ggplot2::element_blank(),
      grid = ggplot2::element_line(
        colour = "gray90",
        linewidth = 0.1
      ),
      grid.major = ggplot2::element_line(
        colour = "gray90",
        linewidth = 0.1
      ),
      grid.minor = ggplot2::element_line(
        colour = "gray90",
        linewidth = 0.1
      ),
      spacing = grid::unit(half_line, "pt"),
      ontop = FALSE
    )

  ## Strips
  t <- t +
    ggplot2::theme_sub_strip(
      background = ggplot2::element_blank(),
      clip = "inherit",
      text = ggplot2::element_text(
        colour = "grey10",
        size = base_size * 1.1,
        margin = ggplot2::margin(
          0.8 * half_line,
          0.8 * half_line,
          0.8 * half_line,
          0.8 * half_line
        )
      ),
      text.y = ggplot2::element_text(angle = -90),
      text.y.left = ggplot2::element_text(angle = 90),
      placement = "inside",
      switch.pad.grid = grid::unit(quarter_line, "pt"),
      switch.pad.wrap = grid::unit(quarter_line, "pt")
    )

  ## Plot chrome
  t <- t +
    ggplot2::theme_sub_plot(
      background = ggplot2::element_rect(colour = paper),
      title = ggplot2::element_text(
        family = header_family,
        face = "bold",
        size = base_size * 1.4,
        hjust = 0,
        vjust = 1,
        margin = ggplot2::margin(b = half_line)
      ),
      title.position = "panel",
      subtitle = ggplot2::element_text(
        hjust = 0,
        vjust = 1,
        size = base_size * 1.25,
        margin = ggplot2::margin(b = half_line)
      ),
      caption = ggplot2::element_text(
        size = base_size * 0.9,
        hjust = 1,
        vjust = 1,
        margin = ggplot2::margin(t = half_line)
      ),
      caption.position = "panel",
      tag = ggplot2::element_text(
        size = base_size * 1.2,
        hjust = 0.5,
        vjust = 0.5
      ),
      tag.position = "topleft",
      margin = ggplot2::margin(
        half_line,
        half_line,
        half_line,
        half_line
      )
    )

  ## Discrete palette
  t <- t +
    ggplot2::theme(
      palette.colour.discrete = discrete_palette,
      palette.fill.discrete = discrete_palette
    )

  t
}

#' A map theme for socviz
#'
#' A theme based on [theme_socviz] with all axes, grids, and
#' borders removed, suitable for plotting maps.
#'
#' @inheritParams theme_socviz
#'
#' @return A ggplot2 theme object.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(map_data("state"), aes(long, lat, group = group)) +
#'   geom_polygon(fill = "gray90", colour = "white") +
#'   coord_map() +
#'   theme_socviz_map()
#' }
#'
#' @export
theme_socviz_map <- function(
  base_size = 12,
  base_family = "Source Sans 3",
  header_family = "Source Sans 3",
  base_line_size = base_size / 24,
  base_rect_size = base_size / 24,
  ink = "black",
  paper = "white",
  accent = "#0072B2"
) {
  theme_socviz(
    base_size = base_size,
    base_family = base_family,
    header_family = header_family,
    base_line_size = base_line_size,
    base_rect_size = base_rect_size,
    ink = ink,
    paper = paper,
    accent = accent
  ) %+replace%
    ggplot2::theme(
      axis.line = ggplot2::element_blank(),
      axis.text = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank(),
      axis.text.x.top = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      axis.text.y.right = ggplot2::element_blank(),
      axis.ticks = ggplot2::element_blank(),
      axis.title = ggplot2::element_blank(),
      axis.title.x = ggplot2::element_blank(),
      axis.title.x.top = ggplot2::element_blank(),
      axis.title.y = ggplot2::element_blank(),
      axis.title.y.right = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank(),
      panel.border = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.spacing = grid::unit(0, "lines"),
      plot.background = ggplot2::element_blank(),
      plot.title = ggplot2::element_text(hjust = 0),
      legend.justification = c(0, 0),
      legend.position = "bottom",
      legend.title.position = "top",
      legend.key.height = grid::unit(0.75, "lines")
    )
}
