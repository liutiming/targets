# Test that data storage is be the bottleneck.
library(proffer)
devtools::load_all()
tar_destroy()
tar_option_set(memory = "transient")
targets <- lapply(
  seq_len(50),
  function(index) {
    tar_target_raw(
      as.character(index),
      quote(data.frame(x = runif(1e7))),
      memory = "transient",
      format = "fst"
    )
  }
)
pipeline <- tar_pipeline(targets)
local <- local_init(pipeline)
px <- pprof(local$run())
tar_destroy()
