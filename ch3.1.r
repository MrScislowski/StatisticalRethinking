values <- c("male", "female", "nonbinary")
freq <- c(1, 1, .1)

data <- sample(x = values, size = 10, prob = freq, replace = TRUE)
print(data)
