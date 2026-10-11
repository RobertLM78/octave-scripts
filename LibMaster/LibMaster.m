# Title: LibMaster.m - A port of the RBL classic program to OCTAVE
# Version: 2.0.0 - Oct 2026
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# About:
# -----------------------------------------------------------------------------
clear
LibMasterTitle = "LibMaster-2.0.0";
### Splash ###
splash(LibMasterTitle);
##############

####  Initializations  ####
clear,clc, close all
CONT = 1; KbIN = "0"; # CONTinue with the program; KeyboardINput
FileName = "--.dat"; RecNum = 0;
LibMasterTitle = "LibMaster-2.0.0";
menuPart1 = [LibMasterTitle;"Author Search";"Title Search";"Title Browser";"Subject Search"];
menuPart2 = ["Sort by Title";"Data Entry Mode";"Delete a Record";"Load File";"Save File"];
menuPart3 = ["Save & Quit";"Quit";"Help: display readme"];
global MenuItems = [menuPart1;menuPart2;menuPart3];
# Only change menuParts and final if clause, the script does the rest
noItems = rows(MenuItems) - 1; # Number of items in the menu ( -1 for title)
for k = 1:length(deblank(MenuItems(1,:))); # Create an underline for the title
	undrln(1,k) = "-";
end
clear menuPart1 menuPart2 menuPart3
RecNum = 0;
# Null variables if starting a new catalog or just haven't loaded one yet
sCATALOG(1:1) = struct("TIT","","AUT1","","AUT2","","AUT3","","SUBJ","","NTS","");  ## NEW ##
CAT{1,1} = "::::::;1"       ## DUMMY ##
###########################

#####  START Main Program Loop  ###############################################
while CONT ~= 0
	clc #clear screen upon returning to menu
	####  Display the menu & get user input  ####
	## Print the Menu ##
	fprintf("%s\n%s\n\n",MenuItems(1,:),undrln(1,:))
	for k = 2:rows(MenuItems)
 		fprintf("  [%s]  %s\n",char(k+63),MenuItems(k,:))  # +63 for uppercase starting with 'A'
	end
	fprintf("\n\nPress a menu item letter. ")
	## Wait for user input ##
	KbIN = lower(kbhit());
	## Check the input & keep trying until its right ##
	while double(KbIN) - 96 < 1  || double(KbIN) - 96 > noItems
		KbIN = lower(kbhit());
	endwhile
	#############################################

	####  Menu Option functions and quit routine  ####
	if KbIN == "a"
		##########################
		# OPTION A Author Search #
		##########################
    if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to search
      fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans
		else
      authorSearch(sCATALOG);
      CONT = 1;
    endif
	elseif KbIN == "b"
		#########################
		# OPTION B Title Search #
		#########################
    if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to search
      fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans
		else
		  titleSearch(sCATALOG);
		  CONT = 1;
    endif
	elseif KbIN == "c"
		##########################
		# OPTION C Title Browser #
		##########################
    if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to search
      fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans
		else
		  titleBrowse(sCATALOG,RecNum);
		  CONT = 1;
    endif
	elseif KbIN == "d"
		###########################
		# OPTION D Subject Search #
		###########################
    if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to search
      fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans
		else
		  subjSearch(sCATALOG);
		  CONT = 1;
    endif
	elseif KbIN == "e"
		##########################
		# OPTION E Sort by Title #
		##########################
		if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to sort
			fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans    # CONTinue back with the main loop
		else
			[sCATALOG,CAT] = fileSort(sCATALOG);
			CONT = 1;
		endif
	elseif KbIN == "f"
		#############################
		# OPTION F  Data Entry Mode #
		#############################
		[sCATALOG,CAT,RecNum] = fileUpdate(sCATALOG,CAT,RecNum);
		CONT = 1;
	elseif KbIN == "g"
		############################
		# OPTION G Delete a Record #
		############################
    if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to delete
      fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans
		else
		  [sCATALOG,CAT,RecNum] = recDel(sCATALOG,CAT,RecNum);
		  CONT = 1;
    endif
	elseif KbIN == "h"
		######################
		# OPTION H Load File #
		######################
		[CAT,RecNum,FileName] = fileLoad(CAT,RecNum,FileName);
    sCATALOG = CAT2struct(CAT);
		CONT = 1;
	elseif KbIN == "i"
		######################
		# OPTION I Save File #
		######################
		if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to save to file
			fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans    # CONTinue back with the main loop
		else
			FileName = fileSave(CAT,RecNum,FileName);    # If there is - do save
		endif
		CONT = 1;
	elseif KbIN == "j"
		########################
		# OPTION J Save & Quit #
		########################
		if strcmp(sCATALOG(1).TIT,"") == 1  # First check to see if there is anything to save to file
			fprintf("\n\nNo Data Entered.  Press any key to continue.")
			kbhit(); clear ans    # CONTinue back with the main loop
			CONT = 1;
		else
			FileName = fileSave(CAT,RecNum,FileName);     # If there is - do save
			CONT = 0; # Send the signal to quit (CONT ~= 0) == 0
      clc,clear; ## Housekeeping ##
      return      ## This is proper order: clc,clear **THEN** return
		endif
		clc;
	elseif KbIN == "k"
		#################
		# OPTION K QUIT #
		#################
		CONT = 0; # Send the signal to quit (CONT ~= 0) == 0
		clc,clear; ## Housekeeping ##
    return      ## This is proper order: clc,clear **THEN** return
	elseif KbIN == "l"
		##########################
		# OPTION L Help / readme #
		##########################
		 hlpFn();
		CONT = 1;
	endif
	##################################################

endwhile
#####  END Main Program Loop  #################################################
# ---------  EOF  -------------------------------------------------------------
