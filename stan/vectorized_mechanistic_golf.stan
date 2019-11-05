transformed data {
  int J = 19;
  int n[J] = {1443,694,455,353,272,256,240,217,200,237,202,192,174,167,201,195,191,147,152};
  vector[J] x = to_vector([2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]);
  int y[J] = {1346,577,337,208,149,136,111,69,67,75,52,46,54,28,27,31,33,20,24};
  real r = (1.68/2)/12;
  real R = (4.25/2)/12;
  vector[J] threshold_angle = asin((R-r) ./ x);
}
parameters {
  real<lower=0> sigma;
}
model {
  vector[J] p = 2*Phi(threshold_angle / sigma) - 1;
  print(p);
  y ~ binomial(n, p);
}
generated quantities {
  real sigma_degrees = sigma * 180 / pi();
}
