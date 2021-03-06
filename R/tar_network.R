#' @title Return the vertices and edges of a pipeline dependency graph.
#' @export
#' @description Analyze the pipeline defined in `_targets.R`
#'   and return the vertices and edges of the directed acyclic graph
#'   of dependency relationships.
#' @return A list with two data frames: `vertices` and `edges`. The
#'   vertices data frame has one row per target with fields to denote
#'   the type of the target or object (stem, branch, map, cross, function,
#'   or object) and the target's status
#'   (up to date, outdated, running, cancelled, or errored).
#'   The edges data frame has one row for every edge and columns `to` and
#'   `from` to mark the starting and terminating vertices.
#' @inheritParams tar_outdated
#' @param targets_only Logical, whether to restrict the output to just targets
#'   (`FALSE`) or to also include imported global functions and objects.
#' @examples
#' if (identical(Sys.getenv("TARGETS_LONG_EXAMPLES"), "true")) {
#' tar_dir({
#' tar_script({
#'   tar_option_set()
#'   tar_pipeline(
#'     tar_target(y1, 1 + 1),
#'     tar_target(y2, 1 + 1),
#'     tar_target(z, y1 + y2)
#'   )
#' })
#' tar_network(targets_only = TRUE)
#' })
#' }
tar_network <- function(
  targets_only = FALSE,
  reporter = "silent",
  callr_function = callr::r,
  callr_arguments = list()
) {
  assert_target_script()
  assert_lgl(targets_only, "targets_only must be logical.")
  assert_in(
    reporter,
    c("forecast", "silent"),
    "reporter arg of tar_outdated() must either be \"silent\" or \"forecast\""
  )
  assert_callr_function(callr_function)
  assert_list(callr_arguments, "callr_arguments mut be a list.")
  callr_outer(
    targets_function = tar_network_inner,
    targets_arguments = list(targets_only = targets_only, reporter = reporter),
    callr_function = callr_function,
    callr_arguments = callr_arguments
  )
}

tar_network_inner <- function(pipeline, targets_only, reporter) {
  pipeline_validate_lite(pipeline)
  inspection <- inspection_init(pipeline = pipeline, reporter = reporter)
  inspection$update(targets_only = targets_only)
  list(
    vertices = tibble::as_tibble(inspection$vertices),
    edges = tibble::as_tibble(inspection$edges)
  )
}
