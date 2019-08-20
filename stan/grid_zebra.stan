transformed data {
	      int attempts= 10;
     	      int successes=5;
	      print("attempts",attempts,"successes",successes);
}

generated quantities {
	  real total = 0.0;
	  for (value in {.1,.2,.3,.4,.5,.6,.7,.8,.9,1}) {
	      real probability_at_value
	      	   = exp(binomial_lpmf(successes|attempts,value));
	      total += probability_at_value;
	  }
	  for (value in {.1,.2,.3,.4,.5,.6,.7,.8,.9,1}) {
	      real probability_at_value = exp(binomial_lpmf(successes|attempts,value));
	      print("grid value: ",value,
	      	    " probability_at_value: ", probability_at_value/total);
	      
	      }
	  
}