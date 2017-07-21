\\ Do NOT forget braces if you intend to write a script.
{

    \\ ploth(x=2,1000,primepi(x));
  
  plot(x=2,1000,primepi(x));

  plot(x=2,100,log(x));

  print(2+2);

  \\ This is a one line comment.
  /* This is a multi-line comment.
     Line 2                         */

   /* Using log files  */
   default(log,1);  \\ turn logfile on
   print(5*5);
   print(Is five a prime? ,isprime(5));
   for(x=2,10,print(x));
   default(log,0);  \\ turn logfile off

  }

  
