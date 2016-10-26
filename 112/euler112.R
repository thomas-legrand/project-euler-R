# Working from left-to-right if no digit is exceeded by the digit to its left it is called an increasing number; for example, 134468.
# Similarly if no digit is exceeded by the digit to its right it is called a decreasing number; for example, 66420.
# We shall call a positive integer that is neither increasing nor decreasing a "bouncy" number; for example, 155349.
# Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.
# Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.
# Find the least number for which the proportion of bouncy numbers is exactly 99%.


decompose <- function(number) {
  if (number > 0) return(c(decompose(number %/% 10), number %% 10))
}

isBouncy <- function(number) {
  decreasing <- all(diff(decompose(number)) >= 0)
  increasing <- all(diff(decompose(number)) <= 0)
  return(!decreasing && !increasing)
}

assertthat::validate_that(isBouncy(16546849551))
assertthat::validate_that(!isBouncy(12222358999))
assertthat::validate_that(!isBouncy(8552111))
assertthat::validate_that(isBouncy(16459459158951))

target.proportion <- 0.90000

leastNumberSuchThat <- function(prop) {
  c <- 0
  i <- 1
  while(c / i <= prop) {
    i <- i + 1
    if (isBouncy(i)) {
      c <- c + 1
    }
  }
  return(i-1)
}

assertthat::are_equal(leastNumberSuchThat(0.5), 538)
assertthat::are_equal(leastNumberSuchThat(0.9), 21780)

leastNumberSuchThat(0.99)
