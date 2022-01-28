#* set up python environment
library(reticulate)
# py_config()
library(here)
library(tidyverse)
setwd(here("Draft-Chapter-11-Python"))

source_python("econml_test.py")
source_python("run_DMLOF.py")

dmlof_res <- run_DML_OF(py$Y, py$T, py$X, py$W, py$X_test)
dmlof_res <- run_DML_CF(py$Y, py$T, py$X, py$W, py$X_test)