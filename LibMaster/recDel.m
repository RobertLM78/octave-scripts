# Title: recDel.m - A function for LibMaster
# Version: 0.3; Oct 2026 (upgrade to structure)
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  [sCATALOG,CAT,RecNum] = recDel(sCATALOG,CAT,RecNum)
# About: no changes written to file
# -----------------------------------------------------------------------------
function [sCATALOG,CAT,RecNum] = recDel(sCATALOG,CAT,RecNum)
if (nargin ~= 3)
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
  sCATALOG = sCATALOG;
	CAT = CAT;
	RecNum = RecNum;
	return
endif
###################################
while DELrec < 0 || DELrec > length(sCATALOG) || isnan(DELrec) || any(unicode2native(DELrecTmp) == 46)
	fprintf("No such record number.\n")
	DELrec = input("Record to Delete?: ","s");
	DELrecTmp = DELrec; DELrec = str2double(DELrec);
	####  Go back to Main Script   ####
	if DELrec == 0
    sCATALOG = sCATALOG;
    CAT = CAT;
    RecNum = RecNum;
		return
	endif
	###################################
endwhile
clear DELrecTmp

# Confirm delete
fprintf("Record %d selected:\n  %s\n  %s\n  %s\n  %s\n\n",
DELrec,sCATALOG(DELrec).TIT,sCATALOG(DELrec).AUT1,sCATALOG(DELrec).SUBJ,sCATALOG(DELrec).NTS)
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
  sCATALOG(DELrec) = [];
  # Rebuild CAT cell array
  CAT = struct2CAT(sCATALOG);
	# Reset number of records
	RecNum = length(sCATALOG);
	fprintf("\n")
	fprintf("Record Deleted.  Press any key to continue. ")
	kbhit(); clear ans
case {"N","n"}
  sCATALOG = sCATALOG;
	CAT = CAT;
	RecNum = RecNum;
	fprintf("\n")
	fprintf("No record Deleted.  Press any key to continue. ")
	kbhit(); clear ans
endswitch

endfunction
# ------- EOF -----------------------------------------------------------------
