# Title: strCat.m - A function for LibMaster
# Version: 0.1; May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  CAT = strCat(TIT,AUT,SUBJ,NTS)
# About: String conCatenate - concatenate TIT,AUT,etc strings into CAT
# Notes: This function is not passed RecNum for input arg.
# -----------------------------------------------------------------------------
function CAT = strCat(TIT,AUT,SUBJ,NTS)
if (nargin ~= 4)
	help strCat
	return
endif
for k = 1:rows(TIT)
	CAT{k,1} = [TIT{k,1},":",AUT{k,1},":",AUT{k,2},":",AUT{k,3},":",SUBJ{k,1},":",NTS{k,1},":;",num2str(k)];
end
endfunction
# ------- EOF -----------------------------------------------------------------
