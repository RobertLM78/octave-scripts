# Title: fileLoad.m - A function for LibMaster
# Version: 0.2; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  [CATalog,RecordNumbers] = fileLoad();  [CATalog,RecordNumbers] = fileLoad
# About:
# -----------------------------------------------------------------------------
function [CAT,RecNum] = fileLoad()
if (nargin ~= 0)
	help fileLoad
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Load File"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# User input for a file name
FileName = input("Enter a file name (type <DEF> for default file name): ","s");
while isempty(FileName) == 1
	FileName = input("Enter a file name (type <DEF> for default file name): ","s");
endwhile
# Check to see if default file name is desired
if strcmpi(FileName,"<DEF>") == 1
	FileName = "catalog.dat";
elseif exist(FileName) == 0
	# Null variables if starting a new catalog or just haven't loaded one yet
	RecNum = 0; TIT{1,1} = []; AUT{1,1} = []; AUT{1,2} = []; AUT{1,3} = []; SUBJ{1,1} = []; NTS{1,1} = [];
	CAT = strCat(TIT,AUT,SUBJ,NTS);
	fprintf("File Not Found!  Press any key to return to the menu.")
	kbhit(); clear ans
	return
endif



# Open the file and load the array
fID = fopen(FileName,"r");
if fID == -1
	fprintf("!Error opening file!\n")
else
	N = 0; # Indexer and record keeper
	while feof(fID) == 0
		N = N + 1;
		CAT{N,1} = fgetl(fID);
	endwhile
	FCchck = fclose(fID);
	if FCchck == 0
		fprintf("File loaded successfully.  Press any key to continue.\n")
	else
		fprintf("!File not closed!  Press any key to continue.\n")
	endif
endif
RecNum = N;
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
