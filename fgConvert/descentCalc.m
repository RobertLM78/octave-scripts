# Title: descentCalc.m - function for fgConvert.m
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: descentCalc() or descentCalc
# -----------------------------------------------------------------------------
function descentCalc()
if (nargin ~= 0)
	help descentCalc
	return
endif
DcntAng = input("Descent Angle (5-10⁰): ","s"); DcntAng = str2double(DcntAng);
while DcntAng < 5 || DcntAng > 10 || isnan(DcntAng)
	fprintf("Out of range: 5 and 10 degrees, please.\n")
	DcntAng = input("Descent Angle (5-10⁰): ","s"); DcntAng = str2double(DcntAng);
endwhile
Altitude = input("Altitude (in feet): ","s"); Altitude = str2double(Altitude);
while Altitude < 0 || Altitude > 50000 || isnan(Altitude)
	fprintf("Out of range: Between 0 and 50000 feet.\n")
	Altitude = input("Altitude (in feet): ","s"); Altitude = str2double(Altitude);
endwhile
Elevation = input("Elevation (in feet): ","s"); Elevation = str2double(Elevation);
while Elevation < 0 || Elevation > 50000 || isnan(Elevation)
	fprintf("Out of range: Between 0 and 50000 feet.\n")
	Elevation = input("Elevation (in feet): ","s"); Elevation = str2double(Elevation);
endwhile
while Elevation > Altitude  #  If user has borked altitude/elevation entries, try again
	fprintf("Elevation greater than altitude.\n")
	Altitude = input("Altitude (in feet): ","s"); Altitude = str2double(Altitude);
	while Altitude < 0 || Altitude > 50000 || isnan(Altitude)
		fprintf("Out of range: Between 0 and 50000 feet.\n")
		Altitude = input("Altitude (in feet): ","s"); Altitude = str2double(Altitude);
	endwhile
	Elevation = input("Elevation (in feet): ","s"); Elevation = str2double(Elevation);
	while Elevation < 0 || Elevation > 50000 || isnan(Elevation)
		fprintf("Out of range: Between 0 and 50000 feet.\n")
		Elevation = input("Elevation (in feet): ","s"); Elevation = str2double(Elevation);
	endwhile
endwhile
dDistance = (Altitude - Elevation)/tand(DcntAng)*1/5280;
fprintf("The descent should begin %0.2f miles \n(%0.2f km) away from destination.\n\n",dDistance,201168/125000*dDistance)
endfunction
# ------- EOF -----------------------------------------------------------------
