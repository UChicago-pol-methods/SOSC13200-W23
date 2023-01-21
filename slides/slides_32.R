## -----------------------------------------------------------------------------
library(ggplot2)
library(gridExtra)
set.seed(60637)


## -----------------------------------------------------------------------------
X <- c(0, 1, 2)
probs <- c(0.25, 0.5, 0.25)

sample(x = X,
       size = 1,
       prob = probs)



## -----------------------------------------------------------------------------
n <- 1000
result_n <- sample(x = X,
                   size = n,
                   prob = probs,
                   replace = TRUE)

table(result_n)


## -----------------------------------------------------------------------------

prop.table(table(result_n))



## ----fig = TRUE, width = 5, height = 3.5--------------------------------------
ggplot(data.frame(result_n), aes(x = result_n)) +
  geom_histogram(bins = 3, color = 'white', fill = 'lightgreen') +
  theme_bw() + xlab('Number heads')



## ----fig = TRUE, width = 5, height=3.8, echo=FALSE----------------------------
plotdata <- data.frame(
  x = c(-1, 0, 1, 2),
  xend = c(0, 1, 2, 3),
  fx = c(0, 1/4, 1/2, 1/4),
  Fx = c(0, 1/4, 3/4, 1) # cumsum(fx)
)

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.5, 2.5),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0,0,0), xend = x, yend = fx)) +
  ggtitle('PMF of X as number of heads in 2 fair coin flips') +
  theme_bw()


## ----fig = TRUE, width = 5, height=3.8, echo=FALSE----------------------------
ggplot(plotdata, aes(x = x, y = Fx)) +
  geom_segment(aes(x = x, y = Fx, xend = xend, yend = Fx)) +
  geom_point() +
  geom_point(aes(x = xend, y = Fx), shape= 21, fill = 'white') +
  coord_cartesian(xlim = c(-0.5, 2.5),
                  ylim = c(0,1)) +
  ggtitle('CDF of X as number of heads in 2 fair coin flips') + theme_bw()


## ----fig = TRUE, width = 5, height=3.5----------------------------------------

ggplot(data.frame(result_n), aes(x = result_n)) +
  stat_ecdf() +
  coord_cartesian(xlim = c(-0.5, 2.5)) +
  ylab('Empirical Fx') +
  ggtitle('ECDF of X as number of heads in 2 fair coin flips') + theme_bw()



## -----------------------------------------------------------------------------
Omega <- c('HH', 'HT', 'TH', 'TT')
probs <- c(0.25, 0.25, 0.25, 0.25)

result_n <- sample(x = Omega,
                   size = n,
                   prob = probs,
                   replace = TRUE)

result_mat <- data.frame(omega = result_n,
                         x = ifelse(result_n == 'TT', 0, 1),
                         y = ifelse(result_n == 'HH', 1, 0))

options <- list(theme(panel.grid.minor = element_blank()), 
                scale_x_continuous(breaks = c(0, 1))) + # save some style options
  theme_bw()

p1 <- ggplot(result_mat) + 
  geom_histogram(aes(x = x), bins = 3, position = 'identity', color = 'white') + 
  options

p2 <- ggplot(result_mat) + 
  geom_histogram(aes(x = y), bins = 3, position = 'identity', color = 'white') + 
  options



## ----fig = TRUE, width = 6, height=3.5----------------------------------------
grid.arrange(p1, p2, ncol = 2)


## ----fig = TRUE, width = 6, height=6, echo=FALSE------------------------------
hist_top <- p1
empty <- ggplot() + geom_point(aes(1,1), colour="white") +
  theme(axis.ticks=element_blank(),
        panel.background=element_blank(),
        axis.text.x=element_blank(), axis.text.y=element_blank(),
        axis.title.x=element_blank(), axis.title.y=element_blank())

count_mat <- aggregate(
  list(count = result_mat$omega), 
  list(x = result_mat$x, y = result_mat$y), length)

scatter <- ggplot(result_mat, aes(x = x, y = y, color = omega)) +
  geom_jitter(width = 0.25, height = 0.25, alpha = 0.5) +
  scale_x_continuous(breaks = c(0, 1)) +
  scale_y_continuous(breaks = c(0,1)) +
  theme(panel.grid.minor = element_blank(), legend.position = 'none')

hist_right <- p2 + coord_flip()

grid.arrange(hist_top, empty, scatter, hist_right, ncol=2, nrow=2, widths=c(4, 2), heights=c(2, 4))



## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
plotdata <- data.frame(
  x = c(0, 1),
  fx = c(1/2, 1/2)
)

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = 0.5, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=0.5, y=0.75, label="E[X]") +
  ggtitle('PMF of X as number of heads in 1 fair coin flip')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = 0.5, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=0.5, y=0.75, label="E[X]", col = 'grey') +
  geom_segment(aes(x = 0.5, xend = 0.0, y = 0.5, yend = 0.5), arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_segment(aes(x = 0.5, xend = 1, y = 0.5, yend = 0.5), arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  annotate(geom="text", x=0.75, y=0.58, label="Distance\nfrom mean") +
  annotate(geom="text", x=0.25, y=0.45, label="-0.5", color = 'skyblue') +
  annotate(geom="text", x=0.75, y=0.45, label="0.5", color = 'skyblue') +
  geom_point(aes(x = 0.5, y = 0.5), color = 'skyblue') +
  ggtitle('PMF of X as number of heads in 1 fair coin flip')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = 0.5, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=0.5, y=0.75, label="E[X]", col = 'grey') +
  geom_segment(aes(x = 0.5, xend = 0.25, y = 0.5, yend = 0.5), arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_segment(aes(x = 0.5, xend = 0.75, y = 0.5, yend = 0.5), arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  annotate(geom="text", x=0.75, y=0.58, label="Squared distance\nfrom mean") +
  annotate(geom="text", x=0.25, y=0.45, label="0.25", color = 'skyblue') +
  annotate(geom="text", x=0.75, y=0.45, label="0.25", color = 'skyblue') +
  geom_point(aes(x = 0.5, y = 0.5), color = 'skyblue') +
  ggtitle('PMF of X as number of heads in 1 fair coin flip')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = 0.5, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=0.5, y=0.75, label="E[X]", col = 'grey') +
  geom_segment(aes(x = 0.5, xend = 0.0, y = 0.5, yend = 0.5), arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_segment(aes(x = 0.5, xend = 1, y = 0.5, yend = 0.5), arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  annotate(geom="text", x=0.75, y=0.6, label="Square root of average\nsquared distance\nfrom mean") +
  annotate(geom="text", x=0.25, y=0.45, label="0.5", color = 'skyblue') +
  annotate(geom="text", x=0.75, y=0.45, label="0.5", color = 'skyblue') +
  geom_point(aes(x = 0.5, y = 0.5), color = 'skyblue') +
  ggtitle('PMF of X as number of heads in 1 fair coin flip')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
plotdata <- data.frame(
  x = c(0, 1, 2),
  xend = c(1, 2, 3),
  fx = c(1/16, 3/8, 9/16),
  Fx = cumsum(c(1/16, 3/8, 9/16))
)

# Expected value
Ex <- sum(plotdata$x*plotdata$fx)

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.8, 2.8),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = 1.5, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=1.5, y=0.75, label="E[X]") +
  ggtitle('PMF of X as number of heads in 2 UNfair coin flips')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.8, 2.8),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = Ex, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=Ex, y=0.75, label="E[X]", color = 'grey') +
  geom_segment(aes(x = Ex, xend = x, y = fx, yend = fx),
               arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_point(aes(x = Ex, y = fx), color = 'skyblue') +
  annotate(geom="text", x=1.8, y=0.63, label="Distance\nfrom mean") +
  annotate(geom="text", x=(plotdata$x+Ex)/2, y=(plotdata$fx-0.05), label=(plotdata$x-Ex), color = 'skyblue') +
  ggtitle('PMF of X as number of heads in 2 UNfair coin flips')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.8, 2.8),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = Ex, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=Ex, y=0.75, label="E[X]", color = 'grey') +
  geom_segment(aes(x = Ex, xend = Ex+sign(x-Ex)*(x-Ex)^2, y = fx, yend = fx),
               arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_point(aes(x = Ex, y = fx), color = 'skyblue') +
  annotate(geom="text", x=1.8, y=0.63, label="Squared distance\nfrom mean") +
  annotate(geom="text", x=(plotdata$x+Ex)/2, y=(plotdata$fx-0.05), label=(plotdata$x-Ex)^2, color = 'skyblue') +
  ggtitle('PMF of X as number of heads in 2 UNfair coin flips')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------

sdx <- sqrt(sum((plotdata$x-Ex)^2 * plotdata$fx))

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_point() +
  coord_cartesian(xlim = c(-0.8, 2.8),
                  ylim = c(0,1)) +
  geom_segment(aes(x = x, y = c(0,0,0), xend = x, yend = fx)) +
  geom_vline(xintercept = Ex, lty = 'dashed', color = 'skyblue') +
  annotate(geom="text", x=Ex, y=0.75, label="E[X]", color = 'grey') +
  geom_segment(aes(x = Ex, xend = Ex-sdx, y = 0.5, yend = 0.5),
               arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_point(aes(x = Ex, y = fx), color = 'skyblue') +
  geom_segment(aes(x = Ex, xend = Ex+sdx, y = 0.5, yend = 0.5),
               arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_point(aes(x = Ex, y = fx), color = 'skyblue') +
  annotate(geom="text", x=1.8, y=0.63, label="Square root of average\nsquared distance\nfrom mean") +
  annotate(geom="text", x=(Ex+c(-1.05,1.05)*round(sdx, 3)/2), y=0.45,
           label=round(sdx, 3), color = 'skyblue') +
  ggtitle('PMF of X as number of heads in 2 UNfair coin flips')


## ----echo = TRUE--------------------------------------------------------------
file <- "https://raw.githubusercontent.com/UChicago-pol-methods/IntroQSS-F22/main/data/carsonPDB.csv"
df_pdb <- read.csv(file, as.is = TRUE)

head(df_pdb)


## ----echo = TRUE--------------------------------------------------------------
sapply(df_pdb[,c('Total_Pgs', 'maps', 'Redaction_total')], 
       function(x) c('mean' = mean(x, na.rm = TRUE),
                     'var' = var(x, na.rm = TRUE)))


## -----------------------------------------------------------------------------
runif(n = 1, min = 0, max = 1)


## ----fig = TRUE, width = 6, height=4, echo=FALSE------------------------------
result_n <- runif(n, min = 0, max = 1)

ggplot(data.frame(result_n), aes(x = result_n)) +
  geom_histogram(breaks = seq(0, 1, length.out = 15),
                 position = 'identity', color = 'white')


## ----fig = TRUE, width = 6, height=4, echo=FALSE------------------------------


plotdata <- data.frame(
  x = c(-1, 0, 1, 2),
  Fx = c(0, 0, 1, 1)
)

ggplot(plotdata, aes(x = x, y = Fx)) +
  geom_line() +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  ggtitle('CDF of Standard Uniform Distribution')


## ----fig = TRUE, width = 4, height=4, echo=FALSE------------------------------
plotdata <- data.frame(
  x = c(-1, 0, 1, 1),
  xend = c(0, 1, 1, 2),
  fx = c(0, 1, 1, 0)
)

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_segment(aes(x = x, y = fx, xend = xend, yend = fx)) +
  geom_point() +
  geom_point(aes(x = 0, y = 0), shape= 21, fill = 'white') +
  geom_point(aes(x = 1, y = 0), shape= 21, fill = 'white') +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  ggtitle('PDF of Standard Uniform Distribution')


## ----fig = TRUE, width = 4, height=4, echo=FALSE------------------------------
datapoly <- data.frame(x = c(0, 0, 1, 1),
                       y = c(0, 1, 1, 0))

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_segment(aes(x = x, y = fx, xend = xend, yend = fx)) +
  geom_point() +
  geom_point(aes(x = 0, y = 0), shape= 21, fill = 'white') +
  geom_point(aes(x = 1, y = 0), shape= 21, fill = 'white') +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  ggtitle('PDF of Standard Uniform Distribution')



## ----fig = TRUE, width = 4, height=4, echo=FALSE------------------------------
datapoly <- data.frame(x = c(0, 0, 1, 1),
                       y = c(0, 1, 1, 0))

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_segment(aes(x = x, y = fx, xend = xend, yend = fx)) +
  geom_point() +
  geom_point(aes(x = 0, y = 0), shape= 21, fill = 'white') +
  geom_point(aes(x = 1, y = 0), shape= 21, fill = 'white') +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  geom_polygon(data = datapoly, aes(x = x, y = y), fill = 'blue', alpha = 0.5) +
  ggtitle('PDF of Standard Uniform Distribution')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
datapoly <- data.frame(x = c(0, 0, 0.75, 0.75),
                       y = c(0, 1, 1, 0))

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_segment(aes(x = x, y = fx, xend = xend, yend = fx)) +
  geom_point() +
  geom_point(aes(x = 0, y = 0), shape= 21, fill = 'white') +
  geom_point(aes(x = 1, y = 0), shape= 21, fill = 'white') +
  coord_cartesian(xlim = c(-0.5, 1.5),
                  ylim = c(0,1)) +
  geom_polygon(data = datapoly, aes(x = x, y = y), fill = 'blue', alpha = 0.5) +
  ggtitle('PDF of Standard Uniform Distribution')


## ----fig = TRUE, width = 6, height=4, echo=FALSE------------------------------
result_n <- rnorm(n = 10000)
plotdata <- data.frame(
  x = result_n,
  Fx = pnorm(result_n),
  fx = dnorm(result_n)
)

ggplot(plotdata, aes(x = x, y = fx)) +
  geom_line() +
  coord_cartesian(xlim = c(-2.5, 2.5),
                  ylim = c(0,0.5)) +
  geom_vline(xintercept = 0, lty = 'dashed', color = 'skyblue') +
  geom_segment(aes(x = 0, xend = -1, y = 0.2, yend = 0.2),
               arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_segment(aes(x = 0, xend = 1, y = 0.2, yend = 0.2),
               arrow = arrow(length = unit(0.25, "cm")), color = 'skyblue') +
  geom_point(aes(x = 0, y = 0.2), color = 'skyblue') +
  annotate(geom="text", x = 0.5, y = .19, label = as.character(expression(sigma)), parse = TRUE, color = 'skyblue') +
  annotate(geom="text", x = -0.5, y = .19, label = as.character(expression(sigma)), parse = TRUE, color = 'skyblue') +
  annotate(geom="text", x = 0.075, y = .42, label = as.character(expression(mu)), parse = TRUE, color = 'skyblue') +
  ggtitle('PDF of Standard Normal Distribution')


## ----fig = TRUE, width = 6, height=4, echo=FALSE------------------------------
ggplot(plotdata, aes(x = x, y = Fx)) +
  geom_line() +
  coord_cartesian(xlim = c(-2.5, 2.5),
                  ylim = c(0,1)) +
  geom_vline(xintercept = 0, lty = 'dashed', color = 'skyblue') +
  ggtitle('CDF of Standard Normal Distribution')


## ----echo = FALSE-------------------------------------------------------------
f <- 'slides_32.Rnw'
knitr::purl(f)
knitr::Sweave2knitr(f)

