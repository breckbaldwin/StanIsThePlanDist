import os
from cmdstanpy import cmdstan_path, CmdStanModel
import fileinput
import sys

stan_program = CmdStanModel(stan_file='stan/metropolis_one_param.stan')
stan_program.compile()
#stan_program.generate_quantities()
#runs transformed data{}
fit = stan_program.sample(csv_basename='./output',fixed_param=True,chains=1,sampling_iters=1)

#fit = stan_program.sample(csv_basename='./output')

console_output = open('output-1.txt');
print(console_output.read()); #good for catching errors and print statements in Stan prog        
