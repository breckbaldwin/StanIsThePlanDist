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

json_data = data= {"distance_of_putt":distance_of_putt}

fit = stan_program.sample(data=json_data,
                          csv_basename='./puttbet')

fit.get_drawset(params=['prob_putt_sinks']).hist(bins=50,
                                                 range=(0,1))
plt.show()
        
