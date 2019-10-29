parameters {
	   real chance_in_5;
}

model {
  real prob_of_param;
  real chance_in_1 = chance_in_5/5;
  print("chance_in_5=",chance_in_5);
  print("chance_in_1=",chance_in_1);

  print("start: target()=",target());
  print("   exp(target())=",exp(target()));
  
  //chance_in_1 ~ uniform(0,1);
  //  1 ~ bernoulli(chance_in_1);

  prob_of_param = uniform_lpdf(chance_in_1|0,1);
  print("uniform_lpdf(chance_in_1|0,1)=",prob_of_param);
  print("exp(uniform_lpdf(chance_in_1|0,1))=",exp(prob_of_param));
  
  target += prob_of_param;

  
  prob_of_param = bernoulli_lpmf(1|chance_in_1);
  print("bernoulli_lpmf(1|chance_in_1))=",prob_of_param);
  print("exp(bernoulli_lpmf(1|chance_in_1))=",exp(prob_of_param));
  target += prob_of_param;
  print("end: target()=",target());
  print(" exp(target())=",exp(target()));
}


