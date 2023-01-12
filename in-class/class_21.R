#' ---
#' title: "In-class 2.1, Social Science Inquiry II (SOSC13200-W23-2)"
#' author: "Molly Offer-Westort"
#' date: "Tuesday 1/11/22"
#' ---

#' ## Reading in the data 
#' You can read in data locally
dat <- read.csv("../data/card-krueger.csv", as.is = TRUE)

#' OR you can give the file address as a location on the internet. 
#' Here it's listed from the location on the class GitHub repository. 
file <- "https://raw.githubusercontent.com/UChicago-pol-methods/SOSC13200-W23/main/data/card-krueger.csv"
dat1 <- read.csv(file, as.is = TRUE)

identical(dat, dat1) # are the files identical?

rm(dat1) # remove the extra data set, we only want one. 


#' ## Summarizing the data set 

head(dat) # check out the data. 

dim(dat)
names(dat)
str(dat)
summary(dat)

#' What is the unit of observation?
#' 


#' ## Indexing, vector as element of data.frame.

#' Extract a named vector from a data.frame.
dat$id
str(dat$id)
length(dat$id)

#' Extract a column from a data frame by index number.
dat[,1]

str(dat[,1])

#' Extract a *row* from a data frame by index number; is this a vector?
dat[1,]

str(dat[1,])

#' What happened?

#' Index elements within a vector by index number.
dat$id[410]

dat$id[11:20]

#' Modify elements within a vector by index number.
id2 <- dat$id # recall the assignment operator, <-
identical(dat$id, id2)

id2[2] <- 99999 

head(id2)
head(dat$id)

identical(dat$id, id2)

# Getting index using `which()` and logicals
which(id2==99999)

id2[which(id2==99999)]


which(id2>400)
id2[which(id2>400)]


which(id2>400 & id2 < 410)
id2[which(id2>400 & id2 < 410)]
id2[id2>400 & id2 < 410]

# through here class 1

#' Using table(), sum(), mean(), and other summary functions

table(dat$d)
sum(dat$d)
mean(dat$d) # mean of binary as percentage

table(dat$bk)
sum(dat$bk)
mean(dat$bk)


head(dat$mgrs)
table(dat$mgrs)
mean(dat$mgrs)

mean(dat$mgrs, na.rm = TRUE)
class(dat$mgrs)

mean(c(1,1,3,4,59))

mean(c(1,1,3,4,'59'))
class(c(1,1,3,4,'59'))


round(mean(dat$mgrs, na.rm = TRUE), 2)
?round


median(dat$mgrs, na.rm = TRUE)

max(dat$mgrs, na.rm = TRUE)

min(dat$mgrs, na.rm = TRUE)

quantile(dat$mgrs, na.rm = TRUE)
summary(dat$mgrs)
quantile(dat$mgrs, c(0.025, 0.995), na.rm = TRUE)


plot(ecdf(dat$mgrs))
#' Checking mean against a hand-calculated value
mean(dat$mgrs, na.rm = TRUE) == sum(dat$mgrs, na.rm = TRUE)/length(dat$mgrs)

sum(dat$mgrs, na.rm = TRUE)/length(dat$mgrs)

?is.na
is.na(dat$mgrs)
table(is.na(dat$mgrs))

#' Variance and standard deviation
var(dat$d)
sum( (dat$d - mean(dat$d))^2 /(length(dat$d)-1))

sd(dat$d)
sqrt(var(dat$d))

#' Calculating full time equivalent employment

dat$fte2 <- dat$ft + dat$mgrs + dat$pt/2
summary(dat$fte2)
summary(dat$fte)

identical(dat$fte, dat$fte2)

names(dat)


#' What if we want to get the number of managers and assistant managers, just in
#' PA? 

#' Just in NJ?
#' 
#' Just in NJ in Wave 1?


#' Recreating table 1





nrow(dat[which(dat$d == 1),])

table(dat$nj[which(dat$d == 1)])

table(dat$status[which(dat$d == 1)]) # see readme
mean(dat$status[which(dat$d == 1)]) # why might we not want to take the mean?

table(dat$status[which(dat$d == 1)], dat$nj[which(dat$d == 1)])

table(dat$type[which(dat$d ==1)])



#' ## Exercises
#' 


#' What percent of stores were successfully interviewed by phone in round 2?
#' Multiply this number by 100, and round to two decimal places. 
#' (I.e., result should be in the format ##.## ).
#' 
#' What was the average wage at Wendy's in New Jersey in Wave 1? In Wave 2?
#' What is the difference between the two?
#' 
#' How many hours are KFC's open in PA, on average? Does this differ from 
#' Burger Kings?
#' 
#' Which variable has the most missing data? For this variable, how many 
#' observations are missing for NJ, vs PA? 

