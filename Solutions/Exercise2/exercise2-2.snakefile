# exercise2-2.snakefile - a two rule implementation of the RNAseq QC
# workflow.
#
# We need to generate a list of the sample names embedded in the file names.
# There are a few ways to do this.
#
# We could hard-code it in the snakefile or in a config file:
samples=[ 'SRR5934916', 
	'SRR5934917', 
	'SRR5934918', 
	'SRR5934919',
	'SRR5934920',
	'SRR5934921' ]

# We could write a bit of python to do it. This lists the .fastq.gz files
# in the current directory, strips off the .fastq.gz extension, and builds
# a list with the resulting sample names using python list comprehension:
import os
import re
samples=[re.sub('.fastq.gz','',f) for f in os.listdir('.') if f.endswith('.fastq.gz')]

# Here's a hybrid python/shell approach. This executes the 'ls *.fastq.gz' 
# command, strips off the .fastq.gz extension, and then builds a list using
# the python list() function:
samples=list( shell("ls *.fastq.gz | sed -e 's/.fastq.gz//'",iterable=True) )

rule multiqc:
	message: "Rule {rule}: running multiqc."
	input: expand("{sample}_fastqc.{format}", sample=samples, format=["zip","html"])
	# Here's an alternative that uses two expand() function calls:
	#input: expand("{sample}_fastqc.zip", sample=samples ), expand("{sample}_fastqc.html", sample=samples )
	output: "multiqc_report.html", directory("multiqc_data")
	shell:	"""
		module load multiqc
		multiqc .
		"""

rule fastqc_one_sample:
	message: "Rule {rule}: running fastqc on {input}."
	input: "{sample}.fastq.gz"
	output: "{sample}_fastqc.zip", "{sample}_fastqc.html"
	shell:	"""
		module load fastqc
		fastqc --noextract {input}
		"""

rule clean:
	shell: "rm -rf *_fastqc.zip *_fastqc.html multiqc_report.html multiqc_data"
