# BAN400
# Parallel computing
# 31.10.2023


# Tic toc
library(tictoc)

# Function taken from lecture
printTicTocLog <-
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }


# Time for original script
tic.clearlog()

tic("Original script")
source("scripts/no_changes.r")
toc(log = TRUE)

printTicTocLog() %>% knitr::kable()


# Time for script with change in lines 29-35
tic.clearlog()

tic("Lines 29-35 changed")
source("scripts/loop_change.r")
toc(log = TRUE)

printTicTocLog() %>% knitr::kable()


# Time for script with change in MTweedieTests function
tic.clearlog()

tic("Function MTweedieTests changed")
source("scripts/function_change.r")
toc(log = TRUE)

printTicTocLog() %>% knitr::kable()


# The time the scripts take to execute is stable at 
# roughly 58 seconds. It seems as if the execution of 
# neither the loop in lines 29-35 or the replication
# of the function have a significant impact on running time.
# Instead, when looking at the time needed for the last loop
# of assignment 4, which is visible as i is printed in each
# iteration, it may be worth optimising this as well as the other
# functions in the script.
