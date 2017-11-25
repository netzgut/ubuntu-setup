# Idempotent Ubuntu Setup

A collection of idempotent shell scripts for easy setting up a dev machine. The scripts fullfil our needs, YMMV.

NO WARRANTIES GIVEN! IF YOU BRICK YOUR MACHINE THERE'S ONLY YOU TO BLAME!

## Idempotency

All scripts use marker files to check if they already ran, so they should only run again if the previous attempt didn't succeed. You can set the location of these files, they will contain the date of the successful run.

## How to usegit c

See `setup-example.sh` for how to use it. Just add the scripts you want to run.


