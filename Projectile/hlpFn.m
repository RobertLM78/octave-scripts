# Title: hlpFn.m
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage: hlpFn(), hlpFn
# About: Help function - 'cat' the readme file to screen
# -----------------------------------------------------------------------------
function hlpFn()
if (nargin ~= 0)
	help hlpFn
	return
endif
hlpOut = input("(P)aged through less or (U)npaged?: ","s");
if isempty(hlpOut) == 1
	hlpOut = " ";
endif
hlpOut = hlpOut(1,1);
while hlpOut ~= "p" && hlpOut ~= "P" && hlpOut ~= "u" && hlpOut ~= "U"
	hlpOut = input("(P)aged through less or (U)npaged?: ","s");
	if isempty(hlpOut) == 1
		hlpOut = " ";
	endif
	hlpOut = hlpOut(1,1);
endwhile
switch hlpOut
case {"U","u"} # Don't pipe through 'less'
	system("cat ./readme");
	fprintf("Press any key to return to the menu.")
	kbhit(); fprintf("\n\n")
case {"P","p"} # Do pipe through 'less'
	system("cat ./readme | less"); # Brute force means to get paged output
endswitch
endfunction
# -------- EOF ----------------------------------------------------------------
