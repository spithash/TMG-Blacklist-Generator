#!/bin/bash

cd ~/TMG-Blacklist-Generator

echo -e "\e[1mFetching Blacklist\e[0m..."
wget https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt

echo -e "Removing \e[1mComments\e[0m"
sed -e '/^#/d' ipsum.txt > nocomments.txt
echo -e "\e[2mComments Removed\e[0m"

echo -e "Removing \e[1mLines That End With 10\e[0m"
sed -i '/10$/d' nocomments.txt
echo -e "\e[2mLines Containing 10s At The End Removed\e[0m"

echo -e "Removing \e[1mUnnecessary Numbers\e[0m"
sed 's/.$//' nocomments.txt > removed_digit_at_end.txt
echo -e "\e[2mCleaned Unnecessary Lines\e[0m"

echo -e "Removing \e[1mSpaces & Tabs\e[0m"
sed 's/[[:blank:]]*$//' removed_digit_at_end.txt > removed_tabs_and_spaces.txt
echo -e "\e[2mCleaned Spaces & Tabs\e[0m"

#####################################################
# Chose between the 2 options, you can't have both! #
#####################################################
echo -e "Inserting \e[1mFirst Prefix\e[0m"
# Use below line if you're adding IPs
sed -e 's/^/<fpc4:Str dt:dt="string">/' removed_tabs_and_spaces.txt > inserted_prefix.txt

# Use below line if you're adding URLSets 
#sed -e 's/^/<fpc4:Str dt:dt="string">http:\/\//' removed_tabs_and_spaces.txt > inserted_prefix.txt
echo -e "\e[2mDone Inserting Prefix\e[0m"
#####################################################

echo -e "Inserting \e[1mSuffix\e[0m"
awk '{print $0"</fpc4:Str>"}' inserted_prefix.txt > ip-blacklist.xml
echo -e "\e[35mDone Inserting Suffix\e[0m"

echo -e "Adding \e[1mProper Tabs\e[0m"
sed -i -e 's/^/\t\t\t\t\t\t/' ip-blacklist.xml
echo -e "\e[2mAdded Proper Tabs\e[0m"

echo -e "\e[93mCleaning Trash Files\e[0m"
rm inserted_prefix.txt
rm ipsum.txt
rm nocomments.txt
rm removed_digit_at_end.txt
rm removed_tabs_and_spaces.txt
echo -e "\e[93mTrash Files Cleaned\e[0m"

echo -e "\e[93mListing TempFile:\e[0m"
du -sh ip-blacklist.xml

echo -e "\e[91mCombining XML Files\e[0m"
sed '/<fpc4:URLStrings>/ r ip-blacklist.xml' sample_tmg.xml > final.xml

sleep 7

echo -e "\e[93mCleaning Temp XML File\e[0m"
rm ip-blacklist.xml

echo -e "\e[93mListing Final File:\e[0m"
du -sh final.xml

echo -e "\e[32mDone!\e[0m"
exit 0
