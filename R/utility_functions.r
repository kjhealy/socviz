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
##' "apples" %nin% fruit
##' "pears" %nin% fruit
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


##' check if is html output
##'
##' internal knitr function
##' @title is_html_output
##' @param fmt format
##' @param excludes excludes
##' @return html flag
##' @author Yihui Xie
is_html_output <- function (fmt = pandoc_to(), excludes = NULL)
{
    if (length(fmt) == 0)
        return(FALSE)
    if (grepl("^markdown", fmt))
        fmt = "markdown"
    if (fmt == "epub3")
        fmt = "epub"
    fmts = c("markdown", "epub", "html", "html5", "revealjs",
        "s5", "slideous", "slidy")
    fmt %in% setdiff(fmts, excludes)
}
##' pandoc_to
##'
##' what are we converting to
##' @title pandoc_to
##' @param x fmt
##' @return opt_knit element
##' @author Yihui Xie
pandoc_to <- function (x)
{
    fmt = knitr::opts_knit$get("rmarkdown.pandoc.to")
    if (missing(x))
        fmt
    else !is.null(fmt) && (fmt %in% x)
}
##' out_format
##'
##' internal knitr function
##' @title out_format
##' @param x x
##' @return format
##' @author Yihui Xie
out_format <- function (x)
{
    fmt = knitr::opts_knit$get("out.format")
    if (missing(x))
        fmt
    else !is.null(fmt) && (fmt %in% x)
}

##' is_latex_output
##'
##' is latex output
##' @title is_latex_output
##' @return the format
##' @author Yihui Xie
is_latex_output <- function ()
{
    out_format("latex") || pandoc_to(c("latex", "beamer"))
}

##' marginal note for tufte html output
##'
##' Make a html margin note
##' @title marginnote_html
##' @param text The text of the note
##' @param icon An icon
##' @return An HTML note
##' @author Dirk Eddelbuettel
##' @examples
##' \dontrun{
##' marginnote_html("Hello")
##' }
marginnote_html <- function (text = "", icon = "&#8853;")
{
    sprintf(paste0("<label for=\"tufte-mn-\" class=\"margin-toggle\">%s</label>",
        "<input type=\"checkbox\" id=\"tufte-mn-\" class=\"margin-toggle\">%s"),
        icon, text)
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
  if (is_html_output()) {
    marginnote_html(sprintf('<span class="marginnote">%s</span>', text), icon)
  } else if (is_latex_output()) {
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
  if (is_html_output()) {
    marginnote_html(sprintf('<span class="codenote">%s</span>', text), icon)
  } else if (is_latex_output()) {
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
##'     that plot object to occupy. See
##'     http://stackoverflow.com/questions/18427455/multiple-ggplots-of-different-sizes
##' @title lay_out
##' @return A grid of ggplot2 plots
##' @author Extracted from the [wq] package
##' @param ... A series lists of of ggplot objects
##' @examples
#'\dontrun{
##' p1 <- qplot(x=wt,y=mpg,geom="point",main="Scatterplot of wt vs.
##'     mpg", data=mtcars)
##' p2 <- qplot(x=wt,y=disp,geom="point",main="Scatterplot of wt vs
##'     disp", data=mtcars)
##' p3 <- qplot(wt,data=mtcars)
##' lay_out(list(p1, 1:2, 1:4),
##'       list(p2, 3:4, 1:2),
##'       list(p3, 3:4, 3:4))
##' }
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

##' Arrange ggplot objects on an arbitrary page grid
##'
##' ggplot objects can be passed in ..., or to plotlist (as a list of
##'     ggplot objects). If the layout is something like matrix(c(1,2,3,3), nrow=2,
##'     byrow=TRUE), then plot 1 will go in the upper left, 2 will go
##'     in the upper right, and 3 will go all the way across the bottom.
##' @title multiplot
##' @param ... ggplot objects
##' @param plotlist ggplot objects
##' @param file .
##' @param cols Number of columns in the layout. Ignored if layout is present.
##' @param layout A matrix specifying the layout. If present, 'cols' is ignored.
##' @return Prints a grid of plot objects
##' @author Winston Chang
##' @export
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)

  numPlots = length(plots)

  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                    ncol = cols, nrow = ceiling(numPlots/cols))
  }

 if (numPlots==1) {
    print(plots[[1]])

  } else {
    # Set up the page
    grid::grid.newpage()
    grid::pushViewport(grid::viewport(layout = grid::grid.layout(nrow(layout), ncol(layout))))

    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))

      print(plots[[i]], vp = grid::viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}


##' Round numeric columns of a data frame or tibble
##'
##' Takes a data frame or tibble as input, rounds the numeric columns to the
##'     specified number of digits.
##' @title round_df
##' @param data A data frame or tibble
##' @param dig The number of digits to round to
##' @return An object of the same class as `data`, with the numeric
##'     columns rounded off to `dig`
##' @author Kieran Healy
##' @export
round_df <- function(data, dig=2) {
    obj_class <- class(data)
    tibs <- c("grouped_df", "tbl_df", "tbl")
    all.c <- c("data.frame", tibs)

    ## Is `data` a valid class
    right.class <- any(obj_class %in% all.c)
    if(!right.class) return(message("Object is not a data frame or tibble."))

    ## Is `data` a tibble or df
    is.tib <- any(obj_class %in% tibs)
    if(is.tib) {
        cl <- "tbl"
    } else {
        cl <- "df"
    }

    ## Choose which function to use
    f.list <- list(df = data.frame, tbl = tibble::as_tibble)
    fx <- get(cl, f.list)

    fx(lapply(data, function(y) if(is.numeric(y)) round(y, dig) else y))
}

##' Scale and/or center the numeric columns of a data frame or tibble
##'
##' Takes a data frame or tibble as input and scales and/or centers
##'     the numeric columns. By default, centers but doesn't scale
##' @title center_df
##' @param data A data frame or tibble
##' @param sc Scale the variables (default FALSE)
##' @param cen Center the variables on their means (default TRUE)
##' @return An object of the same class as `data`, with the numeric
##'     columns scaled or centered as requested
##' @author Kieran Healy
##' @export
center_df <- function(data, sc = FALSE, cen = TRUE) {
    obj_class <- class(data)
    tibs <- c("grouped_df", "tbl_df", "tbl")
    all.c <- c("data.frame", tibs)

    ## Is `data` a valid class
    right.class <- any(obj_class %in% all.c)
    if(!right.class) return(message("Object is not a data frame or tibble."))

    ## Is `data` a tibble or df
    is.tib <- any(obj_class %in% tibs)
    if(is.tib) {
        cl <- "tbl"
    } else {
        cl <- "df"
    }

    ## Choose which function to use
    f.list <- list(df = data.frame, tbl = tibble::as_tibble)
    fx <- get(cl, f.list)

    ind <- sapply(data, is.numeric)
    data[ind] <- lapply(data[ind], scale, scale=sc, center=cen)
    data <- fx(data)
    data
}

##' Strip a series of characters from the beginning of a character vector.
##'
##' Takes a character vector (usually vector of variable names from a
##'     summarized or tidied model object), along with a vector of
##'     character terms (usually the prefix of a dummy or categorical
##'     variable added by R when creating model terms) and strips the
##'     latter away from the former. Useful for quickly cleaning
##'     variable names for a plot.
##' @title strip_prefix
##' @param var_name A character vector, usually variable names
##' @param prefixes A character vector, usually variable prefixes
##' @param toTitle Convert results to Title Case? Defaults to TRUE.
##' @return A character vector with `prefixes` terms stripped from the
##'     beginning of `var_name` terms.
##' @author Kieran Healy
##' @export
strip_prefix <- function(var_name, prefixes, toTitle = TRUE) {
    pre_terms <- paste0("^", prefixes, collapse = "|")
    new_labs <- gsub(pre_terms, "", var_name)
    if(toTitle) tools::toTitleCase(new_labs) else new_labs
}
