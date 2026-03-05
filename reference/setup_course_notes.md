# setup_course_notes

Copy and expand course notes to the desktop

## Usage

``` r
setup_course_notes(
  folder,
  zipfile = "dataviz_course_notes.zip",
  packet = "dataviz_course_notes"
)
```

## Arguments

- folder:

  The destination to copy to within the user's home. This must be
  supplied by the user.

- zipfile:

  The name of the zipped course materials file in the socviz library.

- packet:

  The name of the course packet folder to be created

## Value

The \`zipfile\` is copied to \`folder\` and its contents expanded into a
directory, the \`packet\`.

## Details

Transfers a zip file containing course materials from the socviz library
to the Desktop.

## Author

Kieran Healy

## Examples

``` r
setup_course_notes()
#> You must specify a destination for the notes, e.g., '~/Desktop'
```
