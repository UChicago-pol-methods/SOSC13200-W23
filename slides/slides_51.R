## ----packages-----------------------------------------------------------------
library(ri)
library(ggplot2)
set.seed(60637)


## -----------------------------------------------------------------------------
df <- data.frame(
        # our initial treatment vector
        W = c(1, 0, 0, 0, 0, 0, 1),
        # our initial response vector
        Y = c(15, 15, 20, 20, 10, 15, 30),
        # treatment assignment probability
        probs = rep(2/7, 7)
)

df


## -----------------------------------------------------------------------------
Y1 <- df$Y[which(df$W == 1)]
Y0 <- df$Y[which(df$W == 0)]

(dm_hat <- mean(Y1) - mean(Y0))


## -----------------------------------------------------------------------------
df <-  cbind( # binds the columns together
        df,
        # Y(0) under the sharp null of no effect
        Y0 = df$Y,
        # Y(1) under the sharp null of no effect
        Y1 = df$Y)

df


## -----------------------------------------------------------------------------
(perms <- genperms(df$W))


## -----------------------------------------------------------------------------
Ys_null <- list(
        Y0 = df$Y0,
        Y1 = df$Y1
)

dm <- gendist(Ys_null,
              perms, 
              prob=df$probs)
dm


## -----------------------------------------------------------------------------
mean(dm)


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
gg_bins <- aggregate(list(rf = dm), by = list(dm = dm), length)
gg_bins$col <- abs(gg_bins$dm) >= dm_hat

ggplot(gg_bins, aes(x = dm, y = rf)) +
        geom_col() +
        geom_vline(xintercept = 0, color = 'red') +
        xlab('Difference in means estimates') + 
        ylab('Frequency') +
        ggtitle('Distribution of difference in means estimates under\nthe sharp null')


## -----------------------------------------------------------------------------
prop.table(table(dm))
(pval <- mean(abs(dm) >= dm_hat))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(gg_bins, aes(x = dm, y = rf, fill = col)) +
        geom_col() +
        geom_vline(xintercept = 0, color = 'red') + 
        scale_fill_manual(values=c("grey35", "#619CFF")) +
        theme(legend.position = 'none') +
        xlab('Difference in means estimates') + 
        ylab('Frequency') +
        ggtitle('Distribution of difference in means estimates under\nthe sharp null')


## -----------------------------------------------------------------------------
prop.table(table(dm))
(pval <- mean(abs(dm) >= dm_hat))


## -----------------------------------------------------------------------------
dispdist(distout = dm, 
         ate = dm_hat, 
         display.plot = FALSE)$two.tailed.p.value.abs


## ----load---------------------------------------------------------------------
df <- read.csv('../data/butler-broockman.csv', as.is = TRUE)
head(df)


## ----summary------------------------------------------------------------------
str(df)


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
# randomization inference function
my_ri <- function(df){
        df_ri <- df
        df_ri$newW <- sample(df$W)
        Y1_ri <- df$Y[which(df_ri$newW == 1)]
        Y0_ri <- df$Y[which(df_ri$newW == 0)]
        ate_hat <- mean(Y1_ri)-mean(Y0_ri)
  return(ate_hat)
}



## -----------------------------------------------------------------------------
my_ri(df)


## -----------------------------------------------------------------------------
my_ri(df)


## -----------------------------------------------------------------------------
# number of iterations
n_iter <- 1000

# replicate does the same (random) function many times
dm <- replicate(n = n_iter, my_ri(df))
head(dm)


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
null_dist <- data.frame(dm)
null_dist$bins <- cut(dm, breaks = 50)
null_dist <- aggregate(list(count = null_dist$dm), by = list(bins = null_dist$bins), length)
null_dist$bin_max <- as.numeric(gsub(".?(-?[0-9]+[.]+[0-9]+).*", "\\1", null_dist$bins))
null_dist$bin_min <- as.numeric(gsub(".*,(-?[0-9]+[.]+[0-9]+(e-[0-9]+)?)]$", "\\1", null_dist$bins))
null_dist$bin_mid <- (null_dist$bin_max - null_dist$bin_min)/2 + null_dist$bin_min
null_dist$col <- abs(null_dist$bin_min) >= abs(dm_hat)

ggplot(null_dist, aes(x = bin_mid, y = count)) +
  geom_col() +
  geom_vline(xintercept = 0, color = 'red')


## -----------------------------------------------------------------------------
(pval <- mean(abs(dm) >= abs(dm_hat)))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------

ggplot(null_dist, aes(x = bin_mid, y = count, fill = col)) +
  geom_col() +
  geom_vline(xintercept = 0, color = 'red') + 
  scale_fill_manual(values=c("grey35", "#619CFF")) +
  theme(legend.position = 'none')


## -----------------------------------------------------------------------------
(pval <- mean(abs(dm) >= abs(dm_hat)))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
null_dist$col2 <- null_dist$bin_min <= dm_hat

ggplot(null_dist, aes(x = bin_mid, y = count)) +
  geom_col() +
  geom_vline(xintercept = 0, color = 'red') + 
  scale_fill_manual(values=c("grey35", "#619CFF")) +
  theme(legend.position = 'none')


## -----------------------------------------------------------------------------
(pval <- mean(dm <= dm_hat))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(null_dist, aes(x = bin_mid, y = count, fill = col2)) +
  geom_col() +
  geom_vline(xintercept = 0, color = 'red') + 
  scale_fill_manual(values=c("grey35", "#619CFF")) +
  theme(legend.position = 'none')


## -----------------------------------------------------------------------------
(pval <- mean(dm <= dm_hat))


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(null_dist, aes(x = bin_mid, y = count, fill = col2)) +
  geom_col() +
  geom_vline(xintercept = 0, color = 'red') + 
  scale_fill_manual(values=c("grey35", "#619CFF")) +
  theme(legend.position = 'none')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
null_dist$col3 <- null_dist$bin_min >= dm_hat
ggplot(null_dist, aes(x = bin_mid, y = count, fill = col3)) +
  geom_col() +
  geom_vline(xintercept = 0, color = 'red') + 
  scale_fill_manual(values=c("grey35", "#619CFF")) +
  theme(legend.position = 'none')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
ggplot(null_dist, aes(x = bin_mid, y = count, fill = col)) +
  geom_col() +
  geom_vline(xintercept = 0, color = 'red') + 
  scale_fill_manual(values=c("grey35", "#619CFF")) +
  theme(legend.position = 'none')


## ----fig = TRUE, width = 5, height=5, echo=FALSE------------------------------
hist(rnorm(10))


## ----echo = FALSE-------------------------------------------------------------
f <- 'slides_51.Rnw'
knitr::purl(f)
knitr::Sweave2knitr(f)

