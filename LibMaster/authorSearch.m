# Title: authorSearch.m - A function for LibMaster
# Version: 0.3; Oct 2026 (upgrade to structure)
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  authorSearch(sCATALOG)
# About:
# -----------------------------------------------------------------------------
function authorSearch(sCATALOG)
if (nargin ~= 1)
	help authorSearch
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Author Search"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# Enter a author to look for
AUTsrch = lower(input("Search for author: ","s"));
####  Go back to Main Script   ####
if strcmpi(AUTsrch,"<BACK>") == 1
	return
endif
###################################
while isempty(AUTsrch)
	AUTsrch = lower(input("Search for author: ","s"));
	####  Go back to Main Script   ####
	if strcmpi(AUTsrch,"<BACK>") == 1
		return
	endif
	###################################
endwhile
# Start searching through AUT
for k = 1:length(sCATALOG)
	fprintf("%d ",k)
  if strfind(lower(sCATALOG(k).AUT1),AUTsrch) >= 1 || strfind(lower(sCATALOG(k).AUT2),AUTsrch) >= 1 || strfind(lower(sCATALOG(k).AUT3),AUTsrch) >= 1
    fprintf("\n")
    fprintf("Title:      %s\n",sCATALOG(k).TIT)
    fprintf("Author 1:   %s\n",sCATALOG(k).AUT1)
    fprintf("Author 2:   %s\n",sCATALOG(k).AUT2)
    fprintf("Author 3:   %s\n",sCATALOG(k).AUT3)
    fprintf("Subject:    %s\n",sCATALOG(k).SUBJ)
    fprintf("Notes:      %s\n",sCATALOG(k).NTS)
    fprintf("Press any key to continue.\n")
    kbhit();
    fprintf("\n")
  endif
end
fprintf("\n")
fprintf("Finsihed searching.  Press any key to continue. ")
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
