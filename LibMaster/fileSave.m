# Title: fileSave.m - A function for LibMaster
# Version: 0.2; Sept 2026
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: FileName = fileSave(CATalog,RecordNumbers,filename)
# About:
# -----------------------------------------------------------------------------
function FileName = fileSave(CAT,RecNum,FileName)
if (nargin ~= 3)
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
  FileName = tempFileName;
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
		fprintf("File saved successfully.  Press any key to continue. ")
    FileName = FileName;
	else
		fprintf("!File not closed!  Press any key to continue. ")
    FileName = tempFileName;
	endif
endif
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
