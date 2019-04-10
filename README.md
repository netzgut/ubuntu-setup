# Idempotent Ubuntu Setup for 18.04 / amd64

A collection of (more or less) idempotent shell scripts for easy setting up a dev machine.
Theses scripts fulfill our needs, YMMV.

NO WARRANTIES GIVEN! IF YOU BRICK YOUR MACHINE THERE'S ONLY YOU TO BLAME!

## Idempotency

All scripts use marker files to check if they already ran, so they should only run again if the previous attempt didn't succeed.
You can set the location of these files, they will contain the date of the successful run.
Most scripts don't clean up if they fail so idempotency isn't guaranteed.

## How to use it

See `setup-example.sh` for how to use it. Just add the scripts you want to run. You can override default settings,
see a script for the available/needed environment variables.

## License
MIT. See LICENSE.
