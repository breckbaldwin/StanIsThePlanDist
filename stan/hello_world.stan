//python helloworld.py
//cmdstan

functions {
  void helloWorld() {
    print("Functions{} hello world!");
  }
}

data { //how data gets in as json or Rdata, see calling language or cmdStan doc. No statements
  int count_data;
  real continuous_data;
}

transformed data {
  int tran_count = 1;// variables must be declared in the initial portion of the block!!
  print("transformed data{} hello have access to count_data=",count_data,
	", continuous_data=",continuous_data);
  print("transformed data{} created new variable with value, tran_count=",tran_count);
  helloWorld(); 
} 

parameters {//no statements
  real estimate_me; //
}

transformed parameters {
  real modified_estimate_me = estimate_me/count_data;
  print("transformed parameters {} Hello, modified_estimate_me=",modified_estimate_me);
  print("transformed parameters {} is called once per leapfrog step, as is parameters{}");
} 

model { 
  print("model{} Hello every leap frog step");
  print("model{} initial target()=",target(),
	", exp(target()=",exp(target()),
	", estimate_me=",estimate_me);
  estimate_me ~ normal(count_data,continuous_data);
  print("model{} after increment target()=",target(),
	", exp(target()=",exp(target()),
	", estimate_me=",estimate_me);
}

generated quantities {
  real prediction = estimate_me * 5; //will be accumulated in fit object
  print("generated quantities {} Hello run once per sample");
} 




