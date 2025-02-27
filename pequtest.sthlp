{smcl}
{* *! version 1.0.0 15oct2023 Hasraddin Guliyev}{...}
{vieweralsosee "[R] regress" "help regress"}{...}
{vieweralsosee "[R] rreg" "help rreg"}{...}
{vieweralsosee "[R] sqreg" "help sqreg"}{...}
{vieweralsosee "[XT] xtreg" "help xtreg"}{...}
{hline}
help for {hi:pequtest}
{hline}

{title:Title}

{p 4 4 2}
{bf:pequtest} — Testing parameter equality across different models in Stata.

{title:Syntax}

{p 4 4 2}
{cmd:pequtest} {depvar} {indepvars} {ifin} , {cmd:m1(}{it:string}{cmd:)} [{cmd:m1ops(}{it:string}{cmd:)}] {cmd:m2(}{it:string}{cmd:)} [{cmd:m2ops(}{it:string}{cmd:)}]

{synoptset 25 tabbed}{...}
{synopthdr:options}
{synoptline}
{syntab:Model}
{synopt:{cmd:m1(}{it:string}{cmd:)}}specifies the first regression model to estimate (e.g., {cmd:regress}). This is a required option.{p_end}
{synopt:{cmd:m1ops(}{it:string}{cmd:)}}specifies additional options for the first model (e.g., {cmd:vce(robust)}).{p_end}
{synopt:{cmd:m2(}{it:string}{cmd:)}}specifies the second regression model to estimate (e.g., {cmd:rreg}). This is a required option.{p_end}
{synopt:{cmd:m2ops(}{it:string}{cmd:)}}specifies additional options for the second model (e.g., {cmd:nolog}).{p_end}
{synoptline}

{title:Description}

{p 4 4 2}
The {cmd:pequtest} command in Stata is a powerful and versatile tool for comparing the coefficients of different regression models. It assesses the robustness and consistency of findings by testing for bias between two models.

{p 4 4 2}
The individual bias test examines each independent variable separately, while the joint bias test evaluates whether all coefficients are jointly equal across the two models. This command is particularly useful in contexts such as:

{p 6 6 2}
- Comparing ordinary least squares (OLS) and robust regression.{p_end}
{p 6 6 2}
- Comparing quantile regression across different percentiles.{p_end}
{p 6 6 2}
- Comparing fixed-effects and random-effects models in panel data analysis.{p_end}

{title:Options}

{synoptset 25 tabbed}{...}
{syntab:Model}
{synopt:{cmd:m1(}{it:string}{cmd:)}}specifies the first regression model to estimate (e.g., {cmd:regress}). This is a required option.{p_end}
{synopt:{cmd:m1ops(}{it:string}{cmd:)}}specifies additional options for the first model (e.g., {cmd:vce(robust)}).{p_end}
{synopt:{cmd:m2(}{it:string}{cmd:)}}specifies the second regression model to estimate (e.g., {cmd:rreg}). This is a required option.{p_end}
{synopt:{cmd:m2ops(}{it:string}{cmd:)}}specifies additional options for the second model (e.g., {cmd:nolog}).{p_end}

{title:Stored Results}

{p 4 4 2}
{cmd:pequtest} stores the following results in {cmd:e()}:

{synoptset 15 tabbed}{...}
{syntab:Matrices}
{synopt:{cmd:e(b1)}}coefficients from the first model.{p_end}
{synopt:{cmd:e(V1)}}variance-covariance matrix from the first model.{p_end}
{synopt:{cmd:e(b2)}}coefficients from the second model.{p_end}
{synopt:{cmd:e(V2)}}variance-covariance matrix from the second model.{p_end}
{synopt:{cmd:e(tstat)}}t-statistics for individual parameter tests.{p_end}
{synopt:{cmd:e(pvalues)}}p-values for individual parameter tests.{p_end}

{syntab:Scalars}
{synopt:{cmd:e(chi2)}}chi-squared statistic for the joint test.{p_end}
{synopt:{cmd:e(df_chi2)}}degrees of freedom for the joint test.{p_end}
{synopt:{cmd:e(p_chi2)}}p-value for the joint test.{p_end}

{title:Examples}

{p 4 4 2}
{bf:Example 1: Crime Dataset} Compare OLS ({cmd:reg}) and robust regression ({cmd:rreg}) results for the crime dataset.

{phang2}{cmd:. use https://stats.idre.ucla.edu/stat/stata/dae/crime, clear}{p_end}
{phang2}{cmd:. pequtest crime pctmetro pcths poverty, m1(reg) m2(rreg) m2ops(nolog)}{p_end}

{p 4 4 2}
{bf:Example 2: Engel1857 Dataset} Compare quantile regression ({cmd:sqreg}) results at the 25th and 75th percentiles for the Engel1857 dataset.

{phang2}{cmd:. webuse engel1857, clear}{p_end}
{phang2}{cmd:. pequtest foodexp income, m1(sqreg) m1ops(q(.25) r(100) nolog) m2(sqreg) m2ops(q(.75) r(100) nolog)}{p_end}

{p 4 4 2}
{bf:Example 3: Grunfeld Dataset} Compare fixed-effects ({cmd:xtreg, fe}) and random-effects ({cmd:xtreg, re}) models for the Grunfeld dataset.

{phang2}{cmd:. webuse grunfeld, clear}{p_end}
{phang2}{cmd:. pequtest invest mvalue kstock, m1(xtreg) m1ops(fe) m2(xtreg) m2ops(re)}{p_end}

{title:Author}

{p 4 4 2}
Hasraddin Guliyev, Azerbaijan State University of Economics, {browse "mailto:hasradding@unec.edu.az":hasradding@unec.edu.az}.

{title:Also See}

{p 4 4 2}
Related: {help regress}, {help rreg}, {help sqreg}, {help xtreg}
