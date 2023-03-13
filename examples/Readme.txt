Example scripts (together with datasets as *.gdt
files and results as *.txt files):

1. BACE_sample.inp - simple example which consists
of NELS dataset used in:
R. Carter Hill, William E. Griffiths, Guay C. Lim (2017),
"Principles of Econometrics", Wiley, 5 edition.
This dataset concerns longitudinal study on eight-grade
students in USA and - thanks to Lee Adkins' work - is
available at: http://www.learneconometrics.com/gretl/index.html.
In this example we assume ordered probit and logit analysis
for psechoice variable with default values of BACE parameters.

2. FLS_41t72.inp - replication of classical paper by
Carmen Fernández, Eduardo Ley, Mark J.F. Steel (2001),
"Model Uncertainty in Cross-Country Growth Regressions",
Journal of Applied Econometrics, Vol. 16, No. 5, pp. 563-576
(original data and results can be found at:
http://qed.econ.queensu.ca/jae/2001-v16.5/fernandez-ley-steel).

We run BMA analysis with the following non-default parameters:
  a. number of Monte Carlo draws: 3000000
  b. percentage of burn-in draws: 33
  c. number of top-ranked models: 20
  d. jointness analysis as modified Yule's Q measure

Note: on machine with 4 Intel(R) Core(TM) i7-8550U CPU @1.80GHz
and 16 GB RAM execution takes +/- 138 sec.

3. UK_Inflation_1875-1991.inp - example which replicates
results published in: Marcin Błażejowski, Paweł Kufel,
Jacek Kwiatkowski (2020), "Model simplification and variable
selection: A replication of the UK inflation model by Hendry
(2001). Journal of Applied Econometrics 35: 645–652.

4. UKM1.inp - UK M1 model by David F. Hendry in the version
published in Krolzig, Hans-Martin, David F. Hendry (2001),
"Computer automation of general-to-specific model selection
procedures", Journal of Economic Dynamics and Control 25.
This example closely replicates results published in
Błażejowski, Marcin, Jacek Kwiatkowski, Paweł Kufel (2020),
"BACE and BMA Variable Selection and Forecasting for
UK Money Demand and Inflation with Gretl" Econometrics 8, 2(21),
DOI: 10.3390/econometrics8020021.

5. interval.inp - interval regression based on Verbeek's
"willingness to pay" example.

6. tobit.inp - tobit regression example for measure of academic
aptitude based on example available at:
https://stats.oarc.ucla.edu/r/dae/tobit-models/
