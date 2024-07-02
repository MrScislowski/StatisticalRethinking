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
