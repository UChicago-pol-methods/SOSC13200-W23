## ----packages--------------------------------------------------------------------------------------------
library(ggplot2)


## ----load------------------------------------------------------------------------------------------------
dat <- read.csv('../data/angrist-krueger.csv', as.is = TRUE)
head(dat)


## ----summary---------------------------------------------------------------------------------------------
str(dat)
summary(dat)


## ----eval = FALSE----------------------------------------------------------------------------------------
## ggplot(dat, aes(x = year_of_birth, y = education)) +
##   geom_point()


## --------------------------------------------------------------------------------------------------------
dat_agg <- aggregate(x = dat[, c('log_weekly_wage', 'education')], 
                    by = list(`year_of_birth` = dat$year_of_birth, 
                              `quarter_of_birth` = dat$quarter_of_birth),
                    FUN = mean)

dat_agg$year_of_birth_adj <- dat_agg$year_of_birth + 
  0.25 * (dat_agg$quarter_of_birth-1)

head(dat_agg)


## ----eval = FALSE----------------------------------------------------------------------------------------
## ggplot(dat_agg, aes(x = year_of_birth_adj, y = education)) +
##   geom_point() + # points
##   geom_line() # lines


## ----fig = TRUE, width = 5, height=5, echo = FALSE-------------------------------------------------------
ggplot(dat_agg, aes(x = year_of_birth_adj, y = education)) +
  geom_point() + # points
  geom_line() # lines


## ----echo = TRUE, eval = FALSE---------------------------------------------------------------------------
## ggplot(dat_agg, aes(x = year_of_birth_adj,
##                    y = education,
##                    label = quarter_of_birth)) +
##   geom_point(pch = 15,
##              aes(color = as.factor(quarter_of_birth) )) + # points with color
##   geom_line() + # lines
##   geom_text(hjust = 0, nudge_x = 0.05) + # text labels on points
##   theme_bw() + # plot style
##   theme(legend.position = '') + # remove legend from colored text labels
##   ylab('Years of Completed Education') +  # y-axis label
##   xlab('Year of Birth') + # x-axis label
##   ggtitle('Angrist and Krueger, Figure I') + # title
##   scale_x_continuous(breaks = seq(30, 40, 2)) + # x-axis ticks
##   scale_y_continuous(breaks = seq(12.2, 13.2, .2)) # y-axis ticks
## 


## ----fig = TRUE, width = 5, height=5, echo = FALSE-------------------------------------------------------
ggplot(dat_agg, aes(x = year_of_birth_adj, y = education, label = quarter_of_birth)) +
  geom_point(pch = 15, aes(color = as.factor(quarter_of_birth) )) + # points with color
  geom_line() + # lines
  geom_text(hjust = 0, nudge_x = 0.05) + # text labels on points
  theme_bw() + # plot style
  theme(legend.position = '') + # remove legend from colored text labels
  ylab('Years of Completed Education') +  # y-axis label
  xlab('Year of Birth') + # x-axis label
  ggtitle('Angrist and Krueger, Figure I') + # title
  scale_x_continuous(breaks = seq(30, 40, 2)) + # x-axis ticks
  scale_y_continuous(breaks = seq(12.2, 13.2, .2)) # y-axis ticks


## ----echo = TRUE-----------------------------------------------------------------------------------------
# function for moving average
ma <- function(x, n = 5){ 
  ma_x <- as.numeric(filter(x, rep(1 / n, n), sides = 2))
  ma_x2 <- (ma_x - x/5)*5/4
  return(ma_x2)
}

# get dat_agg in right order
dat_agg <- dat_agg[order(dat_agg$year_of_birth_adj),]

# calculate moving average
dat_agg$moving_average <- ma(dat_agg$education)

# update adjusted birth year in main dataset
dat$year_of_birth_adj <- dat$year_of_birth + 0.25 * (dat$quarter_of_birth-1)

# and match aggregated moving average to main data
dat$moving_average <- dat_agg$moving_average[match(dat$year_of_birth_adj, 
                                                 dat_agg$year_of_birth_adj)]

# calculate deviation from moving average
dat$deviation <- dat$education-dat$moving_average

# get aggregate deviation
dat_agg$deviation <- aggregate(x = dat$deviation, 
                              by = list(dat$year_of_birth_adj), mean)$x



## ----eval = FALSE----------------------------------------------------------------------------------------
## ggplot(dat_agg, aes(x = year_of_birth_adj,
##                    y = deviation,
##                    fill = as.factor(quarter_of_birth),
##                    label = quarter_of_birth)) +
##   geom_col(na.rm = TRUE) +
##   geom_text(hjust = 0, nudge_y = 0.003, nudge_x = -0.1, na.rm = TRUE) + # text labels on points
##   coord_cartesian(ylim = c(-0.2, 0.2)) +
##   theme_bw() + # plot style
##   theme(legend.position = '') + # remove legend from colored text labels
##   ylab('Schooling Differential') +  # y-axis label
##   xlab('Year of Birth') + # x-axis label
##   ggtitle('Angrist and Krueger, Figure IV, Panel I') + # title
##   scale_x_continuous(breaks = seq(30, 40, 2)) # x-axis ticks
## 


## ----fig = TRUE, width = 6, height=6, echo = FALSE-------------------------------------------------------
ggplot(dat_agg, aes(x = year_of_birth_adj, 
                   y = deviation, 
                   fill = as.factor(quarter_of_birth),
                   label = quarter_of_birth)) +
  geom_col(na.rm = TRUE) +
  geom_text(hjust = 0, nudge_y = 0.003, nudge_x = -0.1, na.rm = TRUE) + # text labels on points
  coord_cartesian(ylim = c(-0.2, 0.2)) +
  theme_bw() + # plot style
  theme(legend.position = '') + # remove legend from colored text labels
  ylab('Schooling Differential') +  # y-axis label
  xlab('Year of Birth') + # x-axis label
  ggtitle('Angrist and Krueger, Figure IV, Panel I') + # title
  scale_x_continuous(breaks = seq(30, 40, 2)) # x-axis ticks



## ----eval = FALSE----------------------------------------------------------------------------------------
## ggplot(dat_agg, aes(x = year_of_birth_adj, y = log_weekly_wage,
##                    label = quarter_of_birth)) +
##   geom_point(pch = 15,
##              aes(color = as.factor(quarter_of_birth) )) + # points with color
##   geom_line() + # lines
##   geom_text(hjust = 0, nudge_x = 0.05) + # text labels on points
##   theme_bw() + # plot style
##   theme(legend.position = '') + # remove legend from colored text labels
##   scale_x_continuous(breaks = seq(30, 40, 2)) + # x-axis ticks
##   scale_y_continuous(breaks = seq(5.6, 6.1, .1)) + # y-axis ticks
##   coord_cartesian(ylim = c(5.6, NA)) +
##   ylab('Log Weekly Earnings') +  # y-axis label
##   xlab('Year of Birth') + # x-axis label
##   ggtitle('Angrist and Krueger, Figure V',
##           subtitle = 'Mean Log Weekly Wage, by Quarter of Birth\nAll Men Born 1930-1949; 1980 Census')


## ----fig = TRUE, width = 6, height=6, echo = FALSE-------------------------------------------------------
ggplot(dat_agg, aes(x = year_of_birth_adj, y = log_weekly_wage, 
                   label = quarter_of_birth)) +
  geom_point(pch = 15, 
             aes(color = as.factor(quarter_of_birth) )) + # points with color
  geom_line() + # lines
  geom_text(hjust = 0, nudge_x = 0.05) + # text labels on points
  theme_bw() + # plot style
  theme(legend.position = '') + # remove legend from colored text labels
  scale_x_continuous(breaks = seq(30, 40, 2)) + # x-axis ticks
  scale_y_continuous(breaks = seq(5.6, 6.1, .1)) + # y-axis ticks
  coord_cartesian(ylim = c(5.6, NA)) + 
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Year of Birth') + # x-axis label
  ggtitle('Angrist and Krueger, Figure V', 
          subtitle = 'Mean Log Weekly Wage, by Quarter of Birth\nAll Men Born 1930-1949; 1980 Census')

