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
  real<lower=0,upper=1> chance_in_1_for_dist[J];
  real<lower=0,upper=1> chance_in_1_global;
}

model {
  for (i in 1:J) {
    real prob = chance_in_1_global+chance_in_1_for_dist[i];
    y[i] ~ binomial(n[i], prob);
  }
}

generated quantities {
  real chance_in_1_for_dist_partially_pooled[J];
  real pred_ch_in_5;
  for (i in 1:J) {
    chance_in_1_for_dist_partially_pooled[i] = chance_in_1_for_dist[i] + chance_in_1_global;
  }
  for (i in 1:J) {
    if (distance_of_putt <= x[i]) {
      pred_ch_in_5 = chance_in_1_for_dist_partially_pooled[i];
      break;
    }
  }
}
