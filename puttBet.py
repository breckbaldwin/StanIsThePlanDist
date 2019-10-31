import os
from cmdstanpy import cmdstan_path, CmdStanModel
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import fileinput
import sys

stan_program_path = sys.argv[1]
distance_of_putt = float(sys.argv[2])

stan_program = CmdStanModel(stan_file=stan_program_path)
stan_program.compile()

fit = stan_program.sample(data= {"distance_of_putt":distance_of_putt}, csv_basename='./puttbet')
console_output = open('puttbet-1.txt');
print(console_output.read());
#fit.get_drawset(params=[parameter_to_show]).hist(bins=50)
fit.get_drawset(params=['prob_putt_sinks']).hist(bins=50,range=(0,1))
plt.show()
        
