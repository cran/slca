% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate.R
\name{simulate.slca}
\alias{simulate.slca}
\title{Simulate Data from an \code{slca} Model}
\usage{
\method{simulate}{slca}(object, nsim = 500, seed = NULL, parm, nlevel, ...)
}
\arguments{
\item{object}{an \code{slca} object representing the model from which data will be simulated.}

\item{nsim}{an integer specifying the number of response observations to simulate. The default is 500.}

\item{seed}{an integer specifying the random seed for reproducibility. If not provided, results will vary across runs.}

\item{parm}{a user-specified set of parameters to guide the simulation. This is required if the model has not been previously estimated.}

\item{nlevel}{an integer or integer vector specifying the number of levels for each manifest item in the model. If a single integer is provided, all manifest items will have the same number of levels. The default is 2.}

\item{...}{Additional arguments passed to other methods.}
}
\value{
A \code{list} with the following components:
\item{class}{A \code{data.frame} containing the assigned latent class for each individual across all latent class variables.}
\item{response}{A \code{data.frame} containing the simulated manifest item responses.}
}
\description{
Simulates data based on a specified \code{slca} model. If the model parameters are not already estimated, they can either be provided by the user or generated randomly.
}
\examples{
m1 <- slca(lc1[3] ~ x1 + x2 + x3 + x4 + x5,
              lc2[4] ~ y1 + y2 + y3 + y4 + y5)
sim <- simulate(m1, 1000)
sapply(sim$class, table)

# simulate data with defined number of levels of manifest items
m2 <- slca(lc1[3] ~ x1 + x2 + x3 + x4)
sim <- simulate(m2, nlevel = c(3, 3, 3, 3))
d <- sim$response
sapply(d, table)

sim <- simulate(m2, nlevel = c(x1 = 2, x3 = 3, x4 = 4, x5 = 5))
d <- sim$response
sapply(d, table)

# simulate data with user-defined parameters
pi <- rep(1 / 3, 3)
rho <- c(.9, .1, .9, .1, .9, .1, .9, .1,
         .9, .1, .9, .1, .1, .9, .1, .9,
         .1, .9, .1, .9, .1, .9, .1, .9)
par <- c(pi, rho)
m3 <- slca(lc[3] ~ y1 + y2 + y3 + y4)
sim <- simulate(m3, parm = par)
mf <- estimate(m3, sim$response)
param(mf)
}
