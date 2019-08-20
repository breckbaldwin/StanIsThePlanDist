transformed data {
	      int attempts= 10;
     	      int successes=5;
	      print("attempts",attempts,"successes",successes);
}

generated quantities {
	  int num_samples = 500;
	  real samples[500];
	  real sigma_step_size = .1;
	  samples[1] = .5;
	  for (i in 2:500) {
     	    real proposal = samples[i-1]
	    	 	    + normal_rng(0,sigma_step_size); # Proposal value
	    real random_value = uniform_rng(0,1);         
	    proposal = fmax(0.0,proposal);
	    proposal = fmin(1.0,proposal);

     if (exp(binomial_lpmf(successes|attempts,proposal))/
     	 exp(binomial_lpmf(successes|attempts,samples[i-1])) > random_value) {
	 samples[i] = proposal;
	 }
     else {
     	 samples[i] = samples[i-1];
     }
     }
     print("Samples: ",samples);
     print("Mean: ", mean(samples));
     print("Standard deviation: ", sd(samples));
     print("Variance : ", variance(samples));
	   
}

//home work, round to grid.