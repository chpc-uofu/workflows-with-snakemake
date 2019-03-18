# ex1-3.snakefile - really complete snakefile for exercise 1.
configfile: "config3.yaml"

# Configure the shell, in case we use some bash-isms in our rules
# and the user is using tcsh.
shell.executable("/bin/bash")

rule greet:
	message: "Rule {rule}: Running program {output}."
	output: "greeting.txt"
	input: "hello_world"
	shell: "./{input} > {output}"

rule link:
	message: "Rule {rule}: Linking file {input} to produce program {output}."
	params: compiler=config['compiler'], module=config['module']
	input: "hello_world.o"
	output: "hello_world"
	shell: """
		module load {params.module}
		{params.compiler} -o {output} {input}
		"""

rule compile:
	message: "Rule {rule}: Compiling file {input} to produce object file {output}."
	params: compiler=config['compiler'], module=config['module']
	input: "hello_world.c"
	output: "hello_world.o"
	shell:	"""
		module load {params.module}
		{params.compiler} -c {input}
		"""

rule clean:
	message: "Rule {rule}: Cleaning up."
	shell: "rm -f greeting.txt hello_world hello_world.o"
