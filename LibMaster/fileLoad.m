# Title: fileLoad.m - A function for LibMaster
# Version: 0.3; Sept 2026
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  [CATalog,RecordNumbers,filename] = fileLoad(CAT,RecNum,filename);
# About:
# -----------------------------------------------------------------------------
function [CAT,RecNum,FileName] = fileLoad(CAT,RecNum,FileName) #Three arguments in for the three out - in case a file DNE
if (nargin ~= 3)
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
### Set up a prompt for input
prompt = "Enter a file name";
full_prompt = sprintf('%s [%s]: ', prompt, FileName);
fflush(stdout);
tempFileName = FileName;

# User input for a file name
FileName = input(full_prompt,"s");
while isempty(FileName) == 1
	FileName = input(full_prompt,"s");
endwhile
# Check to see if default file name is desired
if strcmpi(FileName,"<DEF>") == 1
	FileName = "catalog.dat";
####  Go back to Main Script   ####
elseif strcmpi(FileName,"<BACK>") == 1
	RecNum = RecNum; #TIT = TIT; AUT = AUT; SUBJ = SUBJ; NTS = NTS;
	CAT = CAT;
  FileName = tempFileName;
  #FileName = "--.dat";
	return
elseif exist(FileName) == 0
	RecNum = RecNum;  # Retain everything passed
	CAT = CAT;
	fprintf("File Not Found!  Press any key to return to the menu.")
  FileName = tempFileName;
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
		fprintf("File loaded successfully.  Press any key to continue. ")
	else
		fprintf("!File not closed!  Press any key to continue. ")
	endif
endif
RecNum = N;
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
