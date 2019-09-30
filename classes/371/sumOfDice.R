# sumOfDice.R

sampleSize<-100
numberDice=10

sumOfDice=rep(0,sampleSize)

str=sprintf("Generating %d samples of the experiment   `Find the sum of %d dice'  ",sampleSize,numberDice)
print(str)

for (ii in 1:sampleSize){
  sumOfDice[ii]=sum(floor(runif(numberDice,1,7)))
  #print(sumOfDice[ii])
}
if (sampleSize<1000){
  print(sumOfDice)
}

hist(sumOfDice,prob=T)