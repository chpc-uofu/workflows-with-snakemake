#!/bin/bash
# run_snakemake.sh - simple script to start snakemake with all the
# command-line arguments required to run jobs on a cluster.

module load snakemake/5.4.2

snakemake -s exercise2-3.snakefile \
	--cluster-config cluster.yaml \
	--cluster "sbatch --res=snakemake2019 -M {cluster.name} -p {cluster.partition} -A {cluster.account} -N {cluster.nodes} -J {rule} -t {cluster.time}" \
	--jobs 3
