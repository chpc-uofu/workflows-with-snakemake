# Exercise 2 - Parallel workflow using wildcards

The files in this directory named SRRxxxxxxx.fastq.gz are fastq format
biological data that has been compressed using gzip. This is a common
data format for genome sequence data, or in this case, gene expression 
data from the RNA from some mouse cells.

A part of every bioinformatic analysis is the evaluation of the quality of 
your data. For fastq data there are a few useful quality evaluation tools. 
For this workflow we'll use FastQC and MultiQC.

Create a snakefile for a work flow that carries out the following steps:

1. Run the command `fastqc --noexpand` command on each .fastq.gz file. This will produce two output files for each input file. For example, the command `fastqc --noexpand SRR5934921.fastq.gz` will create the output
files SRR5934921_fastqc.html and SRR5934921_fastqc.zip , so this rule
will have a single input file, but two output files.
Before you can run fastqc you must load its module, fastqc/0.11.4 .

1. Once fastqc has been run on all the .fastq.gz files, run the command:
`multiqc .` . This will summarize the quality data for all the samples in
the current directory, and will produce the output file "multiqc_report.html" 
and the output directory "multiqc_data". These two outputs, multiqc_report.html
and multiqc_data, are the ultimate outputs of this workflow.
To run multiqc you must load its module "multiqc/1.5" first.

Try writing this workflow using the snakemake `expand()` function, rather 
than writing a separate rule for each .fastq.gz file. It is possible to 
write a single rule that can run fastqc on any .fastq.gz file.

The trickiest part may be to identify all the samples that are to be
processed. For now, just hard-code a list of sample names in your snakefile 
like this:

```
samples=[ 'SRR5934916', 
	'SRR5934917', 
	'SRR5934918', 
	'SRR5934919',
	'SRR5934920',
	'SRR5934921' ]
```

and pass that list to the `expand()` function.

Try running your work flow in parallel on 3 cores:
	`snakemake -s your_snakefile -j 3 `
	
Take a look at the rule graph and DAG for your work flow.
