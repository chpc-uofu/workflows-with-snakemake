# Exercise 1 - Simple linear workflow

Create a snakefile for a work flow with the following steps:

1. Compile the helloworld.c program into the helloworld.o file, using the command "cc -c helloworld.c"
1. Link the helloworld.o file to produce the executable helloworld using the command "cc -o helloworld helloworld.o"
1. Execute the command "./helloworld" redirecting the output into a file named greeting.txt.

Run snakemake to execute your workflow, creating the greeting.txt file. 
Then run snakemake to produce the two forms of graphical output from your 
workflow, the rule graph and the DAG of rules.

In the X-windows environment you can display those .png files with the
"display *filename*" command.
