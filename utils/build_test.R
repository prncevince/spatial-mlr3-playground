library(tictoc)

tic()
rmarkdown::render(
  input = "test.Rmd", output_dir = "docs", output_format = "html_document"
)
toc()