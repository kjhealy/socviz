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
  if(any(x%%1!=0)){
    message("Input contains non-integers.")
  } else {
      d_string <- paste0(x, "-", month, "-", day)
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
