# Title: titleSearch.m - A function for LibMaster
# Version: 0.1; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  titleSearch(TITle,AUThor,SUBJect,NoTeS,RecordNumbers)
# About:
# -----------------------------------------------------------------------------
function titleSearch(TIT,AUT,SUBJ,NTS,RecNum)
if (nargin ~= 5)
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
endwhile
# Start searching through TIT
for k = 1:RecNum
	fprintf("%d ",k)
	system("sleep 0.025s");
	if findstr(lower(TIT{k,1}),TITsrch) >= 1
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
fprintf("Finsihed searching.  Press any key to continue.\n")
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
