# BACE for gretl

**Bayesian Averaging of Classical Estimates (BACE)** is an open-source function package for [gretl](https://gretl.sourceforge.net/), written in **hansl**. It provides model averaging for linear regression and a broad range of discrete, censored, and other limited-dependent-variable models.

BACE combines classical parameter estimation (OLS or maximum likelihood) with approximations to Bayesian model probabilities. This makes it possible to account for **model uncertainty** without having to estimate a separate full Bayesian model for every candidate specification.

**Current release:** 3.2  
**Authors:** Marcin Błażejowski and Jacek Kwiatkowski  
**Official project:** [SourceForge](https://sourceforge.net/projects/bace-for-gretl/)  
**Documentation:** [BACE manual (PDF)](https://gretl.sourceforge.net/current_fnfiles/unzipped/BACE.pdf)

## Supported models

- Linear regression (OLS)
- Binary logit and probit
- Ordered logit and ordered probit
- Multinomial logit
- Poisson regression
- Tobit regression
- Interval regression

## Main features

- **Model uncertainty:** model probabilities, posterior inclusion probabilities (PIPs), and rankings of the most probable specifications.
- **Model-averaged estimates:** coefficient estimates and associated measures of uncertainty across competing models.
- **Efficient model-space exploration:** MC³ (Markov chain Monte Carlo model composition) sampling.
- **Flexible model priors:** binomial, beta-binomial, and custom prior inclusion probabilities.
- **Alternative evidence approximations:** BIC, Haughton's BIC (HBIC), information-matrix-based BIC (IBIC), and extended BIC (EBIC).
- **Jointness analysis:** measures of complementarity and substitutability between explanatory variables, including variants based on Doppelhofer–Weeks, Ley–Steel, Strachan, and Yule's Q.
- **Prediction and visualization:** model-averaged forecasts and plots of model probabilities, variable inclusion, jointness, and other results.
- **Interpretation of nonlinear models:** model-averaged odds ratios and marginal effects where supported.
- **Two interfaces:** a graphical user interface in gretl and a programmable interface for hansl scripts.

## Installation

The easiest method is to install BACE from within gretl:

**File → Function packages → On server**, then select **BACE**.

Alternatively, in the gretl console or a hansl script, run:

```hansl
pkg install BACE
```

After installation, load the package using:

```hansl
include BACE.gfn
```

You can also install a locally downloaded package archive:

```hansl
pkg install /path/to/BACE.zip --local
```

The package works with gretl on GNU/Linux, macOS, and Windows. Consult the manual for model-specific requirements and optional dependencies.

## Quick start

The following hansl example uses the **NELS** dataset distributed with the package and performs model averaging for an ordered probit specification:

```hansl
include BACE.gfn
open nels.gdt --frompkg=BACE --quiet

set seed 1000000
list X = 2..14

# Estimate an ordered probit BACE model with jointness analysis
bundle res = BACE(psechoice, X, _(model_type="probit", do_joint="myq"))

# Print and plot the results
BACE_Print(&res)
BACE_Plot(&res)
```

The `BACE()` function returns a gretl bundle, allowing results to be saved, inspected, printed, or plotted later. The `model_type="probit"` setting selects probit estimation; gretl distinguishes binary and ordered responses according to the dependent variable.

## Public functions

| Function | Purpose |
| --- | --- |
| `BACE()` | Runs model averaging and returns a results bundle. |
| `BACE_GUI()` | Provides the graphical interface to the package. |
| `BACE_Print()` | Prints estimates and summary results from a BACE bundle. |
| `BACE_Plot()` | Generates graphs from a BACE bundle. |

For the full list of options, including model priors, MC³ controls, forecasts, graphics, and jointness measures, see the [BACE manual](https://gretl.sourceforge.net/current_fnfiles/unzipped/BACE.pdf).

## Source code and documentation

This repository includes the package sources and supporting materials:

- `src/` — hansl source files
- `doc/` — documentation sources and related material
- `examples/` — example scripts and data
- `BACE.gfn` — gretl function package
- `BACE.zip` — installable package archive
- `BACE.spec`, `BACE.xml`, `Makefile` — package and build metadata
- `LICENSE` — license text

Additional resources:

- [Official SourceForge project](https://sourceforge.net/projects/bace-for-gretl/)
- [SVN source repository](https://sourceforge.net/p/bace-for-gretl/code/)
- [BACE package documentation (PDF)](https://gretl.sourceforge.net/current_fnfiles/unzipped/BACE.pdf)
- [SourceForge issue tracker](https://sourceforge.net/p/bace-for-gretl/tickets/)

## Reference

If you use BACE in academic work, please cite:

> Błażejowski, M., & Kwiatkowski, J. (2026). *BACE: A gretl Package for Model Averaging in Bounded Dependent Variable Models*. **Journal of Statistical Software, 117**(4). https://doi.org/10.18637/jss.v117.i04

```bibtex
@article{BlazejowskiKwiatkowski2026,
  author  = {Błażejowski, Marcin and Kwiatkowski, Jacek},
  title   = {BACE: A gretl Package for Model Averaging in Bounded Dependent Variable Models},
  journal = {Journal of Statistical Software},
  year    = {2026},
  volume  = {117},
  number  = {4},
  doi     = {10.18637/jss.v117.i04}
}
```

## License

BACE is distributed under the **GNU General Public License, version 3 (GPLv3)**. See [LICENSE](LICENSE) for the license text.

## Repository status

**SourceForge SVN is the authoritative development repository.** This GitHub repository is a manually updated mirror intended to make the source code and its history easier to discover and browse. Please report issues through the [SourceForge tracker](https://sourceforge.net/p/bace-for-gretl/tickets/).
