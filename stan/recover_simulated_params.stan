transformed data {
  int simulated_data[100]; 
  for(i in 1:100) {
    simulated_data[i] = bernoulli_rng(.7);
  }
}

parameters {
  real<lower=0,upper=1> coin_bias;
}

model {
  for (i in 1:100) {
    simulated_data[i] ~ bernoulli(coin_bias); //recovers param
    //simulated_data[i] ~ exponential(coin_bias); //fails to recover param

  }
}

