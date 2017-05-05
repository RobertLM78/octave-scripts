# Title: strDiv.m - A function for LibMaster
# Version: 0.1; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  [CAT,TIT,AUT,SUBJ,NTS] = strDiv(CAT)
# About: String Divide - strtok CAT strings into appropriate cell arrays
# Notes: This function is not passed RecNum for input arg.
# -----------------------------------------------------------------------------
function [TIT,AUT,SUBJ,NTS] = strDiv(CAT)
if (nargin ~= 1)
	help strDiv
	return
endif
# Break up CAT into the cell arrays
for k = 1:rows(CAT)
	# Break off Titles into (rows(CAT) x 1) cell 'TIT'
	[newStr,StrBal] = strtok(CAT{k},":");
	TIT{k,1} = newStr;
	# Break off the Authors into (rows(CAT) x 3) cell 'AUT'
	for q = 1:3
		[newStr,StrBal] = strtok(StrBal,":");
		AUT{k,q} = newStr;
	end
	# Break off Subjects into (rows(CAT) x 1) cell 'SUBJ'
	[newStr,StrBal] = strtok(StrBal,":");
	SUBJ{k,1} = newStr;
	# Break off Notes into (rows(CAT) x 1) cell 'NTS'
	[newStr,StrBal] = strtok(StrBal,":");
	NTS{k,1} = newStr;
end
endfunction
# ------- EOF -----------------------------------------------------------------
