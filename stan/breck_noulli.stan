functions {
  real breck_noulli_lpmf(int zero_or_one, real param_to_return_prob_of) {    
    if (zero_or_one == 1) {
      return log(param_to_return_prob_of);
    }
    return log(1.0-param_to_return_prob_of);
  }
}

parameters {
  real<lower=0,upper=1> theta;
}

model {
  1 ~ breck_noulli(theta);
}
