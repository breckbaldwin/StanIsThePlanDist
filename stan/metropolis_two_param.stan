data {
   
}

transformed data {
	      int attempts= 10;
     	      int successes=8;
	      int num_samples=500;
	      print("attempts",attempts,"successes",successes);
}

generated quantities {
	  real samples[num_samples];
	  real samples2[num_samples];
	  real sigma_step_size = .1;
	  real my_target[num_samples];
	  real accept_count = 0;
	  samples[1] = .5;
	  samples2[1] =.5;
	  my_target[1] = log(samples[1]) + log(samples2[1]);
	  for (i in 2:500) {
     	    real proposal = samples[i-1] + normal_rng(0,sigma_step_size); # Proposal value
	    real proposal2 = samples2[i-1] + normal_rng(0,sigma_step_size); # Proposal value
	    real random_value = uniform_rng(0,1);
	    
	    proposal = fmax(0.0,proposal);
	    proposal = fmin(1.0,proposal);
	    
	    proposal2 = fmax(0.0,proposal);
	    proposal2 = fmin(1.0,proposal);
	    
	    my_target[i] = binomial_lpmf(successes|attempts,proposal)
	    		 + binomial_lpmf(successes|attempts,proposal2)
			 ;
     	    if (exp(my_target[i])/
     	        exp(my_target[i-1]) > random_value) {
	       samples[i] = proposal;
	       samples2[i] = proposal2;
	       accept_count += 1;
	    }
            else {
     	        samples[i] = samples[i-1];
	        samples2[i] = samples2[i-1];
     	    }
	}
     //print("Samples: ",samples);
     //print("Samples2: ",samples2);
     print("Accept count: ",accept_count," out of 500");
     print("Mean: ", mean(samples));
     print("Standard deviation: ", sd(samples));
     print("Variance : ", variance(samples));
     print("Mean2: ", mean(samples2));
     print("Standard deviation2: ", sd(samples2));
     print("Variance2 : ", variance(samples2));
     print("Mean target: ", mean(my_target));
     print("Standard deviation target: ", sd(my_target));
     print("Variance target: ", variance(my_target));
	   
}