library(knitr)
library(rmarkdown)
library(here)
library(xaringanBuilder)

# /*===========================================================
#' # Chapter 2: Rmarkdown
# /*===========================================================
rmarkdown::render(here("Chapter-2-Rmarkdown/Rmarkdown_x.rmd"))

# /*===========================================================
#' # Chapter 3: Data Wrangling
# /*===========================================================
rmarkdown::render(here("Chapter-3-DataWrangling/data_wrangling_basics_x.rmd"))
build_pdf(here("Chapter-3-DataWrangling/data_wrangling_basics_x.html"))


rmarkdown::render(here("Chapter-3-DataWrangling/data_wrangling_reshape_merge_x.rmd"))
build_pdf(here("Chapter-3-DataWrangling/data_wrangling_reshape_merge_x.html"))