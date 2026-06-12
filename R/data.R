#' SMC cost data for Côte d'Ivoire, 2025–2028
#'
#' Complete operational and SPAQ cost data by district and year.
#'
#' @format A data frame with one row per district-year:
#' \describe{
#'   \item{adm1}{Region (admin level 1) name}
#'   \item{adm2}{District (admin level 2) name}
#'   \item{fixed_cost}{Fixed operational cost for the district}
#'   \item{fixed_cost_pp}{Fixed cost per child under 5}
#'   \item{four_cycle_cost}{Operational cost for all four cycles}
#'   \item{cost_per_cycle}{Operational cost of a single cycle}
#'   \item{cost_per_cycle_pp}{Cost per cycle per child under 5}
#'   \item{total_operations}{Total operational cost}
#'   \item{total_operations_pp}{Total operational cost per child under 5}
#'   \item{spaq_doses}{SPAQ doses needed (children per district x 4)}
#'   \item{spaq_cost}{Cost of SPAQ doses}
#'   \item{total_smc_cost}{Total SMC cost (operational + SPAQ) at 4 cycles}
#'   \item{year}{Implementation year}
#'   \item{pop_u5}{Population under 5}
#'   \item{four_cycle_cost_pp}{Four-cycle cost per child under 5}
#'   \item{imputation_method}{How missing values were imputed}
#' }
"smc_cost_clean"