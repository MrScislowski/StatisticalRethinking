########## 2M1 ##########
plot_posterior <- function(data, n, prior) {
  p_grid <- seq(from = 0, to = 1, length.out = n)
  prior_grid <- prior(p_grid)

  likelihood <- dbinom(sum(data), size = length(data), prob = p_grid)
  unstd_posterior <- prior_grid * likelihood
  posterior <- unstd_posterior / sum(unstd_posterior)

  plot(p_grid, posterior,
    type = "b",
    xlab = "probability of water",
    ylab = "posterior probability"
  )
  mtext(paste0(n, " points"))
}

uniform_prior <- function(p_grid) {
  return(rep(1, times = length(p_grid)))
}

# plot_posterior(c(1, 1, 1), 20, uniform_prior)
# plot_posterior(c(1, 1, 1, 0), 20, uniform_prior)
# plot_posterior(c(0, 1, 1, 0, 1, 1, 1), 20, uniform_prior)


########## 2M2 ##########
step_prior <- function(p_grid) {
  ifelse(p_grid >= 0.5, 1, 0)
}

# plot_posterior(c(1, 1, 1), 20, step_prior)
# plot_posterior(c(1, 1, 1, 0), 20, step_prior)
# plot_posterior(c(0, 1, 1, 0, 1, 1, 1), 20, step_prior)


########## 2M3 ##########

# set up a prior that is zero except for at p = 0.0 (mars) and at p = 0.7 (earth)
tolerance <- 0.05 / 10
prior <- function(p_grid) {
  ifelse(abs(p_grid - 0) < tolerance, 1,
    ifelse(abs(p_grid - 0.7) < tolerance, 1, 0)
  )
}

p_grid <- seq(from = 0, to = 1, by = 0.05)
prior_grid <- prior(p_grid)

likelihood <- dbinom(0, size = 1, prob = p_grid)
unstd_posterior <- prior_grid * likelihood
posterior <- unstd_posterior / sum(unstd_posterior)

# print(paste0("Probability of mars: ", posterior[round(0 / 0.05) + 1]))
# print(paste0("Probability of Earth: ", posterior[round(0.7 / 0.05) + 1]))


########## 2M4 ##########

# looking at one side, then the other of the double black card could yield:
# B1B2, B2B1

# for the single black card:
# BW, WB

# for the double white card:
# W1W2, W2W1

# Given that we've seen a black card, it has to be one of the first three possibilities
# 2 of those 3 have black as the other side.


########## 2M5 ##########

#     B/B        B/W      W/W       B/B
# B1B2, B2B1, BW, WB, W1W2, W2W1, B1B2, B2B1
#
# if one black is observed there are 5 options
# 4 of which the other side is also black

########## 2M6 ##########

#     B/B        B/W      W/W
# B1B2, B2B1, BW, WB, W1W2, W2W1

# but this time the B/W is weighted by a factor of 2. So we cound the BW twice
# => 4 options in total
# 2 of which will have black on the other side


########## 2M7 ##########

# In this scenario, the first observed side of the first card is black, the first observed side of the second card is white.
# Let's enumerate how many ways this can occur:

# 1st card is B/B, 2nd card is B/W
# weight = 2 x 1 = 2

# 1st card is B/B, 2nd card is W/W
# weight = 2 x 2 = 4

# 1st card is B/W, 2nd card is W/W
# weight = 1 x 2 = 2

# the first two scenarios give black back, the third does not.
# So P = (2 + 4) / (2 + 4 + 2) = 6/8 = 3/4

########## 2H1 ##########
p_grid <- c(0.1, 0.2)
prior <- c(1, 1)
likelihood <- dbinom(x = 1, size = 1, p_grid)
posterior <- (prior * likelihood) / sum(prior * likelihood)

# print(paste0(
#   "Probability of another twins is: ",
#   sum(p_grid * posterior)
# ))

########## 2H2 ##########
# print(paste0(
#   "Probability panda is species A is ",
#   posterior[1]
# ))


########## 2H3 ##########
prior <- posterior
likelihood <- dbinom(x = 0, size = 1, p_grid)
posterior <- (prior * likelihood) / sum(prior * likelihood)
# print(paste0(
#   "Probability panda is species A is ",
#   posterior[1]
# ))

########## 2H4 ##########
# Notation
# tA is the event that a test indicates "species A"
# A is the event that the species is actually A
# similarly for B

# Information
# P(tA | A) = 0.8 and thus P(tB | A) = 0.2
# P(tB | B) = 0.65 and thus P(tA | B) = 0.35

# Bayes theorem states that the probability that it's A or B given testing for A is:
# P(A | tA) = P(tA | A) * P(A) / P(tA)
# P(B | tA) = P(tA | B) * P(B) / P(tA)

# we don't really need the value of P(tA) because it's a common denominator,
# so we'll get the relative probabilities

# If we consider just the results of the test (i.e. flat prior):
test_only_prob <- c(.5, .5) * c(.8, .35)
test_only_prob <- test_only_prob / sum(test_only_prob)
print(paste0("Probability of A based on test alone: ", test_only_prob[1]))

# If we take the birth data into account,
prior <- posterior
posterior <- prior * c(.8, .35)
posterior <- posterior / sum(posterior)
print(paste0("Probability of A based on births and test: ", posterior[1]))
