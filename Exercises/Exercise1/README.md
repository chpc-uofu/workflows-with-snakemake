# Exercise 1 - Simple workflow

This exercise (and subsequent exercises) uses data from the NOAA
U.S. Regional Climate Reference Network, which is located at
https://www1.ncdc.noaa.gov/pub/data/uscrn/products/daily01 . I located this
data set using https://www.data.gov/ .

Write a Snakefile for a simple workflow. This workflow consists of
three steps (and therefore has three rules):

Step 1: Download the file "HEADERS.txt" from this URL:
https://www1.ncdc.noaa.gov/pub/data/uscrn/products/daily01/HEADERS.txt
using the "wget" command. Wget requires the file's URL as its only argument. 
This will create a local copy of the file. This step doesn't have any input, only output.

Step 2: Download the file "CRND0103-2020-AK_Aleknagik_1_NNE.txt" from this
url:
https://www1.ncdc.noaa.gov/pub/data/uscrn/products/daily01/2020/CRND0103-2020-AK_Aleknagik_1_NNE.txt
This step also doesn't have any input.

Step 3: Use the provided R script "plot_files.r" to plot the data into a PNG
file. The commands you need to run are:

```bash
module load R
Rscript plot_files.r HEADERS.txt CRND0103-2020-AK_Aleknagik_1_NNE.txt
```

The output of this statement will be the PNG file "Rplot001.png".
The input for this step is the output from the other two steps.

The PNG file Rplot001.png is the ultimate goal of this workflow. Therefore,
the rule that creates that output needs to be the first rule in your Snakefile.

A good way to build a workflow like this is to start with a single step and
get that working. Then add another step, and so on.

To execute your snakemake, first run "module load snakemake/6.4.1". Then,
try the commands:

```bash
snakemake -n
snakemake
```

Once your workflow runs successfully, try those commands again.
