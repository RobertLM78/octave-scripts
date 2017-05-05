# Title: dms2dec.m - function for fgConvert.m
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: dms2dec() or dms2dec
# -----------------------------------------------------------------------------
function dms2dec()
if (nargin ~= 0)
	help dms2dec
	return
endif
Degs = input("Angle degrees (0-180⁰, no decimals): ","s");
DegTmp = Degs; Degs = str2double(Degs);
while Degs < 0 || Degs > 180 || isnan(Degs) || any(toascii(DegTmp) == 46)
	fprintf("Out of range: 0 and 180 degrees, please.\n")
	Degs = input("Angle degrees (0-180⁰, no decimals): ","s");
	DegTmp = Degs; Degs = str2double(Degs);
endwhile
minutes = input("Angle minutes (0-59, no decimals): ","s");
minTmp = minutes; minutes = str2double(minutes);
while minutes < 0 || minutes > 59 || isnan(minutes) || any(toascii(minTmp) == 46)
	fprintf("Out of range: 0 and 59 minutes, please.\n")
	minutes = input("Angle minutes (0-59, no decimals): ","s");
	minTmp = minutes; minutes = str2double(minutes);
endwhile
seconds = input("Angle seconds (0-<60, may have decimal): ","s"); seconds = str2double(seconds);
while seconds < 0 || seconds >= 60 || isnan(seconds) # okay as decimal
	fprintf("Out of range: 0 and 60 seconds, please.\n")
	seconds = input("Angle seconds (0-<60, may have decimal): ","s"); seconds = str2double(seconds);
endwhile
dcml1 = minutes/60;
dcml2 = seconds/3600;
DcmlAng = Degs + dcml1 + dcml2;
fprintf("%d⁰ %d' %0.5f"" is %0.5f degrees.\n\n",Degs,minutes,seconds,DcmlAng)
endfunction
