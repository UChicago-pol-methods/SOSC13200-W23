#' ---
#' title: "Assignment 5, Social Science Inquiry II (SOSC13200-W22-3)"
#' author: "<your name here>"
#' date: "Monday 2/6/23 at 5pm"
#' ---
#' Packages
library(ggplot2)

#' Analysis is based on:
#' 
#' Pager, Devah. The mark of a criminal record. *American Journal of Sociology* 108, no. 5 (2003): 937-975. 
#' 
#' # 1. 
#' 
#' ## (1a)
#' Re-generate the data used in Pager (2003) based on a reading of the text. Create a 
#' data set that has the following variables: 
#' 
#' - `black`, which is an indicator that is 1 if the respondent is black, and 0 otherwise. 
#' - `record`, which is an indicator that is 1 if the respondent has a criminal record, and 0 otherwise. 
#' - `call_back`, which is an indicator that is 1 if the respondent was called back, and 0 otherwise. 
#' 
#' The data set should have one row for every observation, where an observation 
#' is an individual audit. I.e., the data set should have 700 rows, and 3 columns. 
#' *Note: total number of call backs for whites with criminal records could 
#' plausibly take on two values*. 

# your code here

#' 
#' ## (1b) 
#' Recreate Figure 6 in the paper. 
#' 

# your code here

#' 
#' # 2. Randomization inference. 
#' 
#' **Pager reports that "The main effects of race and criminal record are statically significant (P <.01)."**
#' 
#' ## (2a)
#' Create a new variable called `W`, which is a copy of `record`. 
#' Create a new variable called `Y` which is a copy of `call_back`. 
#' Report the number of audits assigned treatment and control if we consider
#' having a criminal record to be the treatment condition. 

# your code here

#' ## (2b) 
#' Get the difference-in-means estimate of the ATE on `Y`, and save the
#'  estimate as an object called `ate`. Report the value of your 
#'  difference-in-means estimate of the ATE.

# your code here

#' ## (2c)  
#' Create a new column called `newW` which resamples from `W` *without* 
#' replacement. Report the number of individuals assigned treatment and control 
#' under `newW`. Is it the same as under W?

# your code here

#' ## (2d) 
#' Calculate the difference-in-means estimate of the average treatment 
#' effect UNDER THE RE-SAMPLED TREATMENT, `newW`.

# your code here

#' ## (2e) 
#' Write a randomization inference function that takes a data frame `df` 
#' as an argument, then:
#'   
#'   - Creates a new column called `newW` which resamples from W.
#'   - Calculates the difference in means estimate of the average treatment effect UNDER THE RE-SAMPLED TREATMENT, `newW`.
#'   - Returns the value of estimated ATE.
#'   
#'   Apply your randomization inference function to the pager data and report the estimated ATE. 

# your code here

#' ## (2f) 
#' Using `replicate()`, apply your function to the pager data 1000 times.
#' Save the output but DO NOT print it out here. 

# your code here

#' ## (2g) 
#' Report the portion of your results from question 2f that have a larger 
#' *absolute value* than the *absolute value* of the object `ate`.

# your code here

#' ## (2h) 
#' How do you interpret the p-value in 2g? Is your answer consistent
#' with what Pager reports?

# your answer here

#' # (XX) Extra credit
#' Worth 2 points. 
#' 
#' Consider the function `gendist()` in the `ri` package. Look at the inputs, 
#' and what the function outputs. Using the toy data set from class 
#' (recreated below), write your own function that takes the same inputs and 
#' produces the same output. 
#' 
#' If you have issues downloading the package because of your R version, you
#' should be able to access a version following the below commands 
#' (uncommented).
#' 
#' `# install.packages('remotes')`
#' 
#' `# library(remotes)`
#' 
#' `# install_github('cran/ri')`
#' 

df <- data.frame(
  # our initial treatment vector
  W = c(1, 0, 0, 0, 0, 0, 1),
  # our initial response vector
  Y = c(15, 15, 20, 20, 10, 15, 30),
  # treatment assignment probability
  probs = rep(2/7, 7)
)