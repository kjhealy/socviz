#' @importFrom magrittr "%>%"
NULL

##' Convenience 'not-in' operator
##'
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


##' Convert an integer to a date.
##'
##' @title int_to_year
##' @param x An integer or vector integers.
##' @param month The month to be added to the year. Months 1 to 9
##'     should be given as 01, 02, etc.
##' @param day The day to be added to the year. Days should be given
##'     as 01 or 02, etc, and not 1 or 2, etc.
##' @return A vector of dates where the input integer forms the year
##'     component. The day and month components added will by default
##'     be the 15th of June, so that tick marks will appear in the
##'     middle of the series on plots. For input, only years 0:9999 are
##'     accepted.
##' @examples
##' int_to_year(1960)
##' class(int_to_year(1960))
##' int_to_year(1960:1965)
##' @author Kieran Healy
##' @export
int_to_year <- function(x, month="06", day="15") {
  values <- !is.na(x) ## non-NA values
  if(any(x[values]%%1!=0)){
    message("Input contains non-integers.")
  } else {
    d_string <- rep(NA, length(x))
    d_string[values] <- paste0(x[values], "-", month, "-", day)
    as.Date(strptime(d_string, format="%Y-%m-%d"))
  }
}

##' Draw a palette of colors
##'
##' Borrowed from the colorspace library
##' @title Draw a palette of colors
##' @param col vector of colors
##' @param border border
##' @param ... other arguments
##' @return Plot of a color palette
##' @author colorspace library authors
##' @examples
##' \dontrun{
##' color_pal(5)}
color_pal <- function(col, border = "light gray", ...)
{
  n <- length(col)
  graphics::plot(0, 0, type="n", xlim = c(0, 1), ylim = c(0, 1),
    axes = FALSE, xlab = "", ylab = "", ...)
  graphics::rect(0:(n-1)/n, 0, 1:n/n, 1, col = col, border = border)
}

##' Plot a table of color hex values as a table of colors
##'
##' Given a data frame of color values, plot them as swatches
##' @title Plot a table of color hex values as a table of colors
##' @param df data frame of color hex values
##' @return Plot of table of colors
##' @author Kieran Healy
##' @examples
##' \dontrun{
##' color_table
##' color_comp(color_table)
##' }
##' @export
color_comp <- function(df) {
    d <- as.data.frame(df)
    graphics::plot.new()
    graphics::par(mfrow = c(ncol(d), 1), mar = c(1, 0, 2, 0), cex = 1.2)

    for(i in 1:ncol(d)) {
        color_pal(d[,i])
        graphics::title(colnames(d)[i])
    }
}



##' Generate a tidy n-way frequency table
##'
##' tidyverse, pipeline, and dplyr-friendly frequency tables
##' @title freq_tab
##' @param df tibble or data frame (implicit within pipline)
##' @param ... grouping, as with group_by()
##' @return A tibble with the grouping variables, the N (`n`) per group, and
##'     the proportion (`prop`) of each group, calculated with respect to the
##'     outermost grouping variable.
##' @author Kieran Healy
##' @examples
##' \dontrun{
##' mtcars %>% freq_tab(vs, gear, carb)
##' }
##' @export
freq_tab <- function (df, ...)
{
    grouping <- rlang::quos(...)
    n <- NULL

    if(dplyr::is_grouped_df(df)) {
        out_tbl <- df %>% dplyr::count(!!!grouping)
    } else {
        out_tbl <- df %>% dplyr::group_by(!!!grouping) %>% dplyr::count()
    }

    n_groups <- length(dplyr::group_vars(out_tbl))

    if(n_groups == 1) {
        out_tbl %>% dplyr::ungroup() %>%
            dplyr::mutate(freq = n/sum(n))
    } else {
        outer_group <- dplyr::groups(out_tbl)[[1]]
        out_tbl %>% dplyr::group_by(!!outer_group) %>%
            dplyr::mutate(prop = prop.table(n))
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
##' \dontrun{
##' library(tidyverse)
##' p1 <- qplot(x=wt,y=mpg,geom="point",main="Scatterplot of wt vs.
##'     mpg", data=mtcars)
##' p2 <- qplot(x=wt,y=disp,geom="point",main="Scatterplot of wt vs
##'     disp", data=mtcars)
##' p3 <- qplot(wt,data=mtcars)
##' lay_out(list(p1, 1:2, 1:4),
##'       list(p2, 3:4, 1:2),
##'       list(p3, 3:4, 3:4))
##'}
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
##' @examples
##'
##' with(gss_sm, tw_tab(bigregion, religion, useNA = "ifany", digs =
##'     1))
##'
##' with(gss_sm, tw_tab(bigregion, religion, margin = 2, useNA =
##'     "ifany", digs = 1))
##'
##' @export
tw_tab <- function(x, y, margin = NULL, digs = 1, dnn = NULL, ...) {
    out <- round(prop.table(table(x, y, ...), margin = margin)*100, digits = digs)
    out
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
##' @examples
##' head(round_df(iris, 0))
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
##' @examples
##' head(center_df(organdata))
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
##' @title prefix_strip
##' @param var_string A character vector, usually variable names
##' @param prefixes A character vector, usually variable prefixes
##' @param toTitle Convert results to Title Case? Defaults to TRUE.
##' @param ... Other arguments to `gsub`
##' @return A character vector with `prefixes` terms stripped from the
##'     beginning of `var_name` terms.
##' @author Kieran Healy
##' @examples
##' prefix_strip(iris$Species, c("set", "v"))
##' @export
prefix_strip <- function(var_string, prefixes, toTitle = TRUE, ...) {
    pre_terms <- paste0("^", prefixes, collapse = "|")
    new_labs <- gsub(pre_terms, "", var_string, ...)
    if(toTitle) tools::toTitleCase(new_labs) else new_labs
}


##' Replace series of characters (usually variable names) at the beginning of a character vector.
##'
##' Takes a character vector (usually vector of variable names from a
##'     summarized or tidied model object), along with a vector of
##'     character terms (usually the prefix of a dummy or categorical
##'     variable added by R when creating model terms) and strips the
##'     latter away from the former. Useful for quickly cleaning
##'     variable names for a plot.
##' @title prefix_replace
##' @param var_names A character vector, usually variable names
##' @param prefixes A character vector, usually variable prefixes
##' @param replacements A character vector of replacements for the
##'     `prefixes`, in the same order as them.
##' @param toTitle Convert results to Title Case? Defaults to TRUE.
##' @param ... Other arguments to `gsub`
##' @return A character vector with `prefixes` terms in `var_names`
##'     replaced with the content of the `replacement` terms.
##' @examples
##' prefix_replace(iris$Species, c("set", "ver", "vir"), c("sat",
##'     "ber", "bar"))
##' @author Kieran Healy
##' @export
prefix_replace <- function(var_names, prefixes, replacements, toTitle = TRUE, ...) {
    out <- var_names
    for (i in seq_along(prefixes)) {
    out <- gsub(prefixes[i], replacements[i], out, ...)
  }
  if(toTitle) tools::toTitleCase(out) else out
}

##' Copy and expend course notes to the desktop
##'
##' Transfers a zip file containing course materials from the socviz
##'     library to the Desktop.
##' @title setup_course_notes
##' @param folder The destination to copy to within the user's home.
##'     This must be supplied by the user.
##' @param zipfile The name of the zipped course materials file in the
##'     socviz library.
##' @param packet The name of the course packet folder to be created
##' @return The `zipfile` is copied to `folder` and its contents
##'     expanded into a directory, the `packet`.
##' @author Kieran Healy
##' @export
setup_course_notes <- function(folder, zipfile = "dataviz_course_notes.zip",
                               packet = "dataviz_course_notes") {
    if(missing(folder)) {
        message("You must specify a destination for the notes, e.g., '~/Desktop'")
    } else {
        file_name <- zipfile
        lib_loc <- fs::path_package("socviz")

        origin_path <- fs::path(lib_loc, "resources", file_name)
        dest_path <- fs::path_expand(folder)

        if(fs::dir_exists(dest_path)) {

            fs::file_copy(origin_path, dest_path)

            dest_file <- fs::path(dest_path, file_name)
            fs::dir_create(dest_path, packet)
            dest_dir_name <- fs::path(dest_path, packet)

            utils::unzip(dest_file, exdir = dest_dir_name)

            message(paste("Copied", file_name, "to", dest_path, "and expanded it into", dest_dir_name))
        } else {
        message(paste("Failed. Cannot copy notes to the folder", dest_path, "because it does not exist."))}
        }
}
##' @examples
##' \dontrun{
##' setup_course_notes(folder = "~/Documents")
##' }
