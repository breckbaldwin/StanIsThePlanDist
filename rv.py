import os
from cmdstanpy import cmdstan_path, CmdStanModel
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import fileinput
import sys

parameter_to_show = "";
stan_program_path = sys.argv[1]
if len(sys.argv) > 2:
    parameter_to_show = sys.argv[2]

print("Running Stan program",stan_program_path)
print("Histogram of", parameter_to_show);

stan_program = CmdStanModel(stan_file=stan_program_path)
stan_program.compile()

#runs transformed data{}
#fit = stan_program.sample(csv_basename='./output',fixed_param=True,sampling_iters=0)

fit = stan_program.sample(csv_basename='./output')

console_output = open('output-1.txt');
print(console_output.read()); #good for catching errors and print statements in Stan prog

print(fit.summary()) #summary stats for fit
#print(fit.diagnose()) #look for problems

bin_count = 10
if len(parameter_to_show)>0 :  # plot parameter if specified
        fit.get_drawset(params=[parameter_to_show]).hist(bins=bin_count)
        plt.show()
        
