#!/usr/bin/env bash
# run_workflow_v7.sh - bash script to execute snakemake workflow on cluster
# using snakemake version 7 or earlier.
# The "--jobs 20" argument instructs snakemake to submit at most 20 concurrent
# jobs to the cluster.
# The --cluster argument tells snakemake how to start a job on the cluster.
# The "--latency-wait 30" argument tells snakemake to wait up to 30 seconds
# after a job completes for the output files to become available.

module load snakemake/7.32.4

set -x
snakemake --cluster-config cluster.yaml \
	--jobs 5 \
	--cluster "sbatch -A {cluster.account} -p {cluster.partition} -q {cluster.qos} -t {cluster.time} --parsable" \
	--cluster-cancel scancel \
	--latency-wait 30 
