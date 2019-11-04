functions {
  real my_binomial_lpmf(int successes, int attempts, real chance_in_1) {
    real return_probability = 0;
    for (i in 1:successes) {
      return_probability += bernoulli_lpmf(1|chance_in_1);
    }
    for (i in 1:attempts-successes) {
      return_probability += bernoulli_lpmf(0|chance_in_1);
    }
    return return_probability;
  }
}

data {
  real distance_of_putt;
}

transformed data {
  int J = 19;
  int x[J] = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int n[J] = {1443,694,455,353,272,256,240,217,200,237,202,192,174,167,201,195,191,147,152};
  int y[J] = {1346,577,337,208,149,136,111,69,67,75,52,46,54,28,27,31,33,20,24};
}

parameters {
  real<lower=0,upper=1> chance_in_1;
}

model {
  for (i in 1:J) {
    y[i] ~ my_binomial(n[i], chance_in_1);
  }
}

generated quantities {
  real pred_ch_in_5 = chance_in_1*5;
}
