library(tictoc)

tic()
rmarkdown::render(
  input = "spatial-mlr3.Rmd", output_format = "html_document",
  output_file = "docs/index.html"
)
toc()