parameters {
  real <lower=-2,upper=10> theta;
}

model {
  theta ~ normal(3,2);
  theta ~ normal(5,2);
  
}
