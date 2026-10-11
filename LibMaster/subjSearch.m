# Title: subjSearch.m - A function for LibMaster
# Version: 0.3; Oct 2026 (upgrade to structure)
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  subjSearch(sCATALOG)
# About:
# -----------------------------------------------------------------------------
function subjSearch(sCATALOG)
if (nargin ~= 1)
	help subjSearch
	return
endif
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Subject Search"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)
fprintf("Subjects are: ART,FICtion,HistoricalFictioN,HiSTory,IREland,MUSic,GeneralNonFiction\n")
fprintf("              POLitics,PoeTrY,REFerence,RELigion,SCIence,SCoTland,TeXT\n\n")

# Enter a subject to look for
SUBJsrch = lower(input("Search for subject: ","s"));
####  Go back to Main Script   ####
if strcmpi(SUBJsrch,"<BACK>") == 1
	return
endif
###################################
while isempty(SUBJsrch)
	SUBJsrch = lower(input("Search for subject: ","s"));
	####  Go back to Main Script   ####
	if strcmpi(SUBJsrch,"<BACK>") == 1
		return
	endif
	###################################
endwhile
# Start searching through SUBJ
for k = 1:length(sCATALOG)
	fprintf("%d ",k)
	if strfind(lower(sCATALOG(k).SUBJ),SUBJsrch) >= 1
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
