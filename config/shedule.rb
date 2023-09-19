# Skip migration if files in db/migrate were not modified
# Defaults to false
set :conditionally_migrate, true

# Set unique identifier for background jobs
set :whenever_identifier, -> { "#{fetch(:application)}_#{fetch(:stage)}" }