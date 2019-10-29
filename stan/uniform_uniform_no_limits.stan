parameters {
	   real chance_in_5;
}

model {
    print("start target()=",target());
    print("chance_in_5=", chance_in_5, " log(chance_in_5)=", log(chance_in_5));
    //chance_in_5 ~ uniform(0,5);
    print("uniform_lpdf(chance_in_5|0,5)=",uniform_lpdf(chance_in_5|0,5));
    target += uniform_lpdf(chance_in_5|0,5);
  print("end target()=",target(), " end exp(target())=", exp(target()));
}
