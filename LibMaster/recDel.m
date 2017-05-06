# Title: recDel.m - A function for LibMaster
# Version: 0.2; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  [CATalog,RecNum] = recDel(CAT)
# About: no changes written to file
# -----------------------------------------------------------------------------
function [CAT,RecNum] = recDel(CAT)
if (nargin ~= 1)
	help recDel
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Delete a Record (no changes written)"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# Enter the record number to delete
DELrec = input("Record to Delete?: ","s");
DELrecTmp = DELrec; DELrec = str2double(DELrec);
####  Go back to Main Script   ####
if DELrec == 0
	CAT = CAT;
	RecNum = rows(CAT);
	return
endif
###################################
while DELrec < 0 || DELrec > rows(CAT) || isnan(DELrec) || any(toascii(DELrecTmp) == 46)
	fprintf("No such record number.\n")
	DELrec = input("Record to Delete?: ","s");
	DELrecTmp = DELrec; DELrec = str2double(DELrec);
	####  Go back to Main Script   ####
	if DELrec == 0
		CAT = CAT;
		RecNum = rows(CAT);
		return
	endif
	###################################
endwhile
clear DELrecTmp

# Confirm delete
fprintf("Record %d selected:\n  %s\n",DELrec,CAT{DELrec,1})
ConfirmD = input("Are you sure?(Y/N)?: ","s");
if isempty(ConfirmD) == 1
	ConfirmD = " ";
endif
ConfirmD = ConfirmD(1,1);
while ConfirmD ~= "y" && ConfirmD ~= "Y" && ConfirmD ~= "n" && ConfirmD ~= "N"
	ConfirmD = input("Are you sure?(Y/N)?: ","s");
	if isempty(ConfirmD) == 1
		ConfirmD = " ";
	endif
	ConfirmD = ConfirmD(1,1);
endwhile
switch ConfirmD
case {"Y","y"}
	# Delete that sucker
	CAT{DELrec,1} = [];
	CAT(DELrec,:) = [];
	# Reset number of records
	RecNum = rows(CAT);
	fprintf("\n")
	fprintf("Record Deleted.  Press any key to continue. ")
	kbhit(); clear ans
case {"N","n"}
	CAT = CAT;
	RecNum = rows(CAT);
	fprintf("\n")
	fprintf("No ecord Deleted.  Press any key to continue. ")
	kbhit(); clear ans
endswitch

endfunction
# ------- EOF -----------------------------------------------------------------
