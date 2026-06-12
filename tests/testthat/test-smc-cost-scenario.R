# create a small toy dataset inside the test where you can calculate the answers by hand
test_data <- tibble::tibble(
  adm2 = c("A", "B", "A", "B"),
  year = c(2026, 2026, 2027, 2027),
  cost_per_cycle = c(100, 100, 100, 100),
  pop_u5 = c(1000, 1000, 1000, 1000),
  total_smc_cost = c(400, 400, 400, 400)
)

# checks that the default behaviour (character(0)) truly gives no extra cost.
testthat::test_that("returns BAU costs when no districts have a fifth cycle", {

  result <- smc_scenario_cost(data = test_data)

  testthat::expect_equal(
    result$additional_cost,
    c(0, 0)
  )
})

# adds extra costs to districts with fifth cycle
testthat::test_that("adds extra costs for districts with a fifth cycle", {

  result <- smc_scenario_cost(
    data = test_data,
    five_cycle_districts = "A",
    spaq_cost_per_dose = 0.25
  )

  testthat::expect_equal(
    result$additional_cost,
    c(350, 350)
  )
})

# why 350 for district A
# extra_cost = cost_per_cycle + pop_u5 * spaq_cost_per_dose
#            = 100 + 1000 * 0.25
#            = 350


# check that the output has the expected number of years
testthat::test_that("returns one row per year", {

  result <- smc_scenario_cost(data = test_data)

  testthat::expect_equal(
    nrow(result),
    2
  )
})

# a one test that changing SPAQ cost changes the result
testthat::test_that("SPAQ cost per dose affects the additional cost", {

  result <- smc_scenario_cost(
    data = test_data,
    five_cycle_districts = "A",
    spaq_cost_per_dose = 0.50
  )

  testthat::expect_equal(
    result$additional_cost,
    c(600, 600)
  )
})

