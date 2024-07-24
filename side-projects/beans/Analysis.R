## Toy problem; 3 bean types, 5 bean ladle

analytic_p <- 93 / 243
delta_p <- 1 / 243

# For initial code using Math.random() (=> possibly biased)
# true_count <- sum(c(
#   382748981, 38275176, 38271092, 38273464,
#   38267967, 38275401, 38271099, 38271141,
#   38258013, 38274030, 38266235, 38277299, 382739158, 382698050, 382723831
# ))
# total_count <- sum(c(
#   1000000000, 100000000, 100000000, 100000000,
#   100000000, 100000000, 100000000, 100000000,
#   100000000, 100000000, 100000000, 100000000, 1000000000, 1000000000, 1000000000
# ))

# updated code using new Random()
true_count <- sum(c(
  382718580, 382723828, 382715554, 382706980, 382698582
))
total_count <- sum(c(
  1000000000 * 5
))



p_grid <- seq(
  from = analytic_p - delta_p,
  to = analytic_p + delta_p, length.out = 10000
)
likelihood <- dbinom(true_count, size = total_count, prob = p_grid)



## Calculate a confidence interval aka credible interval
samples <- sample(x = p_grid, prob = likelihood, replace = TRUE, size = 1e4)

print("95% credible interval: ")
quantiles95 <- quantile(x = samples, probs = c(.05 / 2, 1 - .05 / 2))
quantiles995 <- quantile(x = samples, probs = c(.005 / 2, 1 - .005 / 2))
print(quantiles95)
print(
  paste0(
    "analytic prediction: ", analytic_p
  )
)

## Percent of samples below the analytical one...
percent_below <- sum(samples < analytic_p) / length(samples) * 100
print(
  paste0(
    "Amount of distribution below analytic p: ",
    round(percent_below, digits = 2),
    "%"
  )
)


plot_grid <- seq(
  from = quantiles995[1],
  to = quantiles995[2],
  length.out = 1000
)
plot_likelihood <- dbinom(true_count, size = total_count, prob = plot_grid)

## Make a plot
plot(plot_grid, plot_likelihood,
  type = "b",
  xlab = "chance of missing bean types",
  ylab = "probability"
)
abline(v = analytic_p, col = "red")
abline(v = quantiles95[1], col = "green")
abline(v = quantiles95[2], col = "green")

## the answer to the original question
numerator <- choose(11, 10) * 10^140 -
  choose(11, 9) * 9^140 +
  choose(11, 8) * 8^140 -
  choose(11, 7) * 7^140 +
  choose(11, 6) * 6^140 -
  choose(11, 5) * 5^140 +
  choose(11, 4) * 4^140 -
  choose(11, 3) * 3^140 +
  choose(11, 2) * 2^140 -
  choose(11, 1) * 1^140

denominator <- 11^140

fancy_answer <- numerator / denominator
easy_first_approximation <- 11 * (10 / 11)^140

print(
  paste0(fancy_answer, " / ", easy_first_approximation, 
  " x 100 = ", fancy_answer / easy_first_approximation * 100)
)

