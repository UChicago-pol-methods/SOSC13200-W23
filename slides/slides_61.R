## ----packages-----------------------------------------------------------------
library(ggplot2)


## -----------------------------------------------------------------------------
file <- "https://raw.githubusercontent.com/UChicago-pol-methods/SOSC13200-W23/main/data/angrist-krueger.csv"
dat <- read.csv(file, as.is = TRUE)

dat$year_of_birth_adj <- dat$year_of_birth + 
  0.25 * (dat$quarter_of_birth-1)

states_above_16 <- c(15, 23, 32, 35, 39, 40, 41, 42, 48, 49, 51, 53)
dat$states_above_16 <- 1 * (dat$place_of_birth %in% states_above_16)

dat_agg <- aggregate(x = dat[, c('log_weekly_wage', 'education')], 
                     by = list(`year_of_birth_adj` = dat$year_of_birth_adj,
                               `quarter_of_birth` = dat$quarter_of_birth,
                               `above` = as.factor(dat$states_above_16)),
                     FUN = mean)


## -----------------------------------------------------------------------------
head(dat_agg)


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(dat_agg, aes(x = education,
                    y = log_weekly_wage,
                    color = above)) +
  geom_point() + # points with color
  # geom_smooth(method = 'lm') + # lines
  theme_bw() + # plot style
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Years of Completed Education') + # x-axis label
  ggtitle('Angrist and Krueger, Earnings on Education\nby Age of Compulsory Schooling') + 
  coord_cartesian(xlim = c(12.2, 13.4), ylim = c(5.88, 5.94))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(dat_agg[which(dat_agg$above == 0),], aes(x = education,
                    y = log_weekly_wage,
                    color = above)) +
  geom_point() + # points with color
  # geom_smooth(method = 'lm', se = FALSE) + # lines
  theme_bw() + # plot style
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Years of Completed Education') + # x-axis label
  ggtitle('Angrist and Krueger, Earnings on Education\nby Age of Compulsory Schooling') + 
  coord_cartesian(xlim = c(12.2, 13.4), ylim = c(5.88, 5.94))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(dat_agg[which(dat_agg$above == 0),], aes(x = education,
                    y = log_weekly_wage,
                    color = above)) +
  geom_point() + # points with color
  geom_smooth(method = 'lm', se = FALSE) + # lines
  theme_bw() + # plot style
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Years of Completed Education') + # x-axis label
  ggtitle('Angrist and Krueger, Earnings on Education\nby Age of Compulsory Schooling') + 
  coord_cartesian(xlim = c(12.2, 13.4), ylim = c(5.88, 5.94))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(dat_agg[which(dat_agg$above == 1),], aes(x = education,
                    y = log_weekly_wage,
                    color = above)) +
  geom_point() + # points with color
  # geom_smooth(method = 'lm', se = FALSE) + # lines
  scale_color_manual(values = '#00BFC4') +
  theme_bw() + # plot style
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Years of Completed Education') + # x-axis label
  ggtitle('Angrist and Krueger, Earnings on Education\nby Age of Compulsory Schooling') + 
  coord_cartesian(xlim = c(12.2, 13.4), ylim = c(5.88, 5.94))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(dat_agg[which(dat_agg$above == 1),], aes(x = education,
                    y = log_weekly_wage,
                    color = above)) +
  geom_point() + # points with color
  geom_smooth(method = 'lm', se = FALSE) + # lines
  scale_color_manual(values = '#00BFC4') +
  theme_bw() + # plot style
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Years of Completed Education') + # x-axis label
  ggtitle('Angrist and Krueger, Earnings on Education\nby Age of Compulsory Schooling') + 
  coord_cartesian(xlim = c(12.2, 13.4), ylim = c(5.88, 5.94))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(dat_agg, aes(x = education,
                    y = log_weekly_wage,
                    color = above)) +
  geom_point() + # points with color
  geom_smooth(method = 'lm', se = FALSE) + # lines
  theme_bw() + # plot style
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Years of Completed Education') + # x-axis label
  ggtitle('Angrist and Krueger, Earnings on Education\nby Age of Compulsory Schooling') + 
  coord_cartesian(xlim = c(12.2, 13.4), ylim = c(5.88, 5.94))


## -----------------------------------------------------------------------------
toy_dat <- data.frame(Y = c(2, 3, 4), 
                      X = c(5, 10, 10))
toy_dat


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(toy_dat, aes(x = X,
                    y = Y)) +
  geom_point() + # points with color
  theme_bw() # plot style


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(toy_dat, aes(x = X,
                    y = Y)) +
  geom_point() + # points with color
  theme_bw() + # plot style
  geom_smooth(method = 'lm', se = FALSE) # lines


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
toy_dat$fitted <- fitted(lm(Y~X, data = toy_dat))

ggplot(toy_dat, aes(x = X,
                    y = Y)) +
  geom_point() + # points with color
  theme_bw() + # plot style
  geom_smooth(method = 'lm', se = FALSE) + # lines
  geom_segment(aes(x = X, y = Y,
                   xend = X, yend = fitted), 
               color = 'grey')


## ----load---------------------------------------------------------------------
lm(Y~X, data = toy_dat)


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(toy_dat, aes(x = X,
                    y = Y)) +
  geom_point() + # points with color
  theme_bw() + # plot style
  xlim(0, NA) +
  ylim(0, NA) +
  stat_smooth(method="lm", fullrange=TRUE, se = FALSE) # lines


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
lm0 <- lm(log_weekly_wage ~ education, data = dat_agg[which(dat_agg$above == 0),])
lm1 <- lm(log_weekly_wage ~ education, data = dat_agg[which(dat_agg$above == 1),])
dat_agg$fitted <- NA
dat_agg$fitted[which(dat_agg$above == 0)] <- fitted(lm0)
dat_agg$fitted[which(dat_agg$above == 1)] <- fitted(lm1)

ggplot(dat_agg, aes(x = education,
                    y = log_weekly_wage,
                    color = above)) +
  geom_point() + # points with color
  geom_smooth(method = 'lm', se = FALSE) + # lines
  theme_bw() + # plot style
  ylab('Log Weekly Earnings') +  # y-axis label
  xlab('Years of Completed Education') + # x-axis label
  ggtitle('Angrist and Krueger, Earnings on Education\nby Age of Compulsory Schooling') + 
  geom_segment(aes(x = education, y = log_weekly_wage,
                   xend = education, yend = fitted, color = above),
               alpha = 0.25) + 
  coord_cartesian(xlim = c(12.2, 13.4), ylim = c(5.88, 5.94))


## ----load2--------------------------------------------------------------------
df <- read.csv('../data/butler-broockman.csv', as.is = TRUE)
head(df)


## -----------------------------------------------------------------------------
table(df$treat_deshawn)


## -----------------------------------------------------------------------------
table(df$reply_atall)


## -----------------------------------------------------------------------------
df$W <- df$treat_deshawn
df$Y <- df$reply_atall


## -----------------------------------------------------------------------------
Y1 <- df$Y[which(df$W == 1)]
Y0 <- df$Y[which(df$W == 0)]


## -----------------------------------------------------------------------------
(dm_hat <- mean(Y1) - mean(Y0))


## -----------------------------------------------------------------------------
lm(Y~W, data = df)


## -----------------------------------------------------------------------------
lm(reply_atall ~ leg_party, data = df)


## -----------------------------------------------------------------------------
lm(reply_atall ~ leg_party - 1, data = df)


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(df, aes(x = leg_republican,
                    y = Y)) +
  geom_point() + # points with color
  theme_bw() + # plot style
  xlim(0, NA) +
  ylim(0, NA) +
  stat_smooth(method="lm", fullrange=TRUE, se = FALSE) # lines


## -----------------------------------------------------------------------------
table(df$Y[which(df$leg_republican == 0)])

mean(df$Y[which(df$leg_republican == 0)])


## -----------------------------------------------------------------------------
table(df$Y[which(df$leg_republican == 1)])

mean(df$Y[which(df$leg_republican == 1)])



## -----------------------------------------------------------------------------
lm1 <- lm(Y ~ W, data = df)
names(lm1)
summary(lm1)


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
hist(rnorm(10))


## ----echo = FALSE-------------------------------------------------------------
f <- 'slides_61.Rnw'
knitr::purl(f)
knitr::Sweave2knitr(f)

