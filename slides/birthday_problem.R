k <- 17  # number of people in room
p <- numeric(k)  # create numeric vector to store probabilities
for (i in 1:k)      {
  q <- 1 - (0:(i - 1))/365  # 1 - prob(no matches)
  p[i] <- 1 - prod(q)  }
prob <- p[k]
prob


k <- 17 # number of people
sims <- 10000 # number of simulations
event <- 0 # counter
for (i in 1:sims) {
  days <- sample(1:365, k, replace = TRUE)
  days.unique <- unique(days) # unique birthdays
  if (length(days.unique) < k) {
    event <- event + 1 } }
event / sims





k <- 100  # number of people in room
p <- numeric(k)  # create numeric vector to store probabilities
for (i in 1:k)      {
  q <- 1 - (0:(i - 1))/365  # 1 - prob(no matches)
  p[i] <- 1 - prod(q)  }
plot(p, main="Probability at least 2 people have same Birthday", xlab ="Number of People", ylab = "Probability", col="blue")  