# Solution to Exercise 2 - Workflow using a wildcard

With the locations copied into our Snakefile:

locations = [ 
	"Aleknagik_1_NNE",
	"King_Salmon_42_SE",
	"Fairbanks_11_NE",
	"Sitka_1_NE",
]

use those locations as arguments to the expand() function as the input
to a rule.

Note that the use of wildcards impacts multiple rules: the rule where 
expand() is used as well as rules upstream of that rule.
