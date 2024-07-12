## Toy problem; 3 bean types, 5 bean ladle

analytic_p <- 93 / 243
delta_p <- 1 / 243

true_count <- 382748981
total_count <- 1000000000

p_grid <- seq(
  from = analytic_p - delta_p,
  to = analytic_p + delta_p, length.out = 10000
)
likelihood <- dbinom(true_count, size = total_count, prob = p_grid)

## Make a plot
# plot(p_grid, likelihood,
#   type = "b", # nolint: commented_code_linter.
#   xlab = "chance of missing bean types",
#   ylab = "probability"
# )
# abline(v = analytic_p, col = "red")

## Calculate a confidence interval aka credible interval
samples <- sample(x = p_grid, prob = likelihood, replace = TRUE, size = 1e4)

print("95% credible interval: ")
calc_quantiles <- quantile(x = samples, probs = c(.05 / 2, 1 - .05 / 2))
print(calc_quantiles)
print(
  paste0(
    "analytic prediction: ", analytic_p
  )
)

## Percent of samples below the analytical one...
percent_below <- sum(samples < analytic_p) / length(samples) * 100
print(
  paste0(
    "Amount of distribution below analytic p: ", round(percent_below, digits = 2), "%"
  )
)
