# Title: titleSearch.m - A function for LibMaster
# Version: 0.3; Oct 2026 (upgrade to structure)
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  titleSearch(sCATALOG)
# About:
# -----------------------------------------------------------------------------
function titleSearch(sCATALOG)
if (nargin ~= 1)
	help titleSearch
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Title Search"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# Enter a title to look for
TITsrch = lower(input("Search for title: ","s"));
####  Go back to Main Script   ####
if strcmpi(TITsrch,"<BACK>") == 1
	return
endif
###################################
while isempty(TITsrch)
	TITsrch = lower(input("Search for title: ","s"));
	####  Go back to Main Script   ####
	if strcmpi(TITsrch,"<BACK>") == 1
		return
	endif
	###################################
endwhile
# Start searching through TIT
for k = 1:length(sCATALOG)
	fprintf("%d ",k)
	if strfind(lower(sCATALOG(k).TIT),TITsrch) >= 1
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
