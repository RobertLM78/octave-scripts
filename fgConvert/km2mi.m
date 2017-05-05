# Title: km2mi.m - function for fgConvert.m
# Version: 0.3 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: km2mi() or km2mi
# -----------------------------------------------------------------------------
function km2mi()
if (nargin ~= 0)
	help km2mi
	return
endif
kmTmi = 125000/201168;
d = input("Enter the kilometers: ","s"); d = str2double(d);
while d < 0 || isnan(d)
	fprintf("Out of range: enter a postive distance.\n")
	d = input("Enter the kilometers: ","s"); d = str2double(d);
endwhile
D = kmTmi*d;
fprintf("%0.2f kilometers is %0.2f miles.\n\n",d,D);
endfunction
# ------- EOF -----------------------------------------------------------------
