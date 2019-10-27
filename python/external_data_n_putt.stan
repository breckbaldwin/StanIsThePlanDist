transformed data {
   int y_sink_putt_count=1;
   int N_putt_attempts=10; 
}



parameters {
   real<lower=0,upper=1> theta;

}

model {
   y_sink_putt_count ~ binomial(N_putt_attempts,theta);
}


