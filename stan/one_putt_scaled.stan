parameters {
	   real<lower=-1.0, upper = 5.0> chance_in_5;
}

model {
      chance_in_5 ~ uniform(0,5);
      1 ~ bernoulli(chance_in_5);
      //target += normal_lpdf(1|0, chance_in_5);
}
