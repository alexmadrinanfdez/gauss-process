# gauss-process

`R` implementation of a (one-dimensional) Gaussian process regression.

## Gaussian process

By definition, observations follow a [__normal multivariate distribution__](https://en.wikipedia.org/wiki/Multivariate_normal_distribution). Therefore, observations are described by their *mean* and *covariance* functions. 

This __prior distribution__ is described by the assumption of a zero mean and an exponentially decaying variance for the observations. From here, based on the *actual* observations, the __posterior__ normal multivariate distribution (i.e., the __Gaussian process__) is computed through its parameters.

## Code

The function `gp` returns the parameters defining the posterior distribution (as a named `list`);

- mean vector (`mean`),
- covariance matrix (`cov`) and
- scale parameter (`scale`), which is equivalent to the point-wise variance.

at the *query points* `newx` after receiving the observations (`x`, `y`).