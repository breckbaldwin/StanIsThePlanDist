transformed data {
   for (i in 0:20) {
       real chance_in_5_candidate  = i/5.0;
       print("exp(bernoulli_lpmf(1|",chance_in_5_candidate,"))=",
	  exp(bernoulli_lpmf(1|chance_in_5_candidate)));
       print("exp(bernoulli_lpmf(0|",chance_in_5_candidate,"))=",
		exp(bernoulli_lpmf(0|chance_in_5_candidate)));
   }
}
