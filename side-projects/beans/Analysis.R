## Toy problem

analytic_p <- 93 / 243

p_grid <- seq(from = 0.3825, to = 0.3830, length.out = 1000)
likelihood <- dbinom(38266235, size = 100000000, prob = p_grid)
plot(p_grid, likelihood,
  type = "b",
  xlab = "chance of missing bean types",
  ylab = "probability"
)
abline(v = analytic_p, col = "red")
