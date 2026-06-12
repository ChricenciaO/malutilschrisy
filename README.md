
<!-- README.md is generated from README.Rmd. Please edit that file -->

# malutilschrisy

<!-- badges: start -->

<!-- badges: end -->

malutilschrisy bundles malaria-related utilities and data for
Côte d'Ivoire, including Seasonal Malaria Chemoprevention (SMC) cost
data and tools for comparing implementation scenarios

## Installation

You can install the development version of malutilschrisy like so:

``` r
# install package
devtools::install_github("ChricenciaO/malutilschrisy")
```
## SMC cost data
The package ships with `smc_cost_clean`, a district-by-year table of
SMC operational and SPAQ costs for Côte d'Ivoire, 2025–2028.

## Example
This is a basic example which shows you how to solve a common problem:

``` r
library(malutilschrisy)
head(smc_cost_clean[, c("adm2", "year", "cost_per_cycle",
                        "pop_u5", "total_smc_cost")])
```
## Comparing 4-vs-5 cycle scenarios

`smc_scenario_cost()` compares the cost of running a fifth SMC cycle in
selected districts against the business-as-usual case where every
district runs four cycles. It returns the total cost per year and the
additional cost over baseline.
What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
# districts running a 5th cycle in 2026
five_2026 <- c("FERKESSEDOUGOU", "MADINANI",
               "SINEMATIALI", "KANI", "KORO")

smc_scenario_cost(five_cycle_districts = five_2026)
```
Districts not listed in `five_cycle_districts` stay at four cycles, so
with the default (none listed) every year's `additional_cost` is zero.

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
