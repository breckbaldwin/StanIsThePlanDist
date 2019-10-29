generated quantities {
  real bernoulli_draw;
  for(i in 1 to 1000) {
    bernoulli_draw = bernoulli_rng(1);
  }

}
