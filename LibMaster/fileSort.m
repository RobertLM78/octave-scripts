# Title: fileSort.m - A function for LibMaster
# Version: 0.6; Oct 2026 ; Now with progress bar  (upgraded to structure)
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  sCATALOG = fileSort(sCATALOG)
# About: no changes written to file
# -----------------------------------------------------------------------------
function [sCATALOG,CAT] = fileSort(sCATALOG)
if (nargin ~= 1)
	help fileSort
	return
endif
tic;  # Time this function
## Progress bar -- NEW ######################
pBar = waitbar(0, 'Processing...');
pBarStep = 3*length(sCATALOG);
pBarNum = 0;
#############################################
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Sort by Title (no changes written)"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# 'Suffix' preceeding articles in title
N = 0;
fprintf("Removing preceeding articles from titles:\n")
for k = 1:length(sCATALOG)
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	TITtmp = sCATALOG(k).TIT;
  # Check to see if title is less than "The " (4 characters) long
  if length(TITtmp) < 4
    TITtmp = [TITtmp,"  "];  # 2 extra spaces, just to be sure
  endif
	Art0chk = TITtmp(1,1:2) == "A ";
	Art2chk = TITtmp(1,1:3) == "An ";
	Art1chk = TITtmp(1,1:4) == "The ";
	# Place preceeding article in title at the end such that TITtmp="<Some title with leading 'The'>,The "
	if Art0chk == [1,1];
		N = N + 1;
		fprintf("%d ",N)
		sCATALOG(k).TIT = [TITtmp(1,3:length(TITtmp)),",",TITtmp(1,1:2)];
	elseif Art2chk == [1,1,1]
		N = N + 1;
		fprintf("%d ",N)
		sCATALOG(k).TIT = [TITtmp(1,4:length(TITtmp)),",",TITtmp(1,1:3)];
	elseif Art1chk == [1,1,1,1]
		N = N + 1;
		fprintf("%d ",N)
		sCATALOG(k).TIT = [TITtmp(1,5:length(TITtmp)),",",TITtmp(1,1:4)];
	endif
end
fprintf("\n\n")

# Alphabetize the catalog
sortsCATALOG = {sCATALOG.TIT};
[~,idx] = sort(sortsCATALOG);
sCATALOG = sCATALOG(idx);
###############################
fprintf("Alphabetizing: ")
for k = 1:length(sCATALOG)
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	fprintf(". ")
end
fprintf("\n\n")

# 'Re-prefix' preceeding articles
N = 0;
fprintf("Replacing preceeding articles to titles:\n")
for k = 1:length(sCATALOG)
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	if strfind(sCATALOG(k).TIT,",") > 1
		N = N + 1;
		fprintf("%d ",N)
		[newStr,StrBal] = strtok(sCATALOG(k).TIT,",");
		[Art,StrBal] = strtok(StrBal,",");
		sCATALOG(k).TIT = [strtrim(Art)," ",strtrim(newStr)];
	endif
end
fprintf("\n\n")

# Rebuild CAT cell array
fprintf("Updating CATalog array...\n")
CAT = struct2CAT(sCATALOG);
fprintf("\n\n")
toc; # Print elapsed time
# Closing fprintf
fprintf("Catalog sorted.  Press any key to continue. ")
## Progress bar -- NEW ######################
  pause(0.75)
  close(pBar)
#############################################
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
