# ex1-1.snakefile - simple snakefile for exercise 1.

rule greet:
	message: "Running program {output}."
	output: "greeting.txt"
	input: "hello_world"
	shell: "./{input} > {output}"

rule link:
	message: "Linking file {input} to produce program {output}."
	input: "hello_world.o"
	output: "hello_world"
	shell: "cc -o {output} {input}"

rule compile:
	message: "Compiling file {input} to produce object file {output}."
	input: "hello_world.c"
	output: "hello_world.o"
	shell:	"cc -c {input}"

rule clean:
	message: "Cleaning up."
	shell: "rm -f greeting.txt hello_world hello_world.o"
