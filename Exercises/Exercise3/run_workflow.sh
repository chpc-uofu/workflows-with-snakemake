#!/usr/bin/env bash
# run_workflow.sh - bash script to execute snakemake workflow on cluster.
# The "--jobs 20" argument instructs snakemake to submit at most 20 concurrent
# jobs to the cluster.
# The "--latency-wait 30" argument tells snakemake to wait up to 30 seconds
# after a job completes for the output files to become available.

module load snakemake/5.6.0
snakemake --cluster-config cluster.yaml \
	--jobs 20 \
	--cluster "sbatch -M {cluster.cluster} -A {cluster.account} -p {cluster.partition}" \
	--latency-wait 30
