#!/usr/bin/env bash
# run_workflow.sh - bash script to execute snakemake workflow on cluster
# using snakemake version 9. This runs on the notchpeak cluster.
# The --latency-wait flag is useful on file systems with high latency,
# and tells snakemake to wait for N seconds for output files to appear.

module load snakemake/9.3.3
snakemake --workflow-profile profiles/notchpeak --latency-wait 20
