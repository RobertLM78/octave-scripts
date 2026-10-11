# Title: struct2CAT.m - A function for LibMaster
# Version: 0.1; Oct 2026
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  CAT = struct2CAT(sCATALOG)
# About: Build CAT array from sCATALOG structure
# Notes: This function is not passed RecNum for input arg.
# -----------------------------------------------------------------------------
function CAT = struct2CAT(sCATALOG)
if (nargin ~= 1)
	help struct2CAT
	return
endif
for k = 1:length(sCATALOG)
	CAT{k,1} = [sCATALOG(k).TIT,":",sCATALOG(k).AUT1,":",sCATALOG(k).AUT2,":",sCATALOG(k).AUT3,":",sCATALOG(k).SUBJ,":",sCATALOG(k).NTS,":;",num2str(k)];
end
endfunction
# ------- EOF -----------------------------------------------------------------
