data {
  real distance_of_putt;
}

transformed data {
  int J = 19;
  int n_attempts[J] = {1443,694,455,353,272,256,240,217,200,237,202,192,174,167,201,195,191,147,152};
  int x_distance[J] = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int y_successes[J] = {1346,577,337,208,149,136,111,69,67,75,52,46,54,28,27,31,33,20,24};
}

parameters {
  real a_intercept;
  real b_slope;
}

model {
  for (i in 1:J) {
      real prob =  a_intercept + b_slope*x_distance[i];
      y_successes[i] ~ binomial_logit(n_attempts[i],prob);
    }
}

generated quantities {
  real prob_putt_sinks;
  prob_putt_sinks = 1/(1 + exp(- (a_intercept +  b_slope * distance_of_putt)));
}
