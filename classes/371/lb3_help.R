# You are under no obligation to use this file, but it may
# help with the graphing.

# remember to set RStudio to your working directory
setwd("PUT YOUR DIRECTORY HERE or USE THE MENU")

# Help for Lab 3 plots

{
  # define support for posterior density of p
  x=seq(0,1,.0001)
  
  # put your functions here 
  
  # n=10, posterior is Unif
  n1=1; n2=9
  # C=1/beta(2,10)
  C=110
  sampleSize_10=C*x^n1*(1-x)^n2
  # check that you got the constant correct by numerical integration
  f=function(x) {C*x^n1*(1-x)^n2}
  integrate(f,0,1)
  
  # good margins for plot
  par(mai=c(1,1.25,.5,.5))
  plot(x,sampleSize_10,type="l",lwd=3,cex.lab=2,xlim=c(0,1),xlab="p",ylab="Posteriors",ylim=c(0,33),main="Uniform Priors",col="blue")
  
  # n=100, posterior is Unif
  
  # put your function here
  #
  # bogus plot to illustrate how to add to current plot
  # You of course should replace this with the correct formula
  sampleSize_100=sin(pi*x)
  C=pi/2
  f=function(x) {C*sin(pi*x)}
  integrate(f,0,1)
  # add the plot to the previous one
  lines(x, sampleSize_100,lwd=3,cex.lab=2,col="red")
  
  # n=1000, posterior is Unif
  # bogus plot again to illustrate how to add to current plot
  # You of course should replace this with the correct formula
  sampleSize_1000=2*sin(pi*x)
  C=pi/2
  f=function(x) {C*sin(pi*x)}
  integrate(f,0,1)
  # add the plot to the previous one
  lines(x, sampleSize_1000,lwd=3,cex.lab=2,col="goldenrod1")

  # add a legend
  legtext = c("n=10", "n=100","n=1000")
  legcolor = c("blue","red","goldenrod1")
  legend('topright',legend = legtext,pch=19,col = legcolor,cex = 0.8,inset = 0.1,pt.cex = 1.2,
         lty = 0,lwd = 2)
}

# Now do the beta priors
{
  # define support for posterior density of p
  x=seq(0,1,.0001)
  
  # put your functions here 
  
  # n=10, posterior is Beta(2,8)

  # fill in and then uncomment
  
  # sampleSize_10=
  # check that you got the constant correct by numerical integration
  # f=function(x) {}
  # integrate(f,0,1)
  
  # # good margins for plot
  # par(mai=c(1,1.25,.5,.5))
  # plot(x,sampleSize_10,type="l",lwd=3,cex.lab=2,xlim=c(0,1),ylim=c(0,35),xlab="p",ylab="Posteriors",main="Beta Priors",col="blue")
  
  # n=100, posterior is Beta(2,8)
 
  # sampleSize_100=
  # # check that you got the constant correct by numerical integration
  # f=function(x) {}
  # integrate(f,0,1)
  # # add the plot to the previous one
  # lines(x, sampleSize_100,lwd=3,cex.lab=2,col="red")
  
  # n=1000, posterior is Beta(2,8)
 
  # sampleSize_1000=
  # # check that you got the constant correct by numerical integration
  # f=function(x) {}
  # integrate(f,0,1)
  # # add the plot to the previous one
  # lines(x, sampleSize_1000,lwd=3,cex.lab=2,col="goldenrod1") 
   
  # # add a legend
  # legtext = c("n=10", "n=100","n=1000")
  # legcolor = c("blue","red","goldenrod1")
  # legend('topright',legend = legtext,pch=19,col = legcolor,cex = 0.8,inset = 0.1,pt.cex = 1.2,
  #        lty = 0,lwd = 2)
}


