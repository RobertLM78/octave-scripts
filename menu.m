function Slctn = menu(MenuItems)
# Title: menu.m ; function Slctn = menu(MenuItems)
# Version: 0.1 - April 2017
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  menu(["Title";"Option1";"Option2";....;"OptionN";"Quit"])
#         inputs a menu item list and outputs a selection from menu
# About:  A generic menu function for menu-driven scripts.  A primary goal of
#         this function will be to replace the default menu.m function that
#         comes bundled with GNU Octave.
#         (This function has 27 lines of working code)
# -----------------------------------------------------------------------------
if (nargin ~= 1)
	print_usage ();
endif

for k = 1:length(deblank(MenuItems(1,:)));  # Create an underline for the title
	undrln(1,k) = "-";
end
noItems = rows(MenuItems) - 1;     # Number of items in the menu ( -1 for title)
# Print the Menu --------------------------------------------------------------
fprintf("%s\n%s\n\n",MenuItems(1,:),undrln(1,:))
for k = 2:rows(MenuItems);
	fprintf("  [%d]  %s\n",(k-1),MenuItems(k,:))
end
Slctn = input("Choose an item: ","s");
SlctnChk = Slctn;
Slctn = str2double(Slctn);
fprintf("\n")
# Check the input and try again
while Slctn < 1 || Slctn > noItems || any(toascii(SlctnChk) == 46)
	fprintf("%s\n%s\n\n",MenuItems(1,:),undrln(1,:))
	for k = 2:rows(MenuItems);
		fprintf("  [%d]  %s\n",(k-1),MenuItems(k,:))
	end
	Slctn = input("Choose an item: ","s");
	SlctnChk = Slctn;
	Slctn = str2double(Slctn);
	fprintf("\n")
endwhile
# -----------------------------------------------------------------------------
endfunction
# ------- EOF -----------------------------------------------------------------
