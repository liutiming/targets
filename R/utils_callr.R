callr_outer <- function(
  targets_function,
  targets_arguments,
  callr_function,
  callr_arguments
) {
  assert_path(target_script_path())
  callr_arguments$func <- callr_inner
  callr_arguments$args <- list(
    targets_script = target_script_path(),
    targets_function = targets_function,
    targets_arguments = targets_arguments
  )
  trn(
    is.null(callr_function),
    callr_inner(target_script_path(), targets_function, targets_arguments),
    do.call(
      callr_function,
      prepare_callr_arguments(callr_function, callr_arguments)
    )
  )
}

callr_inner <- function(targets_script, targets_function, targets_arguments) {
  targets_arguments$pipeline <- source(targets_script)$value
  do.call(targets_function, targets_arguments)
}

prepare_callr_arguments <- function(callr_function, callr_arguments) {
  if ("show" %in% names(formals(callr_function))) {
    callr_arguments$show <- callr_arguments$show %|||% TRUE
  }
  if ("env" %in% names(formals(callr_function))) {
    callr_arguments$env <- callr_arguments$env %|||% callr::rcmd_safe_env()
    callr_arguments$env <- c(
      callr_arguments$env,
      PROCESSX_NOTIFY_OLD_SIGCHLD = "true"
    )
  }
  callr_arguments
}
