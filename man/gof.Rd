% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diagnostic.R
\name{gof}
\alias{gof}
\alias{gof.slcafit}
\title{Goodness-of-Fit Test for Fitted \code{slca} Model}
\usage{
gof(object, ...)

\method{gof}{slcafit}(
   object, ..., test = c("none", "chisq", "boot"),
   nboot = 100, plot = FALSE,
   maxiter = 100, tol = 1e-6, verbose = FALSE
)

\method{gof}{slcafit}(
  object,
  ...,
  test = c("none", "chisq", "boot"),
  nboot = 100,
  plot = FALSE,
  maxiter = 100,
  tol = 1e-06,
  verbose = FALSE
)
}
\arguments{
\item{object}{an object of class \code{slcafit}.}

\item{...}{additional objects of class \code{slcafit} for comparison.}

\item{test}{a character string specifying the type of test to be conducted. If \code{"chisq"}, a chi-squared test is conducted. If \code{"boot"}, a bootstrap test is conducted.}

\item{nboot}{an integer specifying the number of bootstrap rounds to be performed.}

\item{plot}{a logical value indicating whether to print histogram of G-squared statistics for boostrap samples, only for \code{test = "boot"}. The default is \code{FALSE}.}

\item{maxiter}{an integer specifying the maximum number of iterations allowed for the estimation process during each bootstrap iteration. The default is 100.}

\item{tol}{a numeric value specifying the convergence tolerance for each bootstrap iteration. The default is \code{1e-6}.}

\item{verbose}{a logical value indicating whether to print progress updates on the number of bootstrapping rounds completed.}
}
\value{
A \code{data.frame} containing the number of parameters (Df), loglikelihood, AIC, BIC, G-squared statistics, and the residual degree of freedom for each object.
If a statistical test is performed (using \code{test}), the result includes the corresponding p-value.
}
\description{
Computes the AIC, BIC, and deviance statistic (G-squared) for assessing the goodness-of-fit of a fitted \code{slca} model. If the \code{test} argument is specified, absolute model fit can be evaluated using deviance statistics.
}
\examples{
library(magrittr)
data <- gss7677[gss7677$COHORT == "YOUNG", ]
stat2 <- slca(status(2) ~ PAPRES + PADEG + MADEG) \%>\%
   estimate(data = data, control = list(verbose = FALSE))
stat3 <- slca(status(3) ~ PAPRES + PADEG + MADEG) \%>\%
   estimate(data = data, control = list(verbose = FALSE))
stat4 <- slca(status(4) ~ PAPRES + PADEG + MADEG) \%>\%
   estimate(data = data, control = list(verbose = FALSE))

gof(stat2, stat3, stat4)
gof(stat2, stat3, stat4, test = "chisq")
\donttest{
gof(stat2, stat3, stat4, test = "boot")
}

compare(stat3, stat4)
compare(stat3, stat4, test = "chisq")
\donttest{
compare(stat3, stat4, test = "boot")
}
}
\seealso{
\link[slca]{compare}
}
