library(somebm)
library(numDeriv)

##Estimating fractional Brownian motion

#H=0.3

#fBM=fbm(hurst=H, n)
#fBM2=sqrt(2)*fbm(hurst=H, n)

## Estimating H and sigma

# V=sum(diff(fBM)^2)/n #Non-normalized QV, frequency n
# fBM.half=fBM[seq(1,length(fBM),2)]
# V.half=2*sum(diff(fBM.half)^2)/n
# H.est=log2(V.half/V)/2
# sig.est=sum((diff(fBM)/n^(-H.est))^2)/n

# V2=sum(diff(fBM2)^2)/n #Non-normalized QV, frequency n
# fBM2.half=fBM2[seq(1,length(fBM2),2)]
# V2.half=2*sum(diff(fBM2.half)^2)/n
# H2.est=log2(V2.half/V2)/2
# sig2.est=sum((diff(fBM2)/n^(-H2.est))^2)/n


# Take g(x) = x
# eta <- function(hurst) {
#   return 2 * hurst * integrate
# }

# fBM + noise

n <- 10^5
preaverage <- function(obs, g, kapp) {
  intervals <- diff(obs)
  n <- length(intervals)
  kn <- floor(n ^ kapp)
  ret <- g(1 / kn) * intervals[1:(n - kn + 1)]
  for (j in range(2, kn)) {
    ret <- ret + g(j / kn) * intervals[j:(n - kn + j)]
  }
  ret
}

g <- function(x) {
  x^3
}

f <- function(x) {
  x^2
}


H <- 0.8
kapp <- 2 / 3
fBM <- fbm(H, n)

rho <- 0.1
obs <- fBM
obs.half <- obs[seq(1, length(obs), 2)]

obs.pre <- preaverage(obs, g, kapp)
obs.half.pre <- preaverage(obs.half, g, kapp)
V <- sum(f(obs.pre)) / n
V.half <- 2 * sum(f(obs.half.pre)) / n
H.est <- 0.5 * log2(V.half / V)
print(H.est)
