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


########## 2M2 ##########
