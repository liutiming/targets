# y's target object should be large when retrival is "main"
# and small when retrieval is "worker".
pkgload::load_all()
tar_option_set(retrieval = "main")
options(clustermq.scheduler = "multicore")
pipeline <- tar_pipeline(
  tar_target(
    x,
    data.frame(x = runif(5e6)),
    deployment = "main",
    format = "fst"
  ),
  tar_target(y, x, format = "fst")
)
cmq <- clustermq_init(pipeline)
debug(cmq$run_worker)
cmq$run()
# pryr::object_size(target) # Run in the debugger. # nolint
tar_destroy()
tar_option_set(retrieval = "worker")
pipeline <- tar_pipeline(
  tar_target(
    x,
    data.frame(x = runif(5e6)),
    deployment = "main",
    format = "fst"
  ),
  tar_target(y, x, format = "fst")
)
cmq <- clustermq_init(pipeline)
debug(cmq$run_worker)
cmq$run()
# pryr::object_size(target) # Run in the debugger. # nolint
tar_destroy()
