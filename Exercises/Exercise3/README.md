# Exercise 3 - Parallel workflow on a SLURM cluster

Use your work flow and data files from Exercise 2 (or start with one of 
the snakefiles from the Solutions/Exercise2 directory) so that it executes 
the fastqc and multiqc rules as a SLURM job on the cluster. This will require
creating a cluster config file, and calling snakemake with some additional
command-line arguments:
```
snakemake -s your_snakefile \
	--cluster-config your_cluster_config_file \
	--cluster "sbatch -M lonepeak --res=snakemake2019 -p {cluster.partition} -A {cluster.account }" \
	--jobs N
```
where "N" is the maximum number of concurrent jobs you want to run.
(Hint: Because this snakemake command is getting long and unwieldy I tend to
put it in a shell script.)

Feel free to use the snakefile, cluster configuration, and shell script
provided in the solutions directory.

Execute your workflow using the snakemake command provided in the shell script.

Its interesting to monitor your jobs from another terminal window with 
the command:

`squeue -M all -i 3 -u $USER -o "%.6i %.10P %.7a %.20j %.2t %.6M %R"`

When you're done monitoring, just type <control>C to stop the squeue process.
