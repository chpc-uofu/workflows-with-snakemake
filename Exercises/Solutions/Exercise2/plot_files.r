# plot_files.r : plots temperature data given a USCRN HEADERS.txt file and one 
# or more data files.
library(ggplot2)
library(lubridate)

# Function to convert date from yyyymmdd format to ordinal date.
convert_date=function(date_yyyymmdd)
{
	yday(as.Date(date_yyyymmdd,format="%Y%m%d"))
}

# Function to read header file.
ReadHeaders=function(headerfile)
{
	all_headers=as.matrix(read.table(headerfile))
	# The column names for the data files are located on row 2.
	headers=all_headers[2,]
	headers
}

# Get the command-line arguments.
args = commandArgs(trailingOnly=TRUE)

# Read the header file.
headers=ReadHeaders(args[1])

# Read the subsequent files into a data frame.
final_dataset = NULL
for ( datafile in args[-1] )
{
	# Read the data file into a data frame.
	dataset=read.table(datafile)
	# Assign names to the columns.
	names(dataset)=headers

	# Get the location name from the name of the file.
	#location=strsplit(datafile,"_")[[1]][2]
	location=tools::file_path_sans_ext(paste(strsplit(datafile,"_")[[1]][-1],collapse="_"))


	dataset$location=rep(location,dim(dataset)[1])

	# Add an ordinal date column.
	dataset$ordinal_date=convert_date(as.character(dataset$LST_DATE))

	# Concatenate data for this location to the final
	# dataset
	if ( is.null(final_dataset) )
		final_dataset=dataset
	else
		final_dataset=rbind(final_dataset,dataset)
}

# Open a PNG file for the plot.
png()
ggplot(data=final_dataset,aes(x=ordinal_date,y=T_DAILY_MAX,group=location))+geom_line(aes(color=location))
dev.off()
