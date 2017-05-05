# Title: mi2km.m - function for fgConvert.m
# Version: 0.3 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: mi2km() or mi2km
# -----------------------------------------------------------------------------
function mi2km()
if (nargin ~= 0)
	help mi2km
	return
endif
miTkm = 201168/125000;
d = input("Enter the miles: ","s"); d = str2double(d);
while d < 0 || isnan(d)
	fprintf("Out of range: enter a postive distance.\n")
	d = input("Enter the miles: ","s"); d = str2double(d);
endwhile
D = miTkm*d;
fprintf("%0.2f miles is %0.2f kilometers.\n\n",d,D);
endfunction
# ------- EOF -----------------------------------------------------------------
