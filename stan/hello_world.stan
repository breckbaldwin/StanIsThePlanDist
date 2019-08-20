functions {
  void helloWorld() {
    print("hello world! from a function in the functions block");
  }
}

data { 
  
}

transformed data {
  //int foo = 1;// variables must be declared in the initial portion of the block!!
  print("hello form transformed data");
  
  //int foo = 1;
  //int <lower =1,upper=100> foo = 1;
 
} 
parameters {
   real <lower=0,upper=20> foo;
}

transformed parameters { 
  print("hellow from transformed paramters");
 
} 

model { 
  print("Hello from the model block");
}

generated quantities { 
  print("Hello from the generated quantities block");
} 




