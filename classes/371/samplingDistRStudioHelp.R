# Chi-squared quantiles and probabilities

#  General syntax
# 
#  To generate the table in our book use
#      qchisq(p, df, lower.tail = F)
#  p is the probability (the area in the right tail)
#  df is the degrees of freedom
#  lower.tail = F means give the upper or right tail
qchisq(.025, 2, lower.tail = F)

#  To find the probabiliies under the chi-squared, use
#      pchisq(q, df, lower.tail = F)
#  q is the value of x
#  df, lower.tail as above
#  Eg. the command below computes P (Y >= .050636) for a
#      Chi-squared random variable with 2 degrees of freedom
pchisq(.050636, 2, lower.tail = F)


# t-distribution quantiles and probabilities
#    pt(q, df, lower.tail = FALSE)
#    qt(p, df, lower.tail = FALSE)

# same syntax as above
# Check with Table in book
pt(2.528, 20, ncp=0, lower.tail = FALSE)
qt(.01, 20, ncp=0, lower.tail = FALSE)


# F-distribution
#   pf(q, df1, df2, lower.tail = F)
#   qf(p, df1, df2, lower.tail = F)
# same syntax as above, df1 = denominator degrees of freedom, df2 = numerator df
pf(24224,10,1, lower.tail=F)
qf(.005,10,1, lower.tail=F)

