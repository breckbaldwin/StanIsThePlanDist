transformed data {
   int number_of_successful_crossings = 5100;
   int number_of_crossing_attempts =10000;
}

parameters {
   real<lower=0,upper=1> safe_to_pass;
}

model {
  number_of_successful_crossings
	  ~ binomial(number_of_crossing_attempts,
		     safe_to_pass);
}

