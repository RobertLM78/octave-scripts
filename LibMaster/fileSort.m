# Title: fileSort.m - A function for LibMaster
# Version: 0.5; Sept 2026 ; Now with progress bar
# Author: Robert Lock - beannachtai@homtail.com
# License: GPL v3
# Usage:  CATalog = fileSort(CATalog,RecordNumbers)
# About: no changes written to file
# -----------------------------------------------------------------------------
function CAT = fileSort(CAT,RecNum)
if (nargin ~= 2)
	help fileSort
	return
endif
tic;  # Time this function
## Progress bar -- NEW ######################
pBar = waitbar(0, 'Processing...');
pBarStep = 5*RecNum;   #2*rows(TIT) + 3*RecNum;
pBarNum = 0;
#############################################
# Display title and name of function
clc;
global MenuItems
Topic = [deblank(MenuItems(1,:)),"  -  ","Sort by Title (no changes written)"];
for k = 1:length(deblank(Topic)); # Create an underline for the title
	undrln(1,k) = "-";
end
fprintf("%s\n%s\n\n",Topic,undrln)

# Break up CAT into the cell arrays
fprintf("Calling on strDiv routine...\n")
[TIT,AUT,SUBJ,NTS] = strDiv(CAT);

# 'Suffix' preceeding articles in title
N = 0;
fprintf("Removing preceeding articles from titles:\n")
for k = 1:rows(TIT)
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	TITtmp = TIT{k,1};
  # Check to see if title is less than "The " (4 characters) long
  if length(TITtmp) < 4
    TITtmp = [TITtmp,"  "];  # 2 extra spaces, just to be sure
  endif
	Art0chk = TITtmp(1,1:2) == "A ";
	Art2chk = TITtmp(1,1:3) == "An ";
	Art1chk = TITtmp(1,1:4) == "The ";
	# Place preceeding article in title at the end such that TITtmp="<Some title with leading 'The'>,The "
	if Art0chk == [1,1];
		N = N + 1;
		fprintf("%d ",N)
		TIT{k,1} = [TITtmp(1,3:length(TITtmp)),",",TITtmp(1,1:2)];
	elseif Art2chk == [1,1,1]
		N = N + 1;
		fprintf("%d ",N)
		TIT{k,1} = [TITtmp(1,4:length(TITtmp)),",",TITtmp(1,1:3)];
	elseif Art1chk == [1,1,1,1]
		N = N + 1;
		fprintf("%d ",N)
		TIT{k,1} = [TITtmp(1,5:length(TITtmp)),",",TITtmp(1,1:4)];
	endif
end
fprintf("\n\n")

# Concatenate CAT
fprintf("Calling on strCat routine...\n")
CAT = strCat(TIT,AUT,SUBJ,NTS);

# Break off record numbers
fprintf("Removing record numbers:\n")
for k = 1:RecNum
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	fprintf("%d ",k)
	[newStr,StrBal] = strtok(CAT{k},";");
	CAT{k,1} = newStr;
end
fprintf("\n\n")

# Alphabetize the catalog
CAT = sort(CAT);
fprintf("Alphabetizing: ")
for k = 1:RecNum
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	fprintf(". ")
end
fprintf("\n\n")

# Add the record numbers back
fprintf("Replacing record numbers:\n")
for k = 1:RecNum
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	fprintf("%d ",k)
	CAT{k,1} = [CAT{k,1},";",num2str(k)];
end
fprintf("\n\n")

# Break up CAT into the cell arrays
fprintf("Calling on strDiv routine...\n")
[TIT,AUT,SUBJ,NTS] = strDiv(CAT);

# 'Re-prefix' preceeding articles
N = 0;
fprintf("Replacing preceeding articles to titles:\n")
for k = 1:rows(TIT)
  ## Progress bar -- NEW ######################
  pBarNum += 1;
  waitbar(pBarNum/pBarStep,pBar);
  #############################################
	if strfind(TIT{k,:},",") > 1
		N = N + 1;
		fprintf("%d ",N)
		[newStr,StrBal] = strtok(TIT{k},",");
		[Art,StrBal] = strtok(StrBal,",");
		TIT{k,1} = [strtrim(Art)," ",strtrim(newStr)];
	endif
end
fprintf("\n\n")

# Concatenate CAT
fprintf("Calling on strCat routine...\n")
CAT = strCat(TIT,AUT,SUBJ,NTS);
fprintf("\n\n")
toc; # Print elapsed time
# Closing fprintf
fprintf("Catalog sorted.  Press any key to continue. ")
## Progress bar -- NEW ######################
  pause(0.75)
  close(pBar)
#############################################
kbhit(); clear ans
endfunction
# ------- EOF -----------------------------------------------------------------
