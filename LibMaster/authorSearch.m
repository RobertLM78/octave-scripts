# Title: authorSearch.m - A function for LibMaster
# Version: 0.1; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  authorSearch(TITle,AUThor,SUBJect,NoTeS,RecordNumbers)
# About:
# -----------------------------------------------------------------------------
function authorSearch(TIT,AUT,SUBJ,NTS,RecNum)
if (nargin ~= 5)
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
while isempty(AUTsrch)
	AUTsrch = lower(input("Search for author: ","s"));
####  Go back to Main Script   ####
if strcmpi(AUTsrch,"<BACK>") == 1
	return
endif
###################################
endwhile
# Start searching through AUT
for k = 1:RecNum
	fprintf("%d ",k)
	system("sleep 0.025s");
	for m = 1:3
		if findstr(lower(AUT{k,m}),AUTsrch) >= 1
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
end
fprintf("\n")
fprintf("Finsihed searching.  Press any key to continue.\n")
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
