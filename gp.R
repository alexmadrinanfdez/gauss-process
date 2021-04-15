eps <- sqrt(.Machine$double.eps) # define small number

# point-wise covariance function
exp.cov <- function(x, xp) {
  exp(-50 * (x - xp)^2)
}

# covariance matrix
covmtx <- function(x, xp) {
  m <- matrix(data = 0, nrow = length(x), ncol = length(xp))
  for (i in 1:length(x)) {
    for (j in 1:length(xp)) {
      m[i, j] <- exp.cov(x[i], xp[j])
    }
  }
  return(m)
}

# fit interpolating posterior gaussian process
gp <- function(x, y, newx) {
  # x - observed coordinates
  # y - observed values
  # newx - predictions
  
  cxx <- covmtx(x, x)
  cnn <- covmtx(newx, newx)
  cnx <- covmtx(newx, x)
  cxi <- solve(a = cxx) # inverse
  
  tau <- drop(t(y) %*% cxi %*% y / length(y)) # scale
  
  mu <- cnx %*% cxi %*% y
  sg <- tau * (cnn - cnx %*% cxi %*% t(cnx))
  return(list(mean = mu, cov = sg, scale = tau)) # parameters
}