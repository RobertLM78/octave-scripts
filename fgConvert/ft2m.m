# Title: ft2m.m - function for fgConvert.m
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: ft2m() or ft2m
# -----------------------------------------------------------------------------
function ft2m()
if (nargin ~= 0)
	help ft2m
	return
endif
ftTm = 1143/3750;
d = input("Enter the feet: ","s"); d = str2double(d);
while d < 0 || isnan(d)
	fprintf("Out of range: enter a postive distance.\n")
	d = input("Enter the feet: ","s"); d = str2double(d);
endwhile
D = ftTm*d;
fprintf("%0.2f feet is %0.2f meters.\n\n",d,D);
endfunction
# ------- EOF -----------------------------------------------------------------
