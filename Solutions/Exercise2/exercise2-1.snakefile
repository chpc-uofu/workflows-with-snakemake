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

rule multiqc:
	message: "Rule {rule}: running multiqc."
	input: expand("{sample}_fastqc.zip", sample=samples)
	output: "multiqc_report.html", directory("multiqc_data")
	shell:	"""
		module load multiqc
		multiqc .
		"""

rule fastqc_one_sample:
	message: "Rule {rule}: running fastqc on {input}."
	input: "{sample}.fastq.gz"
	output: "{sample}_fastqc.zip"
	shell:	"""
		module load fastqc
		fastqc --noextract {input}
		"""
