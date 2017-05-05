##########################   SPLASH - LibMaster.m     #########################
# Title: splash.m - A generic splash screen
# Version: 0.1 - May 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# -----------------------------------------------------------------------------
function splash()
if nargin ~= 0
	help splash
endif
clc; clear all
fprintf("Library Master 1.1; Copyright (C) 2017  Robert Lock (RobertLM78) - beannachtai@hotmail.com\n")
fprintf("This program comes with ABSOLUTELY NO WARRANTY; for details press 'w'.\n")
fprintf("This is free software, and you are welcome to redistribute it\n")
fprintf("under certain conditions; press `c' for details.  Otherwise press any key.")

KbIN = (kbhit()); KbIN = lower(KbIN);

if KbIN == "c"
	#######################
    # OPTION C Conditions #
	#######################
	fprintf("\n\n")
	fprintf("Library Master 1.1 - A port of the RBL classic program to OCTAVE\n")
	fprintf("Copyright (C) 2017  Robert Lock (RobertLM78)\n\n")
	fprintf("This program is free software: you can redistribute it and/or modify\n")
	fprintf("it under the terms of the GNU General Public License as published by\n")
	fprintf("the Free Software Foundation, either version 3 of the License, or\n")
	fprintf("(at your option) any later version.\n\n")
	fprintf("Press 'w' for warranty or any key to continue. "); KbIN = (kbhit()); KbIN = lower(KbIN);
	if KbIN == "w"
		fprintf("\n\n")
		fprintf("This program is distributed in the hope that it will be useful,\n")
		fprintf("but WITHOUT ANY WARRANTY; without even the implied warranty of\n")
		fprintf("MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n")
		fprintf("GNU General Public License for more details.\n\n")
		fprintf("You should have received a copy of the GNU General Public License\n")
		fprintf("along with this program.  If not, see <http://www.gnu.org/licenses/>.\n\n")
		fprintf("Press any key to continue. "); kbhit(); clear ans
	endif
elseif KbIN == "w"
	######################
	# OPTION W Warranty  #
	######################
	fprintf("\n\n")
	fprintf("This program is distributed in the hope that it will be useful,\n")
	fprintf("but WITHOUT ANY WARRANTY; without even the implied warranty of\n")
	fprintf("MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n")
	fprintf("GNU General Public License for more details.\n\n")
	fprintf("You should have received a copy of the GNU General Public License\n")
	fprintf("along with this program.  If not, see <http://www.gnu.org/licenses/>.\n\n")
	fprintf("Press 'c' for conditions or any key to continue. "); KbIN = (kbhit()); KbIN = lower(KbIN);
	if KbIN == "c"
		fprintf("\n\n")
		fprintf("Library Master 1.1 - A port of the RBL classic program to OCTAVE\n")
		fprintf("Copyright (C) 2017  Robert Lock (RobertLM78)\n\n")
		fprintf("This program is free software: you can redistribute it and/or modify\n")
		fprintf("it under the terms of the GNU General Public License as published by\n")
		fprintf("the Free Software Foundation, either version 3 of the License, or\n")
		fprintf("(at your option) any later version.\n\n")
		fprintf("Press any key to continue. "); kbhit(); clear ans
	endif
endif
clc
endfunction
# --- EOF ---------------------------------------------------------------------
