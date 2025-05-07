#!/usr/bin/env bash
# run_workflow.sh - bash script to execute snakemake workflow on cluster.

module load snakemake/5.6.0
snakemake --cluster-config cluster.yaml --jobs 20 \
	--cluster "sbatch -M {cluster.cluster} -A {cluster.account} -p {cluster.partition}" \
	--latency-wait 10
