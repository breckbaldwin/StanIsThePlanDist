parameters {
	   real <lower=0, upper = 5> chance_in_5;
}

transformed parameters {
  real chance_in_1 = chance_in_5/5;
}

model {
  chance_in_1 ~ uniform(0,1);
  //target += uniform_lpdf(chance_in_1|0,1);
}
