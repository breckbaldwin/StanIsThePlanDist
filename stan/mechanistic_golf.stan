data {
  real distance_of_putt;
}

transformed data {
  int J = 19;
  int x_distance[J] = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int y_successes[J] = {1346,577,337,208,149,136,111,69,67,75,52,46,54,28,27,31,33,20,24};
  int n_attempts[J] = {1443,694,455,353,272,256,240,217,200,237,202,192,174,167,201,195,191,147,152};
  real r = (1.68/2)/12;
  real R = (4.25/2)/12;
  real threshold_angle[J];
  for (i in 1:J) {
    threshold_angle[i] = asin((R-r)/x_distance[i]);
  }
}

parameters {
  real<lower=0> sigma_error_in_radians;
}

model {
  for (i in 1:J) {
    //real prob = abs(threshold_angle[i]/sigma_error_in_radians)/2;
    real prob = 2*Phi(threshold_angle[i]/sigma_error_in_radians) - 1;
    //print("i=",i," n[i]=",n[i]," y[i]=",y[i]," x[i]",x[i]," threshold_angle=",threshold_angle[i]," prob=",prob);
    y_successes[i] ~ binomial(n_attempts[i], prob);
  }
}

generated quantities {
  real sigma_error_in_degrees = (180/pi())*sigma_error_in_radians;
  real pred_ch_in_5;
  //real chance_in_1_for_dist[J];
  real threshold_angle_for_distance = asin((R-r)/distance_of_putt);
  //pred_ch_in_5 = abs(threshold_angle_for_distance/sigma_error_in_radians)/2 * 5;
    pred_ch_in_5 = (2*Phi(threshold_angle_for_distance/sigma_error_in_radians) - 1) * 5;
  
  //for (i in 1:J) { 
  // threshold_angle_for_distance = asin((R-r)/i);
  //  chance_in_1_for_dist[i] = (2*Phi(threshold_angle_for_distance/sigma) - 1);
  //}
}
