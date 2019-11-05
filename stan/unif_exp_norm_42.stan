parameters {
  real<lower=0,upper=100> config_param_1;
  real<lower=0,upper=100> config_param_2;
}

model {
  42 ~ uniform(config_param_1,config_param_2);
}
