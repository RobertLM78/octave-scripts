# Title: subjSearch.m - A function for LibMaster
# Version: 0.1; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  subjSearch(TITle,AUThor,SUBJect,NoTeS,RecordNumbers)
# About:
# -----------------------------------------------------------------------------
function subjSearch(TIT,AUT,SUBJ,NTS,RecNum)
if (nargin ~= 5)
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
for k = 1:RecNum
	fprintf("%d ",k)
	system("sleep 0.025s");
	if findstr(lower(SUBJ{k,1}),SUBJsrch) >= 1
		fprintf("\n")
		fprintf("Title:  %s\n",TIT{k,1})
		fprintf("Author 1:   %s\n",AUT{k,1})
		fprintf("Author 2:   %s\n",AUT{k,2})
		fprintf("Author 3:   %s\n",AUT{k,3})
		fprintf("Subject:    %s\n",SUBJ{k,1})
		fprintf("Notes:      %s\n",NTS{k,1})
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
