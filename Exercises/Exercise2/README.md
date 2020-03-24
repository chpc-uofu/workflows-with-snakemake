# Exercise 2 - Workflow using a wildcard

Modify your Snakefile from Exercise 1 (or use one of the Snakefiles from
the Exercise1 solutions folder) so that your workflow can download
data for several different locations such that those locations are not
hard-coded as the inputs or outputs of rules. This will require use of the 
snakemake expand() function.

The easiest way to do this is to provide expand() with a list of values
to work with in your Snakefile. Just copy and paste this list of locations
into the top of your Snakefile:


locations = [ 
	"Aleknagik_1_NNE",
	"King_Salmon_42_SE",
	"Fairbanks_11_NE",
	"Sitka_1_NE",
]


Then use those locations as arguments to the expand() function.

To execute your snakemake, try the commands:
* snakemake -n
* snakemake
* snakemake -j 3	(this will execute up to 3 tasks in parallel)

Generate the rule graph and directed acyclic graph outputs:
* snakemake --rulegraph | dot -Tpng > rulegraph.png
* snakemake --dag | dot -Tpng > dag.png

