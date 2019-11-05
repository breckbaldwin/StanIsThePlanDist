data {
   real distance_of_putt;
}

parameters {
  real<lower=0, upper=1> chance_in_1; 
}

model {
  chance_in_1 ~ uniform(0,.5);
  1 ~ bernoulli(chance_in_1);
}

generated quantities {
  real pred_ch_in_5 = chance_in_1 * 5;
}
