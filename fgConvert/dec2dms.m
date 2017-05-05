# Title: dec2dms.m - function for fgConvert.m
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: dec2dms() or dec2dms
# -----------------------------------------------------------------------------
function dec2dms()
if (nargin ~= 0)
	help dec2dms
	return
endif
DcmlAng = input("Angle in decimal degrees (0-180⁰): ","s"); DcmlAng = str2double(DcmlAng);
while DcmlAng < 0 || DcmlAng > 180 || isnan(DcmlAng)
	fprintf("Out of range: 0 and 180 degrees, please.\n")
	DcmlAng = input("Angle in decimal degrees (0-180⁰): ","s"); DcmlAng = str2double(DcmlAng);
endwhile
# Get the integer part
intgr = fix(DcmlAng);
Dcml = DcmlAng - intgr;
# Get the minutes
minutestmp = Dcml * 60;
minutes = fix(minutestmp);
minutesDcml = minutestmp - minutes;
clear minutestmp
# Get the seconds
seconds = minutesDcml * 60;
fprintf("%0.5f degrees is %d⁰ %d' %0.5f"".\n\n",DcmlAng,intgr,minutes,seconds)
endfunction
