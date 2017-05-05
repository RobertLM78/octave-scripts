# Title: fileSave.m - A function for LibMaster
# Version: 0.1; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: fileSave(CATalog,RecordNumbers)
# About:
# -----------------------------------------------------------------------------
function fileSave(CAT,RecNum)
if (nargin ~= 2)
	help fileSave
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Save File"];
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
####  Go back to Main Script   ####
elseif strcmpi(FileName,"<BACK>") == 1
	return
###################################
endif

# Save the file
fID = fopen(FileName,"w");
if fID == -1
	fprintf("!Error opening file!\n")
else
	for k = 1:RecNum
		fprintf(fID,"%s\n",CAT{k,1});
	end
	FCchck = fclose(fID);
	if FCchck == 0
		fprintf("File saved successfully.  Press any key to continue.\n")
	else
		fprintf("!File not closed!  Press any key to continue.\n")
	endif
endif
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
