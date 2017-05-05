# Title: m2ft.m - function for fgConvert.m
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: m2ft() or m2ft
# -----------------------------------------------------------------------------
function m2ft()
if (nargin ~= 0)
	help m2ft
	return
endif
mTft = 3750/1143;
d = input("Enter the meters: ","s"); d = str2double(d);
while d < 0 || isnan(d)
	fprintf("Out of range: enter a postive distance.\n")
	d = input("Enter the meters: ","s"); d = str2double(d);
endwhile
D = mTft*d;
fprintf("%0.2f meters is %0.2f feet.\n\n",d,D);
endfunction
# ------- EOF -----------------------------------------------------------------
