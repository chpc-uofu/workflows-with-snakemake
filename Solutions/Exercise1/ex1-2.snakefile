# ex1-2.snakefile - more complex snakefile for exercise 1.
configfile: "config2.yaml"

rule greet:
	message: "Rule {rule}: Running program {output}."
	output: "greeting.txt"
	input: "hello_world"
	shell: "./{input} > {output}"

rule link:
	message: "Rule {rule}: Linking file {input} to produce program {output}."
	params: compiler=config['compiler']
	input: "hello_world.o"
	output: "hello_world"
	shell: "{params.compiler} -o {output} {input}"

rule compile:
	message: "Rule {rule}: Compiling file {input} to produce object file {output}."
	params: compiler=config['compiler']
	input: "hello_world.c"
	output: "hello_world.o"
	shell:	"{params.compiler} -c {input}"

rule clean:
	message: "Rule {rule}: Cleaning up."
	shell: "rm -f greeting.txt hello_world hello_world.o"
