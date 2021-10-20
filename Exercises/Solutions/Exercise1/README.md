# Solutions to Excercise 1

This directory contains two solutions to exercise1. Snakefile is a
bare-bones snakefile with hard-coded filenames.

Snakefile.fancy expands upon this a bit, by adding messages for each
rule, a new rule named "clean" to clean up, and uses the symbolic
names {input} and {output} for the input and output files.

Try executing these using "snakemake -j1" or "snakemake -j1 -s Snakefile.fancy".

You can also experiment with:
* snakemake -n 
* snakemake --dag | dot -Tpng > dag.png
* snakemake --rulegraph | dot -Tpng > rulegraph.png
* snakemake -j1 -s Snakefile.fancy clean
