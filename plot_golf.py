import os
from cmdstanpy import cmdstan_path, CmdStanModel
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import fileinput
import sys
import random

y = np.array([1346,577,337,208,149,136,111,69,67,75,52,46,54,28,27,31,33,20,24]);
n = np.array([1443,694,455,353,272,256,240,217,200,237,202,192,174,167,201,195,191,147,152]);
x = np.array([2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20])

prob_success = y/n

print(prob_success)

plt.plot(x,prob_success,'ro',label='data')
#plt.plot([0,20],[1.0,.1])
plt.plot([0,20],[3.299020/5,3.299020/5],label='one_putt_pred.stan',linewidth=2)
plt.plot([0,20],[2.830320/5,2.830320/5],'g',label='pooled_golf.stan',linewidth=2)

pooled = [0.9321647382499982, 0.8304566470000012, 0.7398225404999997, 0.5887869799999982, 0.5473392177499983, 0.5305160757500005, 0.4632019422499983, 0.3199144677500002, 0.3367742902499998, 0.3183906797500001, 0.26009582424999983, 0.24236800075000023, 0.31257072699999977, 0.17132967820000056, 0.13782417895000032, 0.16238356382500055, 0.1762896904999998, 0.1406740948500001, 0.16254838887499967]

plt.plot(x,pooled,'b',label='pooled_golf.stan',linewidth=2)

partially_pooled = [0.8720894, 0.7714318639999996, 0.6797493029999978, 0.5260424907499996, 0.4792067570000006, 0.4732408367500023, 0.40022079550000056, 0.25635011674999936, 0.2703527077500002, 0.26600222900000037, 0.19303740147499984, 0.18525158362499924, 0.24930244790000075, 0.11411283311249981, 0.07806471217150018, 0.10500755188999951, 0.11606707192250021, 0.0851486265899999, 0.1053433292125004]

plt.plot([1,20],[0.9514488-0.045581,0.9514488+(-0.045581*20)],'y',label='linear_golf.stan',linewidth=2)

mechanistic = [0.9999415482499975, 0.9554946269999995, 0.8195964262499977, 0.6849249862499991, 0.578431015999997, 0.4969834654999987, 0.4340808174999987, 0.3845523707500017, 0.3447638587499993, 0.31220548425000044, 0.28512596600000095, 0.26228046050000103, 0.24276607275000028, 0.22591485049999963, 0.21122352699999944, 0.19830651900000018, 0.18686383499999973, 0.17665888674999924, 0.16750269775000007]

plt.plot(x,mechanistic,'c',label='mechanistic_golf.stan',linewidth=2)

plt.legend()
plt.show()


