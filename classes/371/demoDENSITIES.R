# remember to set RStudio to your working directory
setwd("~/Dropbox/371_2019/data")

# Poisson demos
ll=2.3
data<-rpois(100,ll)
data<-rpois(1000,ll)

hist(data,seq(-.5,max(data)+1,1),col="yellow")

ll=3.1
data<-rpois(1000,ll)
hist(data,seq(-.5,max(data)+.5,1),add=T,col="cyan")

# Get the probability mass function for a binomial RV
# with n=10, p=.2 and other discrete RVs
probBinom=dbinom(0:10,10,.2)
plot(0:10,probBinom)
probGeom<-dgeom(0:10,.2)
# similar commands for dhyper and dnbinom.  Use help(dhyper), etc.

# Get a random draw of size 100 from a binomial distribution
dataBINOM=rbinom(100,10,.2)

# some plotting commands for densities
# The first command makes a new plot, the second adds to the plot
hist(dataBINOM,seq(-.5,10.5,1),prob=T)
lines(0:10,probBinom,col="red")

# Get a random draw of size 1000 from a geometric distribution
dataGEOM=rgeom(1000,.2)
hist(dataGEOM,prob=T,breaks=25)

# Get a random draw of size 1000 from a geometric distribution
dataPOIS=rpois(1000,10)
hist(dataPOIS,prob=T,breaks=25)

# Illustrate the use the the Poisson dist can be used to estimate Binom
# Book:  p. 134, Example 3.21

{
  n=20; p=.1; lambda = n*p;
  cat("  n   p lambda\n",n, p, lambda)
}
{
  nrows=15
  vals=matrix(0, nrow=nrows, ncol = 4)
  colnames(vals) =c("i","binom","pois","diff")
  for (i in 1:nrows){
    db=dbinom(i,n,p)
    dp=dpois(i,lambda)
    vals[i,]=cbind(i,db,dp,db-dp)
  }
  as.table(round(vals,7))
}

# For the gamma densities, do not forget to specify
# scale = beta.  If you forget this, R will use rate = 1/scale

# gammas
{ 
  # mean is not held constant at 1, scale is held fixed
  
  x=seq(.01,5,.01)
  
  beta=.2
  
  gamma_a.1=dgamma(x, shape=.1, scale=beta)
  gamma_a.5=dgamma(x, shape=.5, scale=beta)
  gamma_a1=dgamma(x, shape=1, scale=beta)
  gamma_a2=dgamma(x, shape=2, scale=beta)
  gamma_a3=dgamma(x, shape=3, scale=beta)
  gamma_a4=dgamma(x, shape=4, scale=beta)
  gamma_a7=dgamma(x, shape=7, scale=beta)
  gamma_a10=dgamma(x, shape=10, scale=beta)
  gamma_a20=dgamma(x, shape=20, scale=beta)
}

{ 
  # mean is not held constant at 1, shape is held fixed
  
  x=seq(.01,5,.01)
  
  beta=.2
  
  gamma_a.1=dgamma(x, shape=2, scale=.1)
  gamma_a.5=dgamma(x, shape=2, scale=.5)
  gamma_a1=dgamma(x, shape=2, scale=1)
  gamma_a2=dgamma(x, shape=2, scale=2)
  gamma_a3=dgamma(x, shape=2, scale=3)
  gamma_a4=dgamma(x, shape=2, scale=4)
  gamma_a7=dgamma(x, shape=2, scale=7)
  gamma_a10=dgamma(x, shape=2, scale=10)
  gamma_a20=dgamma(x, shape=2, scale=20)
}

{
  # all have mean 1
  
  x=seq(.01,5,.01)
  
  gamma_a.1=dgamma(x, shape=.1, scale=1/.1)
  gamma_a.5=dgamma(x, shape=.5, scale=1/.5)
  gamma_a1=dgamma(x, shape=1, scale=1/1)
  gamma_a2=dgamma(x, shape=2, scale=1/2)
  gamma_a3=dgamma(x, shape=3, scale=1/3)
  gamma_a4=dgamma(x, shape=4, scale=1/4)
  gamma_a7=dgamma(x, shape=7, scale=1/7)
  gamma_a10=dgamma(x, shape=10, scale=1/10)
  gamma_a20=dgamma(x, shape=20, scale=1/20)
}

{
  plot(x,gamma_a1,col="magenta",type='l',lwd=3,ylim=c(0,2))
  lines(x,gamma_a.1,col="blue",type='l',lwd=3)
  lines(x,gamma_a.5,col="dark green",lwd=3)
  lines(x,gamma_a1,col="cadet blue",lwd=3)
  lines(x,gamma_a2,col="sky blue",lwd=3)
  lines(x,gamma_a3,col="violetred",lwd=3)
  lines(x,gamma_a4,col="orange",lwd=3)
  lines(x,gamma_a7,col="thistle4",lwd=3)
  lines(x,gamma_a10,col="turquoise",lwd=3)
  lines(x,gamma_a20,col="salmon4",lwd=3)
}

graphics.off()

# exponentials
x=seq(.01,7,.01)

exp_b.1=dgamma(x, shape=1, scale = .1 )
exp_b.5=dgamma(x, shape=1, scale = .5 )
exp_b1=dgamma(x, shape=1, scale = 1)
exp_b2=dgamma(x, shape=1, scale = 2)
exp_b4=dgamma(x, shape=1, scale = 4)

plot(x,exp_b1,col="magenta",type='l',lwd=5)
lines(x,exp_b.1,col="blue",type='l',lwd=3)
lines(x,exp_b.5,col="dark green",lwd=3)
lines(x,exp_b2,col="sky blue",lwd=3)
lines(x,exp_b4,col="orange",lwd=3)

# chi-squared
x=seq(.01,40,.01)

# degrees of freedom = 2*shape
{
  chi_vu3=dgamma(x, shape=1.5, scale = 2 )
  chi_vu4=dgamma(x, shape=2, scale = 2 )
  chi_vu8=dgamma(x, shape=4, scale = 2 )
  chi_vu12=dgamma(x, shape=6, scale = 2)
  chi_vu16=dgamma(x, shape=8, scale = 2)
  chi_vu20=dgamma(x, shape=10, scale = 2)
}

plot(x,chi_vu3,col="red",type='l',lwd=3)
lines(x,chi_vu4,col="magenta",type='l',lwd=3)
lines(x,chi_vu8,col="blue",lwd=3)
lines(x,chi_vu12,col="dark green",lwd=3)
lines(x,chi_vu16,col="sky blue",lwd=3)
lines(x,chi_vu20,col="orange",lwd=3)

# betas
x=seq(0,1,.01)

beta_a1_b1=dbeta(x, 1,1)
beta_a2_b2=dbeta(x, 2,2)
beta_a3_b3=dbeta(x, 3,3)
beta_a.5_b.5=dbeta(x, .5,.5)
beta_a.1_b.1=dbeta(x, .1,.1)

plot(x,beta_a1_b1,col="magenta",type='l',lwd=3,ylim=c(0,2))
#plot(x,beta_a2_b2,col="cadet blue",type='l',lwd=3,ylim=c(0,2))
lines(x,beta_a2_b2,col="cadet blue",type='l',lwd=3)
lines(x,beta_a3_b3,col="blue",type='l',lwd=3)
lines(x,beta_a.5_b.5,col="orange",type='l',lwd=3)
lines(x,beta_a.1_b.1,col="red",type='l',lwd=3)

# asymmetries
# different alphas and betas
beta_a1.1_b.5=dbeta(x, .1,.5)
beta_a.2_b.5=dbeta(x, .2,.5)
beta_a.6_b.3=dbeta(x, .6,.3)

plot(x,beta_a1.1_b.5,col="magenta",type='l',lwd=3,ylim=c(0,5))
lines(x,beta_a.2_b.5,col="sky blue",lwd=3)
lines(x,beta_a.6_b.3,col="orange",type='l',lwd=3)

# asymmetries
# different alphas and betas
beta_a11_b5=dbeta(x, 1,5)
beta_a2_b5=dbeta(x, 2,5)
beta_a10_b3=dbeta(x, 10,3)
beta_a10_b1=dbeta(x, 10,1.2)

plot(x,beta_a11_b5,col="magenta",type='l',lwd=3,ylim=c(0,5))
lines(x,beta_a2_b5,col="sky blue",lwd=3)
lines(x,beta_a10_b3,col="orange",type='l',lwd=3)
lines(x,beta_a10_b1,col="cadet blue",type='l',lwd=3)

