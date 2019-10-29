parameters {
  real chance_in_5;
  //real <lower=0,upper=5> chance_in_5;      
}

model {
  //chance_in_5 ~ uniform(0,1);
  real prob_of_param;
  print("chance_in_5=",chance_in_5);
  print("start: target()=",target())
  print("   exp(target())=",exp(target()));

  //  prob_of_param = uniform_lpdf(chance_in_5|0,1);
  prob_of_param = uniform_lpdf(chance_in_5/5|0,1);
  print("uniform_lpdf(chance_in_5|0,1)=",prob_of_param);
  print("exp(uniform_lpdf(chance_in_5|0,1))=",exp(prob_of_param));

  target += prob_of_param;
  print("end: target()=",target());
  print(" exp(target())=",exp(target()));
}
