##'
##' Convenience not-in operator
##' Complement of the built-in operator \code{\%in\%}. Returns the elements of \code{x} that are not in \code{y}.
##' @title \%nin\%
##' @param x vector of items
##' @param y vector of all values
##' @return logical vecotor of items in x not in y
##' @author Kieran Healy
##' @rdname nin
##' @examples
##' fruit <- c("apples", "oranges", "banana")
##' apples %nin% fruit
##' pears %nin% fruit
##' @export
"%nin%" <- function(x, y) {
  return( !(x %in% y) )
}
##'
##' Convert an integer to a date.
##' @title int_to_year
##' @param x An integer or vector integers.
##' @param month The month to be added to the year. Months 1 to 9
##'     should be given as 01, 02, etc.
##' @param day The day to be added to the year. Days should be given
##'     as 01 or 02, etc, and not 1 or 2, etc.
##' @return A vector of dates where the input integer forms the year
##'     component. The day and month components added will by default
##'     be today's day and month. For input, only years 0:9999 are
##'     accepted.
##' @examples
##' int_to_year(1960)
##' class(int_to_year(1960))
##' int_to_year(1960:1965)
##' @author Kieran Healy
##' @export
int_to_year <- function(x, month="01", day="01") {
  values <- !is.na(x) ## non-NA values
  if(any(x[values]%%1!=0)){
    message("Input contains non-integers.")
  } else {
    d_string <- rep(NA, length(x))
    d_string[values] <- paste0(x[values], "-", month, "-", day)
    as.Date(strptime(d_string, format="%Y-%m-%d"))
  }
}

##' Use in inline R expressions to write a margin note for tufte-latex documents
##'
##' Borrowed from Dirk Eddelbuettel's tint package.
##' @title margin_textnote
##' @param text The text of the note
##' @param icon An icon
##' @return A marginal note
##' @author Kieran Healy (but really Dirk Eddelbuettel)
##' @export
margin_textnote <- function(text, icon = '&#8853;') {
  if (knitr:::is_html_output()) {
    marginnote_html(sprintf('<span class="marginnote">%s</span>', text), icon)
  } else if (knitr:::is_latex_output()) {
    sprintf('\\marginnote{%s}', text)
  } else {
    warning('margin_textnote() only works for HTML and LaTeX output', call. = FALSE)
    text
  }
}

##' Use in inline R expressions to write a monospaced margin note for tufte-latex documents
##'
##' Adapted from Dirk Eddelbuettel's tint package.
##' @title margin_codenote
##' @param text The text of the note
##' @param icon An icon
##' @return A marginal note in monospace font
##' @author Kieran Healy
##' @export
margin_codenote <- function(text, icon = '&#8853;') {
  if (knitr:::is_html_output()) {
    marginnote_html(sprintf('<span class="codenote">%s</span>', text), icon)
  } else if (knitr:::is_latex_output()) {
    sprintf('\\marginnote{\\texttt %s}', text)
  } else {
    warning('margin_codenote() only works for HTML and LaTeX output', call. = FALSE)
    text
  }
}

##' Arrange ggplot2 plots in an arbitrary grid
##'
##' The function takes arguments of the form `list(plot, row(s),
##'     column(s))` where `plot` is a ggplot2 plot object, and the
##'     rows and columns identify an area of the grid that you want
##'     that plot object to occupy. See http://stackoverflow.com/questions/18427455/multiple-ggplots-of-different-sizes
##' @title lay_out
##' @return A grid of ggplot2 plots
##' @author Extracted from the [wq] package
##' @examples
##' p1 <- qplot(x=wt,y=mpg,geom="point",main="Scatterplot of wt vs.
##'     mpg", data=mtcars)
##' p2 <- qplot(x=wt,y=disp,geom="point",main="Scatterplot of wt vs
##'     disp", data=mtcars)
##' p3 <- qplot(wt,data=mtcars)
##' lay_out(list(p1, 1:2, 1:4),
##'       list(p2, 3:4, 1:2),
##'       list(p3, 3:4, 3:4))
##' apples %nin% fruit
##' pears %nin% fruit
##' @export
lay_out = function(...) {
    x <- list(...)
    n <- max(sapply(x, function(x) max(x[[2]])))
    p <- max(sapply(x, function(x) max(x[[3]])))
    grid::pushViewport(grid::viewport(layout = grid::grid.layout(n, p)))

    for (i in seq_len(length(x))) {
        print(x[[i]][[1]], vp = grid::viewport(layout.pos.row = x[[i]][[2]],
            layout.pos.col = x[[i]][[3]]))
    }
}


##' Quickly make a two-way table of proportions (percentages)
##'
##' A wrapper for `table` and `prop.table` with the margin labels set
##'     by default to NULL and the cells rounded to percents at 1
##'     decimal place.
##' @title tw_tab
##' @param x Row variable
##' @param y Column variable
##' @param margin See `prop.table`. Default is joint distribution (all
##'     cells sum to 100), 1 for row margins (rows sum to 1), 2 for
##'     column margins (columns sum to 1)
##' @param digs Number of rigits to round percentages to. Defaults to 1.
##' @param dnn See `table`. the names to be given to the dimensions in
##'     the result (the dimnames names). Defaults to NULL for none.
##' @param ... Other arguments to be passed to `table`.
##' @return A contingency table of percentage values.
##' @author Kieran Healy
##' @export
tw_tab <- function(x, y, margin = NULL, digs = 1, dnn = NULL, ...) {
    out <- round(prop.table(table(x, y, ...), margin = margin)*100, digits = digs)
    out
}
