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
shrinkage = float(sys.argv[3])
data_size = int(sys.argv[4])

stan_program = CmdStanModel(stan_file=stan_program_path)
stan_program.compile()

json_data = data= {"distance_of_putt":distance_of_putt,"shrinkage":shrinkage,"data_size":data_size}

fit = stan_program.sample(data=json_data,
                          csv_basename='./puttbet')
print(fit.summary())
fit.get_drawset(params=['chance_in_5']).hist(bins=50,range=(0,5))

plt.show()
        
