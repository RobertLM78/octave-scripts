# Title: fileUpdate.m - A function for LibMaster
# Version: 0.5; Oct 2026 (upgrade to structure)
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  [sCATALOG,RecordNumbers] = fileUpdate(sCATALOG,RecordNumbers)
# About:
# -----------------------------------------------------------------------------
function [sCATALOG,CAT,RecNum] = fileUpdate(sCATALOG,CAT,RecNum)
if (nargin ~= 3)
	help fileUpdate
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Data Entry Mode (no changes written)"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# User input - number of records to enter
HowMuch = input("How many records to enter?: ","s");
HowMuchTmp = HowMuch; HowMuch = str2double(HowMuch);
####  Go back to Main Script   ####
if HowMuch == 0  # But first assign the outputs
  CAT = CAT;
  sCATALOG = sCATALOG;
	RecNum = length(sCATALOG);
	return
endif
###################################
while isnan(HowMuch) || any(unicode2native(HowMuchTmp) == 46)  || HowMuch < 0
	fprintf("Enter a positive integer.\n")
	HowMuch = input("How many records to enter?: ","s");
	HowMuchTmp = HowMuch; HowMuch = str2double(HowMuch);
	####  Go back to Main Script   ####
	if HowMuch == 0  # But first assign the outputs
    CAT = CAT;
    sCATALOG = sCATALOG;
	  RecNum = length(sCATALOG);
		return
	endif
	###################################
endwhile
clear HowMuchTmp
fprintf("\n")

# User input - data
for k = RecNum + 1:RecNum + HowMuch
	fprintf("%d:[Rec:%d]\n",k-RecNum,k)
	# Enter a title
	TITtmp = input("Enter a title:   ","s");
	while isempty(TITtmp)
		TITtmp = strtrim(input("Enter a title: ","s"));  # strtrim immediately
	endwhile
	for m = 1:RecNum # Check through existing titles - if one is found return gracefully back to main script
		if strcmpi(sCATALOG(m).TIT,TITtmp) == 1
			# Assign the outputs before returning
      CAT = CAT;
      sCATALOG = sCATALOG;
			RecNum = length(sCATALOG);
			fprintf("Title already entered!!  Press any key to return to menu.");
			kbhit();
			return
		endif
	end
	sCATALOG(k).TIT = TITtmp;
	# Enter authors
  sCATALOG(k).AUT1 = strtrim(input("Enter author(1 of up to 3): ","s"));  # strtrim immediately
  if isempty(sCATALOG(k).AUT1) == 1
    sCATALOG(k).AUT1 = " ";
  endif
  sCATALOG(k).AUT2 = strtrim(input("Enter author(2 of up to 3): ","s"));  # strtrim immediately
  if isempty(sCATALOG(k).AUT2) == 1
    sCATALOG(k).AUT2 = " ";
  endif
  sCATALOG(k).AUT3 = strtrim(input("Enter author(3 of up to 3): ","s"));  # strtrim immediately
  if isempty(sCATALOG(k).AUT3) == 1
    sCATALOG(k).AUT3 = " ";
  endif
	# Enter subject
	sCATALOG(k).SUBJ = upper(strtrim(input("Enter subject:  ","s")));  # strtrim immediately ; make sure the subject is in CAPS
	if isempty(sCATALOG(k).SUBJ) == 1
		sCATALOG(k).SUBJ = "NoS";
	endif
	# Enter Notes
	sCATALOG(k).NTS = strtrim(input("Enter notes:    ","s"));  # strtrim immediately
	if isempty(sCATALOG(k).NTS) == 1
		NTS{k,1} = " ";
	endif
	fprintf("\n")
end

# Output vars.
# Rebuild CAT cell array
CAT = struct2CAT(sCATALOG);
# Update the Number of Records
RecNum = length(sCATALOG);

# Finished updating cell array - wait for user input
fprintf("Catalog updated.  Press any key to continue. ")
#fprintf("Catalog updated.  Press any key to save.\n")
kbhit(); clear ans
fprintf("\n")

#########################################################################################################
endfunction
# ------- EOF -----------------------------------------------------------------
