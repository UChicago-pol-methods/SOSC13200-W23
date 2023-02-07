#' ---
#' title: "Assignment 4, Social Science Inquiry II (SOSC13200-W23-2)"
#' author: "<your name here>"
#' date: "Monday 1/30/22 at 5pm"
#' ---
#' Packages
library(ggplot2)

#' Read in the data. We will use the data from:
#' 
#' Angrist, Joshua D., and Alan B. Krueger. "Does compulsory school attendance affect schooling and earnings?" The Quarterly Journal of Economics 106.4 (1991): 979-1014.
#' 
file <- "https://raw.githubusercontent.com/UChicago-pol-methods/SOSC13200-W23/main/data/angrist-krueger.csv"
dat <- read.csv(file, as.is = TRUE)

#' # 1. 
#' Consider Angrist and Kruger (1991) Table III Panel B on p. 996. 
#' We have the data for the 1980 census, for men born 1930-1939--we don't have 
#' the 1920-1929 data, so you can ignore Panel A. 
#' 
#' ## (1a) 
#' Calculate the mean log weekly wage for men born in the first quarter of the 
#' year, and men born in any other quarter of the year. Calculate the 
#' difference, and save the difference as an R object. 

# Your code here

#' ## (1b) 
#' Calculate the mean years education for men born in the first quarter of the 
#' year, and men born in any other quarter of the year. Calculate the 
#' difference, and save the difference as an R object. 

# Your code here

#' ## (1c) 
#' Calculate the Wald estimate of the returns to education as the ratio of the 
#' difference in mean log earnings by quarter of birth to the difference in 
#' years of mean education by quarter of birth. Compare your results to Table 
#' III Panel B. Are they the same? 

# Your code here

#' Interpret the estimate in words. 

# [Your explanation here]

#' 
#' # 2.
#' ## (2a)
#' In the Angrist and Krueger data, create a new variable, `year_of_birth_adj`, 
#' which adds a quarter on to year of birth for each quarter in quarter of 
#' birth *after the first quarter*. For example, if a person was born in 1930 Q2, 
#' their `year_of_birth_adj` value would be 1930 + 0.25 * (2-1) = 1930.25. 

# Your code here

#' Then create a new variable, `states_above_16`, which is a 1 when the 
#' the age for compulsory schooling is above 16, and 0 otherwise. Check 
#' Appendix 2 for the list of ages for compulsory school attendance *in 1980*. 
#' Compare this to the values of the place of birth variable in the data set. 

# Your code here

#' ## (2b)
#' Using the `aggregate()` function, group the data set by adjusted year of 
#' birth, quarter of birth, AND whether the state has a compulsory schooling age 
#' above 16, and calculate mean log weekly wage and mean education within 
#' each of the subgroups. Save this as a new data.frame object in R.  
#' 
#' *(Note: you could aggregate just by adjusted year of birth, as this uniquely
#' describes quarters, but I would like you to also have quarter of birth as a 
#' variable in your new dataset.)*


# Your code here

#' ## (2c)
#' Create a plot of your aggregated data, using both points and lines, with 
#' adjusted year of birth on the x-axis, and education on the y-axis. Separately
#' plot data for states with compulsory school ages above 16 and for 16 and 
#' below by setting the color in the plot aesthetic. 

# Your code here

#' ## (2d)
#' Create a plot of your aggregated data, with education on the x-axis, and 
#' log weekly wages on the y-axis; add a layer for points, and then show a 
#' smoothed line demonstrating the trend across points with 
#' `geom_smooth(method = 'lm')`. Separately plot data for states with compulsory 
#' school ages above 16 and for 16 and below by setting the color in the plot 
#' aesthetic. 

# Your code here

#' Do you see differences in trends across states with age of compulsory 
#' schooling above 16 and 16 and below?

# [Your explanation here]

#' # 3. 
#' ## (3a)
#' Redo your calculations from question 1, but separately for states with 
#' compulsory school ages above 16 and for 16 and below. 
#' 

# Your code here


#' ## (3b)
#' Do you get different estimates for the two conditions? If so, propose an 
#' explanation for why returns to education might be different in these two 
#' cases. If you think the results are not meaningfully different, make a case 
#' for why we should not see a difference. 

# [Your explanation here]