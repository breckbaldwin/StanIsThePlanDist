//python helloworld.py stan/hello_world.stan
//cmdstan

functions {
  void helloWorld() {
    print("Functions{} hello world! from a function in the functions block");
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
  print("transformed data{} data/transformed data is evaluated once");
  helloWorld();
} 

parameters {//no statements
  real <lower=0,upper=20> estimate_me; //<lower=,upper=> not required
}

transformed parameters {
  real modified_estimate_me = estimate_me/count_data;
  print("transformed parameters {} Hello from transformed parameters, modified_estimate_me=",modified_estimate_me);
  print("transformed parameters {} is called once per leapfrog step, as is paramaters{}");
} 

model { 
  print("model{} Hello from the model block every leap frog step");
  estimate_me ~ normal(count_data,continuous_data);
}

generated quantities {
  real prediction = estimate_me * 5; //will be accumulated in fit object
  print("generated quantities {} Hello run once per sample");
} 




