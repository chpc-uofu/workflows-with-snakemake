# Exercise 3 - Running snakemake on a cluster

Copy your Snakefile from Exercise 2 into this directory, (or use the 
provided Snakefile) for execution with
the bash script run_workflow.sh. 

Take a look at the profiles/notchpeak/config.v9+.yaml file. This profile
sets the default resources to use on the cluster, and then 



For older versions of snakemake (version 7 or earlier) the Slurm interface
is different. The file cluster.yaml
Take a look at the cluster.yaml file. Notice that it defines the cluster
name, partition name, and account, along with the (very short) time that
a job is allowed to run and the number of nodes per job.

Then take a look at the run_workflow.sh script, and notice the extra arguments
passed to snakemake, particularly --cluster-config and --cluster. Notice
how the values from the cluster.yaml file are used in the command line,
e.g. {cluster.partition}. The "--jobs" argument lets you control how many
concurrent jobs you have submitted to the cluster.

Then execute the script. Simply run:

./run_workflow.sh

Notice all the slurm-#####.out files that are created - these are created 
by the individual slurm jobs.

Its fun to watch your jobs in motion by opening a separate terminal 
window and executing the command "watch -n 3 squeue -M all -u $LOGNAME".
When you're done watching jobs you can interrupt the watch command by typing 
control-C.
