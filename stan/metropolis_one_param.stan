
generated quantities {
  real chance_in_5[250];
  real sigma_step_size = .5;
  real my_target[250];
  chance_in_5[1] = 2.5;
  my_target[1] = log(chance_in_5[1]);
  for (i in 2:250) {
    real proposal = chance_in_5[i-1] + normal_rng(0,sigma_step_size); 
    real chance_in_1;
    real random_value = uniform_rng(0,1);
    my_target[i] = 0;
    proposal = fmax(0.0,proposal);
    proposal = fmin(5.0,proposal);
    chance_in_1 = proposal/5;
    my_target[i] += bernoulli_lpmf(1|chance_in_1);
    if (exp(my_target[i])/
        exp(my_target[i-1]) > random_value) {
       chance_in_5[i] = proposal;
    }
    else {
       chance_in_5[i] = chance_in_5[i-1];
    }
  }
  print("Chance_In_5: ",chance_in_5);
  print("Mean: ", mean(chance_in_5));
}
