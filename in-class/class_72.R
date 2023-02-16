#' ---
#' title: "In-class 7.2, Social Science Inquiry II (SOSC13200-W23-2)"
#' author: "Molly Offer-Westort"
#' date: "Thursday 2/16/23"
#' ---

library(ggplot2)
library(estimatr)
library(modelsummary)

#' 
#' ## Reading in the data 
file <- "https://raw.githubusercontent.com/UChicago-pol-methods/SOSC13200-W23/main/data/card-krueger.csv"
dat <- read.csv(file, as.is = TRUE)

#+ eval = FALSE
str(dat) # don't evaluate this when compiling
#'


# Creating `State` factor
# note use of levels to set order

dat$State <- factor(dat$nj,
                    levels = c(1, 0), 
                    labels = c('NJ', 'PA'))

dat$Wave <- factor(dat$d, 
                   levels = c(0, 1),
                   labels = c('February 1992', 'November 1992'))

# check distribution of state
table(dat$State)/2

# wave 1 data
dat0 <- dat[which(dat$d==0),]

# wave 2 data
dat1 <- dat[which(dat$d==1),]

#' 
#' ## Recreating Figure 1
#' 
# For ..special variables.. see ggplot_build(...)$data[[1]]

g1 <- ggplot(dat0, aes(x = wage, fill = State)) +
  geom_histogram(aes(y=c(..count..[..group..==1]/sum(..count..[..group..==1]),
                         ..count..[..group..==2]/sum(..count..[..group..==2]))),
                 position='dodge', bins = 15, na.rm = TRUE) + 
  scale_y_continuous(labels = scales::label_percent(accuracy = 1), 
                     breaks = seq(0, 1, 0.05)) + 
  scale_x_continuous(breaks = seq(4.25, 5.55, 0.1)) + # x axis ticks
  coord_cartesian(xlim = c(4.25,5.55)) + # x limits
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 0.95)) + # x axis at 45 degree angle
  scale_fill_brewer(palette="Set2") + 
  xlab('Wage Range') +
  ylab('Percent of Stores') + 
  ggtitle('Wage by state, percentages')

g1


g2 <- ggplot(dat1, aes(x = wage, fill = State)) +
  geom_histogram(aes(y=c(..count..[..group..==1]/sum(..count..[..group..==1]),
                         ..count..[..group..==2]/sum(..count..[..group..==2]))),
                 position='dodge', bins = 15, na.rm = TRUE) + 
  scale_y_continuous(labels = scales::label_percent(accuracy = 1), 
                     breaks = seq(0, 1, 0.05)) + 
  scale_x_continuous(breaks = seq(4.25, 5.55, 0.1)) + # x axis ticks
  coord_cartesian(xlim = c(4.25,5.55)) + # x limits
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 0.95)) + # x axis at 45 degree angle
  scale_fill_brewer(palette="Set2") + 
  xlab('Wage Range') +
  ylab('Percent of Stores') + 
  ggtitle('Wage by state, percentages')

g2

g3 <- ggplot(dat, aes(x = wage, fill = State)) +
  facet_wrap(~Wave, nrow = 2) + 
  geom_histogram(aes(y=c(..count..[..group..==1 & ..PANEL.. ==1]/sum(..count..[..group..==1& ..PANEL.. ==1]),
                         ..count..[..group..==2& ..PANEL.. ==1]/sum(..count..[..group..==2& PANEL ==1]),
                         ..count..[..group..==1 & ..PANEL.. ==2]/sum(..count..[..group..==1& ..PANEL.. ==2]),
                         ..count..[..group..==2& ..PANEL.. ==2]/sum(..count..[..group..==2& PANEL ==2]))),
                 position='dodge', bins = 15, na.rm = TRUE) + 
  scale_y_continuous(labels = scales::label_percent(accuracy = 1), 
                     breaks = seq(0, 1, 0.05)) + 
  scale_x_continuous(breaks = seq(4.25, 5.55, 0.1)) + # x axis ticks
  coord_cartesian(xlim = c(4.2,5.6)) + # x limits
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 0.95)) + # x axis at 45 degree angle
  scale_fill_brewer(palette="Set2") + 
  xlab('Wage Range') +
  ylab('Percent of Stores') + 
  ggtitle('Wage by state, percentages')

g3

# Notice bin width compared to plot

#' 
#' ## Table 3

lm0 <- lm_robust(fte ~ d*nj, data = dat)

## Row 1
# PA before
coef(lm0)['(Intercept)']
# NJ before
coef(lm0)['(Intercept)'] + coef(lm0)['nj']
# Difference before
coef(lm0)['nj']

## Row 2
# PA after
coef(lm0)['(Intercept)'] + coef(lm0)['d']
# NJ after
coef(lm0)['(Intercept)'] + coef(lm0)['nj'] + coef(lm0)['d'] + coef(lm0)['d:nj']
# Difference after
coef(lm0)['nj'] + coef(lm0)['d:nj']

## Row 3
# PA change
coef(lm0)['d']
# NJ change
coef(lm0)['d'] + coef(lm0)['d:nj']
# Difference in change
coef(lm0)['d:nj']

## Row 4
idx <- intersect(
dat$id[which(dat$d == 0 & !is.na(dat$fte))],
dat$id[which(dat$d == 1 & !is.na(dat$fte))])

lm0b <- lm_robust(fte ~ d *nj, data = dat[which(dat$id %in% idx),])
# PA change
coef(lm0b)['d']
# NJ change
coef(lm0b)['d'] + coef(lm0)['d:nj']
# Difference in change
coef(lm0b)['d:nj']


# Row 5...?
# And Stores in NJ, Differences w/in NJ...?

#' Table 4
#' 
# Reshaping data for analysis
dat_wide <- reshape(dat, direction = 'wide', idvar = 'id', 
                    v.names = c('fte', 'ft', 'pt', 'mgrs', 'wage', 'meal', 'hrsopen', 'bonus',
                                'ncalls','inctime','firstinc','nregs'),
                    drop = c('d_nj', 'Wave'),
                    timevar = 'd')
dat_wide$Y <- dat_wide$fte.1-dat_wide$fte.0

# discuss coding of gap
dat_wide$gap <- ifelse(dat_wide$nj==1 & dat_wide$wage.0<= 5.05,((5.05-dat_wide$wage.0)/dat_wide$wage.0),0)

# conditioning variables, based on table footnote
dat_wide <- dat_wide[which( !is.na(dat_wide$Y) &
                              !is.na(dat_wide$wage.0) &
                              !is.na(dat_wide$wage.1)),]

(lm1 <- lm_robust(Y ~ nj, data = dat_wide))
(lm2 <- lm_robust(Y ~ nj + bk + kfc + roys + wendys + co_owned, data = dat_wide))
# why do we drop one variable?
(lm3 <- lm_robust(Y ~ gap, data = dat_wide))
(lm4 <- lm_robust(Y ~ gap + bk + kfc + roys + wendys + co_owned, data = dat_wide))
(lm5 <- lm_robust(Y ~ gap + bk + kfc + roys + wendys + co_owned + centralj + southj + pa1 + pa2, data = dat_wide))


# Why are estimates are slightly off? The conditioning variables don't align exactly with how they're described in table 4 note. 
# Should be 357 stores, but if we exclude all with missing outcome, missing starting wages in both waves, we get 351
nrow(dat_wide)
mean(dat_wide$Y)
# Should be - 0.237
sd(dat_wide$Y, na.rm = TRUE)
# Should be 8.825



