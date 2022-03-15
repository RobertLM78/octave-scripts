## Copyright (C) 2017 Robert B. Lock
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn  {Function File} {@var{selection} =} menu ([@var{menuitems}])
# Title: menu.m ; function Slctn = menu(MenuItems)
# Version: 0.2 - April 2017
# Author: Robert Lock - beannachtai-at-homtail.com
# License: GPL v3
# Usage:  selection = menu(["Title";"Option1";"Option2";....;"OptionN";"Quit"])
#         inputs a menu item list and outputs a selection from menu
# About:  A generic menu function for menu-driven scripts.  A primary goal of
#         this function will be to replace the default menu.m function that
#         comes bundled with GNU Octave.
# -----------------------------------------------------------------------------
function Slctn = menu(MenuItems)

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
