import os
from cmdstanpy import cmdstan_path, CmdStanModel
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import fileinput
import sys

parameter_to_show = ""
visualization_to_show= 'hist'
stan_program_path = sys.argv[1]
if len(sys.argv) > 2:
    parameter_to_show = sys.argv[2]
if len(sys.argv) > 3:
    visualization_to_show = sys.argv[3]

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

if parameter_to_show == '' :
    sys.exit()

if  visualization_to_show == 'cat' :
    draws = fit.get_drawset([parameter_to_show])
    list_draws = draws[parameter_to_show].values.tolist()
    fig, ax = plt.subplots()
    color = ['c','b','y','g']
    ends = [1000,2000,3000,4000]
    start = 0
    for i in range(4) :
        x = list_draws[start:ends[i]]
        y = range(1000)
        ax.plot(x,y,color[i])
        start = ends[i]
    plt.show()

bin_count = 50
if visualization_to_show == 'hist' :  # plot parameter if specified
        fit.get_drawset(params=[parameter_to_show]).hist(bins=bin_count,range=(0,5))
        plt.show()
        
