\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BACE}
\DeclareOption*{
	\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[a4paper,11pt,twoside]{article}
\RequirePackage[]{graphicx}
\RequirePackage[utf8]{inputenc}
\RequirePackage{enumitem}
\RequirePackage{pifont}
\RequirePackage{url}
\RequirePackage[pdftex]{color}
\RequirePackage{amsmath,amssymb,amsfonts,textcomp}
\RequirePackage{listings}
\RequirePackage{color,ae,fancyvrb}

\usepackage{gretlwp}

\usepackage[colorlinks]{hyperref}
\hypersetup{citecolor=blue}
\usepackage[authoryear]{natbib}

\newcommand{\proglang}[1]{\texttt{#1}}
\newcommand{\pkg}[1]{{\fontseries{b}\selectfont #1}}
% \newcommand{\code}{\bgroup\@makeother\_\@makeother\~\@makeother\$\@codex}
\newcommand{\E}{\mathsf{E}}
\newcommand{\VAR}{\mathsf{VAR}}
\newcommand{\COV}{\mathsf{COV}}
\newcommand{\Prob}{\mathsf{P}}
\newcommand{\Code}[1]{\texttt{#1}}
\newcommand{\MCcube}{MC$^3$}

\newenvironment{CodeChunk}{}{}

% \DefineVerbatimEnvironment{Code}{Verbatim}{}
\DefineVerbatimEnvironment{CodeInput}{Verbatim}{fontshape=sl,fontsize=\small}
\DefineVerbatimEnvironment{CodeOutput}{Verbatim}{}

\author{Marcin Błażejowski\\
	{\small WSB University in Torun}\\
	{\small \url{marcin.blazejowski@wsb.torun.pl}}\\\\
	Jacek Kwiatkowski\\ 
	{\small Nicolaus Copernicus University in Toru\'{n}}\\
	{\small \url{jkwiat@umk.pl}}}
\title{Bayesian Averaging of Classical Estimates (BACE) for \pkg{gretl}}
\prognum{6}

\date{August 25, 2018}

% Hansl syntax highlight
\lstdefinelanguage{Hansl}{
	morekeywords={add, adf, anova, append, ar, ar1, arbond, arch, arima, biprobit, boxplot, break,
		catch, chow, clear, coeffsum, coint, coint2, corr, corrgm, cusum, data, dataset, debug,
		delete, diff, difftest, discrete, dpanel, dummify, duration,  elif, else, end, endif, endloop,
		eqnprint, equation, estimate, fcast, foreign, fractint, freq, function, garch, genr, gmm, gnuplot,
		graphpg, hausman, heckit, help, hsk, hurst, if, include, info, intreg, join, kalman, kpss, labels,
		lad, lags, ldiff, leverage, levinlin, logistic, logit, logs, loop, mahal, makepkg, markers,
		meantest, mle, modeltab, modprint, modtest, mpols, negbin, nls, normtest, nulldata, ols,
		omit, open, orthdev, outfile, panel, pca, pergm, poisson, print, printf, probit, pvalue,
		qlrtest, qqplot, quantreg, quit, rename, reset, restrict, rmplot, run, runs, scatters,
		sdiff, set, setinfo, setobs, setmiss, shell, smpl, spearman, sprintf, square, sscanf, store,
		summary, system, tabprint, textplot, tobit, tsls, var, varlist, vartest, vecm, vif,
		wls, xcorrgm, xtab, mpi, gibbs, return, params},  
	morekeywords=[2]{abs, acos, acosh, aggregate, argname, asin, asinh, atan, atanh, bessel,
		BFGSmax, bkfilt, boxcox, bwfilt, cdemean, cdf, cdiv, ceil, cholesky, chowlin,
		cmult, cnorm, colname, colnames, cols, cos, cosh, cov,
		critical, cum, deseas, det, diag, diagcat, digamma, dnorm, dsort,
		eigengen, eigensym, eigsolve, epochday, errmsg, exp, fcstats, fdjac, fft,
		ffti, filter, firstobs, floor, fracdiff, gammafun, getenv, ghk, gini, ginv,
		halton, hdprod, hpfilt, I, imaxc, imaxr, imhof, iminc, iminr, inbundle,
		infnorm, inlist, int(, inv, invcdf, invmills, invpd, irf, irr, isconst,
		isnan, isnull, kdensity, kfilter, ksimul, ksmooth, kurtosis, lastobs, ldet,
		lincomb, ljungbox, lngamma, log, log10, log2, loess, lower,
		lrvar, max, maxc, maxr, mcorr, mcov, mcovg, mean, meanc, meanr,
		median, mexp, min, minc, minr, missing, misszero, mlag, mnormal, mols,
		monthlen, movavg, mrandgen, mread, mreverse, mrls, mshape, msortby, muniform,
		mwrite, mxtab, nadarwat, nelem, ngetenv, nobs, normal, npv, NRmax, nullspace,
		obs, obslabel, obsnum, ok, onenorm, ones, pdf, pmax,
		pmean, pmin, pnobs, polroots, polyfit, princomp, psd, psdroot, pshrink,
		pxsum, qform, qnorm, qrdecomp, quadtable, quantile, randgen, randgen1, randint, rank,
		ranking, rcond, readfile, remove, replace, resample, round, rownames, rows, sd,
		sdc, selifc, selifr, seq, simann, sin, sinh, skewness, sort,
		sortby, sqrt, sst, strlen, strncmp, strsplit, strstr, strstrip, strsub,
		sum, sumall, sumc, sumr, svd, tan, tanh, toepsolv, tolower, tr,
		transp, trimr, typestr, uniform, uniq, unvech, upper, urcpval, values,
		varname, varnum, varsimul, vec, vech, weekday, wmean, wsd, wvar, xmax,
		xmin, xpx, zeromiss, zeros, bwrite, bread, mpibcast, mpireduce, array, defbundle,
		mat2list, strftime, _},
	morekeywords=[3]{bool, int, list, matrix, scalar, series, string, bundle, void, bundles, null},
	morekeywords=[4]{\$nobs, \$stopwatch, \$sysinfo, \$now},
	%   alsoletter={-},
	sensitive=false,  
	morecomment=[l]{\#},
	morecomment=[l][\color{hanslgreen}]{--},
	morecomment=[s]{/*}{*/},
	morestring=[b]"
}
\lstdefinestyle{hansl}{
	belowcaptionskip=1\baselineskip,
	breaklines=true,
	frame=L,
	xleftmargin=\parindent,
	language=Hansl,
	showstringspaces=false,
	basicstyle={\footnotesize\ttfamily},
	keywordstyle={\bfseries\color{hanslred}},
	keywordstyle=[2]{\color{hanslteal}},
	keywordstyle=[3]{\bfseries\color{hanslgreen}},
	keywordstyle=[4]{\bfseries\color{hanslgreen}},
	commentstyle={\color{hanslblue}},
	stringstyle={\color{hanslmagenta}}
}
\lstset{escapechar=@,style=hansl}
% Definicja kolorów
% \definecolor{hanslgreen}{cmyk}{.67,0,.37,.45}
\definecolor{hanslgreen}{cmyk}{.87,0,.91,.45}
\definecolor{hanslred}{cmyk}{0,.75,.75,.35}
\definecolor{hanslblue}{cmyk}{1,1,0,0} % {rgb}{0,0,1}
\definecolor{hanslteal}{cmyk}{1,0,.45,0} %{.01,0,.45,1}
\definecolor{hanslmagenta}{cmyk}{0,.96,0,0}
\definecolor{hanslblack}{cmyk}{0,0,0,1}