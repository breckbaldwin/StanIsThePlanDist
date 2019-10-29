transformed data {
   //real generated_uniform = uniform_rng(0,1);
   for (i in 1:100) {
       print(i,uniform_rng(0,1));
   }
}

parameters {
	   real <lower=0, upper = 5> chance_in_5;
}

model {
      chance_in_5 ~ uniform(0,2);
}