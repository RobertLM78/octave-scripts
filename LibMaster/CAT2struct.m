# Title: CAT2struct.m - A function for LibMaster
# Version: 0.1; Oct 2026
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: sCATALOG = CAT2struct(CAT)
# About: CAT-2-Structure - strtok CAT array into sCATALOG structure
# Notes: This function is not passed RecNum for input arg.
# -----------------------------------------------------------------------------
function sCATALOG = CAT2struct(CAT)
if (nargin ~= 1)
	help CAT2struct
	return
endif

# Preallocate structure
sCATALOG(1:rows(CAT)) = struct(
  "TIT","",
  "AUT1","",
  "AUT2","",
  "AUT3","",
  "SUBJ","",
  "NTS",""
);

# Break up CAT into the cell arrays
for k = 1:rows(CAT)
	# Break off Titles into sCATALOG(k).TIT
	[newStr,StrBal] = strtok(CAT{k},":");
	sCATALOG(k).TIT = newStr;
	# Break off the Authors into sCATALOG.AUT#
  [newStr,StrBal] = strtok(StrBal,":");
  sCATALOG(k).AUT1 = newStr;
  [newStr,StrBal] = strtok(StrBal,":");
  sCATALOG(k).AUT2 = newStr;
  [newStr,StrBal] = strtok(StrBal,":");
  sCATALOG(k).AUT3 = newStr;
	# Break off Subjects into sCATALOG.SUBJ
	[newStr,StrBal] = strtok(StrBal,":");
	sCATALOG(k).SUBJ = newStr;
	# Break off Notes into (rows(CAT) x 1) cell 'NTS'
	[newStr,StrBal] = strtok(StrBal,":");
	sCATALOG(k).NTS = newStr;
end
endfunction
# ------- EOF -----------------------------------------------------------------
