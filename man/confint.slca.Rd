% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{confint.slca}
\alias{confint.slca}
\title{Confidence Intervals for Model Parameters}
\usage{
\method{confint}{slca}(object, parm, level = 0.95, type = c("param", "logit"), ...)
}
\arguments{
\item{object}{an object of class \code{slca} and \code{estimated}.}

\item{parm}{an integer string specifying parameters to be given confidence intervals.}

\item{level}{numeric value representing the desired confidence level for the intervals, with a default of 0.95.}

\item{type}{a character string specifying the format in which the results should be returned. Options include \code{"probs"} for probability format and \code{"logit"} for log-odds (logit) format, with the default being \code{"probs"}.}

\item{...}{additional arguments.}
}
\value{
A \code{matrix} with two columns representing the confidence intervals for the selected parameters. The columns are named based on the specified confidence level (\code{level}):
\itemize{
\item \verb{100 * (level / 2) \%}: This column shows the lower bound of the confidence interval.
\item \verb{100 * (1 - level / 2) \%}: This column shows the upper bound of the confidence interval.
}

The \code{level} parameter specifies the confidence level, with common values being 0.05 for a 95\% confidence interval and 0.01 for a 99\% confidence interval.
}
\description{
Computes confidence intervals for one or more parameters of fitted model. Package \pkg{slca} adds methods for \code{slca} fits.
}
\examples{
param(nlsy_jlcpa, index = TRUE)
confint(nlsy_jlcpa)
confint(nlsy_jlcpa, 1:4)
}
