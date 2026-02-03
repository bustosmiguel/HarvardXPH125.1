library(dslabs)
library(tidyverse)
murders <- murders %>% mutate(rate = total/population)
View(x = df_practica)

# 3.2 Basic Data Wrangling ------------------------------------------------

Basic Data Wrangling
{
  
}
Creating Data Frames
{
  grades <-  data.frame(names = c("A", "B", "C"),
                        number = c(1,2,3),
                        notes = c(34, 77, 100),
                        stringsAsFactors = FALSE)
  
  class(grades$names)
}


# 3.3 Basic Plots -------------------------------------------------------------

Basic Plots
{
  population_in_millions <- murders$population/10^6
  total_gun_murders <- murders$total
  plot(population_in_millions, total_gun_murders)
  
  hist(murders$rate)
  
  murders$state[which.max(murders$rate)]
  murders$state[which.min(murders$rate)]
  
  boxplot(rate ~ region, data = murders)
  
}


# 4.2 BASIC CONDITIONALS --------------------------------------------------

# if-else statement

a <- 0 #cambialo a cero

if (a != 0){
  print(1/a)
} else {
  print("No reciprocal for 0.")
}

# General form:

# if(boolean condition){
#   expressions
# } else {
#   alternative expressions
# }

murder_rate <- murders$total/murders$population*100000

if (murder_rate[which.min(murder_rate)]<0.5){ # cambialo a 0.25
  print(murders$state[which.min(murder_rate)])
} else {
  print("No state has murder rate that low")
}

# ifelse.function
# Takes three arguments, a logical, and two possible answers.
# If the logical is true, the first answer is returned.
# If it's false, the second answer is returned.

a <- 0
ifelse(a > 0, 1/a, NA)

a <- c(0, 1, 2, -4, 5)
a

result <-  ifelse(a > 0, 1/a, NA)
result
ifelse(a > 0, 1/a, NA)


data(na_example)
sum(is.na(na_example))

no_nas <- ifelse(is.na(na_example), 0, na_example)
no_nas
sum(no_nas)
sum(is.na(no_nas))

# Now, two f(x): any() and all()

z <- c("TRUE", "TRUE", "FALSE")
any(z) # I get a TRUE, because at least one of them is true
all(z) #I get FALSE, because they're not all true.

z <- c("FALSE", "FALSE", "FALSE") #  I get a false, because none of them are true.
any(z) #of course I get a TRUE, because they're all true.
all(z) # FALSE, because they`re not all true.


# 4.3 FUNCTIONS -----------------------------------------------------------

# you will encounter situations in which the function that you need
# does not already exist.
# So you have to write your own.

avg <- function(x){
  s <- sum(x)
  n <- length(x)
  s/n
}

avg(0:10)
avg(200)

x <- 1:100
identical(mean(x), avg(x))
identical(100,10*10)

# Lexical Scope

# General form:

# my_function <- function(x){
#  operations that operate on x which
#  is defined by user of function
#  value final line is returned
#}

# NOTE: my_function <- function(x, y, z){ 
# CAN HAVE MORE VARIABLES AS x, y, z.
# For example, we can define a function that
# computes either the arithmetic or geometric average depending
# on a user-defined variable like this:

avg <- function(x, arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}

# COMMENTS: Once that's done, you'll see that the last argument, the argument that
# defines what's returned, uses an if else statement,
# which returns either the arithmetic or the geometric mean,
# depending on what the value of arithmetic is.


# 4.4 FOR LOOPS -----------------------------------------------------------

# what the sum of 1 plus 2 plus 3 plus
# dot dot dot, plus n is.
# The formula is n times n plus 1 divided by 2.

compute_sn <- function(n){
  x <- 1:n
  sum(x)
}
compute_sn(3) # if I apply to 3, I get back 6, 1 plus 2 plus 3.
compute_sn(100) # If I use 100, I get back 5,050, 1 plus 2 plus 3 all the way up to 100.
compute_sn(2017)# If I compute it on 2017, I get a very large number that's over two million.


# NOW!
# we want to compute this sum for various values of n.
# Say we want to compute it for 1, for 2 up to 25.
# So now we're computing 25 sums.
# Do we write 25 lines of code, one from each n?
# No.
# That's what loops are for.

# we are performing exactly the same task over and over again,
# except we're changing n.

# For-loops let us define the range that our variable takes.
# In our example, it would go from 1 to 25.
# Then change the value as you loop and evaluate the expression every time
# inside your loop.

# GENERAL FORM:

# for (i in range of values){
# operations that use i,
# which is changing across
# the range of values
# }

# Perhaps the simplest example 
# of a for loop is this useless piece of code:

for(i in 1:5){
  print(i)
}

# Also note that at the end of the loop, the value of i
# is the last value of the range.
# So if I type i after that for loop, I get back 5.

i

# ANOTHER ONE:
# here is the for loop we would write for our sums example:
# We want to compute the sum for the values 1, 2, 3 up to 25.

m <- 60

# And now, create an empty vector called s_n
# to store the results as I compute them:

s_n <- vector(length = m)

# Now I'm going to write a for loop.
# The index is n, and I'm going to go from 1 through m, which is 25.

for(n in 1:m){
  s_n[n] <- compute_sn(n)
}

s_n

# Conclusion of ANOTHER ONE:
# So inside the loop, I'm calling the function compute_sn()
# with a value n.
# n is the value that's changing from 1 through 25.
# And as I evaluate that, I assign it to the vector in the nth entry.
# We can check to see if we did this right by, 
# for example, making a plot.

n <- 1:m
plot(n, s_n)
lines(n, n*(n+1)/2)

# Programming basics other functions:

# Functions that are typically used instead of for loops in R:
# apply, sapply, tapply, and mapply
# Other functions that are widely used are 
# split, cut, quantile, reduce,
# identical, unique, and many others.

# Functions that are typically used instead of for loops in R:
# apply, sapply, tapply, and mapply
# Other functions that are widely used are 
# split, cut, quantile, reduce,
# identical, unique, and many others.

# Functions that are typically used instead of for loops in R:
# apply, sapply, tapply, and mapply
# Other functions that are widely used are 
# split, cut, quantile, reduce,
# identical, unique, and many others.





