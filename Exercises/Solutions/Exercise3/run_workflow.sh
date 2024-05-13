#!/usr/bin/env bash
# run_workflow.sh - bash script to execute snakemake workflow on cluster.

module load snakemake
snakemake --cluster-config cluster.yaml --jobs 2 \
	--cluster "sbatch -M {cluster.cluster} -A {cluster.account} -p {cluster.partition}" \
	--latency-wait 30
