parameters {
	   real <lower=0, upper = 5> chance_in_5;
}

model {
      chance_in_5 ~ uniform(0,5);
}