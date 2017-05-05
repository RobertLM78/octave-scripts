# Title: fgConvert.m - FlightGear pilot conversions
# Version: 1.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# About: Convert altitudes and distances between SI and BS - Also calculate the
#        descent distance for a given angle of descent.  Most code is based on
#        dConvert_m.m, so it will begin with a beta version number (1.0).
# -----------------------------------------------------------------------------
clear,clc,close all
# Initializations
Chs = 0;
menuPart1 = ["fgConvert-1.1";"Altitude: m to ft";"Altitude: ft to m";"Distance: km to mi";"Distance: mi to km"];
menuPart2 = ["Angle: dms to dec";"Angle: dec to dms";"Descent calculator";"Quit"];
MenuList = [menuPart1;menuPart2]; clear menuPart1 menuPart2
#####   Main Program Loop   ###################################################
while Chs ~= 8
	Chs = menu(MenuList);
	if Chs == 1     # Altitude: m to ft
		m2ft();
	elseif Chs == 2 # Altitude: ft to m
		ft2m();
	elseif Chs == 3 # Distance: km to mi
		km2mi();
	elseif Chs == 4 # Distance: mi to km
		mi2km();
	elseif Chs == 5 # Angle: dms to dec
		dms2dec();
	elseif Chs == 6 # Angle: dec to dms
		dec2dms();
	elseif Chs == 7 # Descent calculator
		descentCalc();
	elseif Chs == 8 # Quit the script and return to Octave
		clc
		fprintf("Returning to Octave...\n\n")
	endif
endwhile
# ------- EOF -----------------------------------------------------------------
