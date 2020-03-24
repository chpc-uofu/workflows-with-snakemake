#!/usr/bin/env python
# check_data.py - given the names of 
#	a data file
#	the HEADERS.txt file
# check that the format of the data in the file is correct.
# Exit code is 0 of data OK, otherwise 1.

import argparse
import sys

class Header:
	"This class contains all the data in the header file."
	def __init__(self,header_file):
		"""
		Reads header file and stores all its information.
		"""
		self.numfields=len(header_file.readline().split())
		self.fieldnames=header_file.readline().split()
		self.fieldformats=header_file.readline().split()

	def __str__(self):
		output=f"Number of fields: {self.numfields}"
		for i in range(self.numfields):
			output+=f"\nField\t{i+1}:\t{self.fieldnames[i]}\t{self.fieldformats[i]}"
		return output

def check_yymmdd(value):
	'''Checks if a string value conforms to the YYMMDD format.'''
	year=int(value[0:4])
	month=int(value[4:6])
	day=int(value[6:8])
	return year > 1900 and year < 2040 and \
		month > 0 and month < 13 and \
		day > 0 and day < 32

def check_celcius(value):
	'''Checks if a string value conforms to the celcius format.'''
	temperature=float(value)
	return temperature >= -9999.0 and temperature < 1000.0

def check_decimal_degrees(value):
	'''Checks if a string value conforms to the decimal_degrees format.'''
	value=float(value)
	return value >= -180.0 and value <= 180.0

# format_checkers maps the data format names onto functions to check
# data of that format.
format_checkers = {
	'YYYYMMDD': check_yymmdd,
	'Celsius': check_celcius,
	'Decimal_degrees': check_decimal_degrees,
}

def CheckFile(datafile,header):
	"""
	Checks data within in data file. Returns 0 if OK, 1 if not.
	Also writes errors found to stderr.
	"""
	rownum=1
	for row in datafile:
		datafields=row.split()
		# Check that the number of fields is correct.
		if len(datafields) != header.numfields:
			return 1

		# Check each data field against its format. For now,
		# just checking the fields for which we have a format
		# checking function. Don't care about the others.
		for i in range(header.numfields):
			try:
				dataformat=header.fieldformats[i]
				datavalue=datafields[i]
				if not format_checkers[dataformat](datavalue):
					sys.stderr.write(f"Row {rownum} field {i+1} value {datavalue} doesn't meet format {dataformat}\n")
					return 1
			except KeyError:
				pass
			rownum+=1
	return 0

def main():
	# Handle command-line arguments.
	argp=argparse.ArgumentParser(description="Validate a NOAA USCRN data file.")
	argp.add_argument("--header",type=argparse.FileType('r'),dest='header',help="name of header file",required=True)
	argp.add_argument("--data",type=argparse.FileType('r'),dest='data',help="name of data file",required=True)
	args=argp.parse_args()

	header=Header(args.header)
	sys.exit(CheckFile(args.data,header))

if __name__ == "__main__":
	main()
