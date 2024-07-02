
## Plotting posterior distribution for globe tossing example.
plot_posterior <- function (priorfn) {
    p_grid <- seq(from=0, to=1, length.out=20)
    prior <- priorfn(p_grid)
    likelihood <- dbinom(6, size=9, prob=p_grid)
    unstd.posterior <- likelihood * prior
    posterior <- unstd.posterior / sum(unstd.posterior)
    plot(p_grid, posterior, type="b", xlab="probability of water", ylab="posterior probability")
    mtext("20 points")
}

# three priors for globe tossing example
prior1 <- function(x) {
    return(rep(1, length(x)))
}

prior2 <- function(x) {
    return(ifelse(x < .5, 0, 1))
}

prior3 <- function(x) {
    return(
        exp( -5*abs(x - .5))
    )
}
# plot_posterior(prior3)

## Quadratic approximation for globe tossing model:
library(rethinking)
globe.qa <- map(
    alist(
        w ~ dbinom(9, p),
        p ~ dunif(0, 1)
    ),
    data=list(w=6)
)

print(precis(globe.qa))
