data {
   real distance_of_putt;
}

parameters {
   real<lower=0, upper=5> chance_in_5;
}

transformed parameters {
   real chance_in_1 = chance_in_5/5;
}
model {
 
  //chance_in_1 ~ uniform(0,1);
  //  1 ~ bernoulli(chance_in_1);
  
  target += uniform_lpdf(chance_in_1|0,1);
  target += bernoulli_lpmf(1|chance_in_1);
}
