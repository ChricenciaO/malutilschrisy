utils::globalVariables(c(
  "smc_cost_clean", "total_smc_cost", "extra_cost",
  "year", "scenario_cost", "bau_cost"
))

#' Compare SMC cost under a 4-vs-5 cycle scenario
#'
#' @param data SMC cost data. Defaults to the bundled `smc_cost_clean`.
#' @param five_cycle_districts Character vector of `adm2` names running
#'   5 cycles. Anything not listed runs 4. Default none (pure BAU).
#' @param spaq_cost_per_dose Cost of one SPAQ dose. Default 0.25 (EUR).
#'
#' @return A tibble with one row per year: bau_cost, scenario_cost,
#'   additional_cost.
#' @export
#'
#' @examples
#' smc_scenario_cost(five_cycle_districts = c("FERKESSEDOUGOU", "MADINANI"))
smc_scenario_cost <- function(data = smc_cost_clean,
                              five_cycle_districts = character(0),
                              spaq_cost_per_dose = 0.25) {

  data |>
    dplyr::mutate(
      extra_cost = dplyr::case_when(
        adm2 %in% five_cycle_districts~
          cost_per_cycle + pop_u5 * spaq_cost_per_dose,
        TRUE ~ 0
      ),
      scenario_cost = total_smc_cost + extra_cost
    ) |>
    dplyr::group_by(year) |>
    dplyr::summarise(
      bau_cost        = sum(total_smc_cost, na.rm = TRUE),
      scenario_cost   = sum(scenario_cost,  na.rm = TRUE),
      additional_cost = scenario_cost - bau_cost,
      .groups = "drop"
    )
}