# HelloWorld example

This example illustrates some snakemake basics with a workflow that
compiles a simple C program.

Our workflow consists of two steps:

Step 1: Compile the C source code files hello_world.c and hello_world.h into the .o file hello_world.o with the command:
```bash
gcc -c hello_world.c
```

Step 2: Link the hello_world.o file to produce the executable hello_world with the command:
```bash
gcc -o hello_world hello_world.o
```

Our workflow has two steps, therefore we need two snakemake rules. Since the output of Step 2 is our ultimate goal, the rule for that step must come first in our snakemake file.
