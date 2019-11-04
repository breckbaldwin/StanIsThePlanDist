import os
from cmdstanpy import cmdstan_path, CmdStanModel
import fileinput
import sys

stan_program = CmdStanModel(stan_file='stan/hello_world.stan')
stan_program.compile()

fit = stan_program.sample(csv_basename='./output',
                          data={'count_data':4,'continuous_data':2.1},
                          sampling_iters=4)

console_output = open('output-1.txt');
print(console_output.read()); 
print(fit.summary()) 


        
