import os
from cmdstanpy import cmdstan_path, CmdStanModel
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import fileinput
import sys

putt_model_path = 'external_data_n_putt.stan'
putt_model = CmdStanModel(stan_file=putt_model_path)
putt_model.compile()

putt_attempts = 1 # int(sys.argv[1])
sink_putt_count = 10 #int(sys.argv[2])


print("putt_attemtps:",putt_attempts,"sink_putt_count:",sink_putt_count) 
binomial_data = { "N_putt_attempts" : putt_attempts, "y_sink_putt_count" : sink_putt_count }  
bern_fit = putt_model.sample(data=binomial_data, csv_basename='./putt')
bern_fit.get_drawset(params=['theta']).hist(bins=100)
plt.show()
