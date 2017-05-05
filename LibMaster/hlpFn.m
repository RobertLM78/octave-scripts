# Title: hlpFn.m
# Version: 0.3 - May 2017
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
fprintf("\n")
hlpOut = "0";
fprintf("(P)aged through less or (U)npaged? ")
while hlpOut ~= "P" && hlpOut ~= "p" && hlpOut ~= "U" && hlpOut ~= "u"
	hlpOut = kbhit();
	if hlpOut == "P"|| hlpOut == "p" # Do pipe through 'less'
		system("cat ./readme | less"); # Brute force means to get paged output
	elseif hlpOut == "U" || hlpOut == "u" # Don't pipe through 'less'
		fprintf("\n")
		system("cat ./readme");
		fprintf("Press any key to return to the menu.")
		kbhit(); fprintf("\n\n")
	endif
endwhile
endfunction
# -------- EOF ----------------------------------------------------------------
