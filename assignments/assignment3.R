#' ---
#' title: "Assignment 3, Social Science Inquiry II (SOSC13200-W23-2)"
#' author: "<your name here>"
#' date: "Monday 1/20/22 at 5pm"
#' ---

#' # 1.  
#' **Consider the random process of flipping a fair coin three times.**
#' 
#' ## (1a) 
#' Write an R object, `Omega`, that is a vector whose elements describe the 
#' sample space in terms of heads and tails. E.g., three heads in a row could be 
#' described as 'HHH'. 

# Your code here.

#' ## (1b) 
#' The random variable $X$ that we're interested in is the number of heads that 
#' we get from our random process. Write a data.frame object with two columns. 
#' One column, `X`, describes all of the possible number of heads we could get. 
#' The second column, `probs`, describes the probability each of these events 
#' occurs. 
#' 
#' Print your data.frame so that it shows in your report. 
#' 
#' *Hint: the coin is fair, so each of the outcomes in the sample space above 
#' occurs with equal probability. Note how many heads we get in each outcome. 
#' Then look at the proportion of times we get no heads, one head, etc. These 
#' proportions are equal to the probability.*

# Your code here.

#' ## (1c) Calculate the mean of X.

# Your code here.

#' ## (1d) 
#' Write out code to simulate this random process, where the output is a single 
#' realization of the random variable (i.e., a number that represents the number 
#' of heads in your coin flips). 
#' 
#' *Note: I set a random seed here, so that every time you recompile your 
#' assignment, you'll get the same number. For analyses that involve sampling or 
#' random processes, it is really important to set a random seed so that you can 
#' get reproducible results. Feel free to change the seed number to anything you 
#' want. In general you should only set your random seed ONCE per script.*
set.seed(60637)

# Your code here.

#' ## (1e)  
#' Now run your random process so you sample from it 10,000 times [PLEASE DON'T 
#' OUTPUT ALL 10,000 OBSERVATIONS IN YOUR HOMEWORK, just save it to an R object]. 
#' What is the average number of heads across these 10k observations? This is 
#' the sample mean for a given sample.

# Your code here.

#' ## (1f) 
#' Write your own function called `mymean()` to calculate the sample mean from a 
#' vector. Apply your function to your size 10k sample that you saved in the 
#' last problem. 
#' 
#' (Don't use `mean()` inside your function, and don't call the specific object 
#' you created in the last question inside your function. Your `mymean()` 
#' function should work when applied to any vector. )


# Your code here.

#' ## (1g)
#' Re-run the code from 1f to get another length 10k sample from the same random
#' process. [DON'T PRINT THIS WHOLE OBJECT.] Apply your `my_mean()` function to 
#' it.  

# Your code here.

#' # 2. 
#' **Using the same random process of flipping three fair coins, code the random 
#' variable $Y$ as 1 if we get three heads, and 0 otherwise.**
#'  
#' ## (2a) 
#' Write a data.frame object with two columns. One column, `Y`, describes all of 
#' the possible values of Y we could get. The second column, `probs`, describes
#' the probability each of these events occurs. 
#' 
#' Print your data.frame so that it shows in your report. 

# Your code here.

#' ## (2b) 
#' Write a new data.frame object that has three columns. Two columns, `X` and 
#' `Y`, jointly describe the values that `X` and `Y` can take on together. The 
#' third column, `probs`, describes the probability each of these pairs of 
#' events occurs jointly. 
#' 
#' Print your data.frame so that it shows in your report. 

# Your code here.

#' ## (2c)
#' Report the conditional mean of X given that Y equals 0. 
#' 
#' *Recall that conditional probability can be written as:* 
#' \[
#' \textrm{P}[A|B] = \frac{\textrm{P}[AB]}{\textrm{P}[B]}
#' \]

# Your code here.

#' ## (2d)
#' Are the events that $X = 3$ and that $Y = 1$ are independent?

# Your code here.
