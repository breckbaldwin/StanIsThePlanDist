functions {

  int real_to_int(real x) {
    int return_int = 0;
    while (return_int < x) {
      return_int = return_int + 1;
    }
    return return_int;
  }
  
}

data {
  real distance_of_putt;
  real shrinkage;
  int data_size;
}

transformed data {

  int J = 19;
  int n[J] = {1443,694,455,353,272,256,240,217,200,237,202,192,174,167,201,195,191,147,152};
  int x[J] = {2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
  int y[J] = {1346,577,337,208,149,136,111,69,67,75,52,46,54,28,27,31,33,20,24};
  real r = (1.68/2)/12;
  real R = (4.25/2)/12;
  real threshold_angle[J];
  for (i in 1:J) {
    threshold_angle[i] = asin((R-r)/x[i]);
  }
  for (i in 1:J) {
    y[i] = real_to_int(y[i] * shrinkage);
    n[i] = real_to_int(n[i] * shrinkage);
  }
  print("y=",y);
  print("n=",n);
}

parameters {
  real<lower=0> sigma;
}

model {
  for (i in 1:data_size) {
    real prob = 2*Phi(threshold_angle[i]/sigma) - 1;
    //print("i=",i," n[i]=",n[i]," y[i]=",y[i]," x[i]",x[i]," threshold_angle=",threshold_angle[i]," prob=",prob);
    y[i] ~ binomial(n[i], prob);
  }
}

generated quantities {
  real sigma_degrees;
  real chance_in_5;
  real chance_in_1_for_dist;
  real threshold_angle_for_distance = asin((R-r)/distance_of_putt);
  sigma_degrees = (180/pi())*sigma;
  chance_in_5 = (2*Phi(threshold_angle_for_distance/sigma) - 1) * 5;
  for (i in 1:J) {
    threshold_angle_for_distance = asin((R-r)/i);
    chance_in_1_for_dist = (2*Phi(threshold_angle_for_distance/sigma) - 1);
  }
}
