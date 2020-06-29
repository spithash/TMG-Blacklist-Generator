#!/bin/bash
# TMG IP Blacklist XML Generator

cd ~/TMG-Blacklist-Generator 
echo -e "\n"
echo -e "\e[1mFetching Blacklist\e[0m...\n"
wget https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt

echo -e "\e[1mRemoving Comments\e[0m"
	if sed -e '/^#/d' ipsum.txt > nocomments.txt ; then
		echo -e "\e[2mComments Removed\e[0m"
	else
		echo -e "Error: \e[91mCould not remove comments\e[0m" && exit 0
	fi

echo -e "\e[1mRemoving Lines That End With 10\e[0m"
	if sed -i '/10$/d' nocomments.txt ; then
		echo -e "\e[2mLines Containing 10s At The End Removed\e[0m"
	else
		echo -e "Error: \e[91mCould not remove 10's from file\e[0m" && exit 0
	fi

echo -e "\e[1mRemoving Unnecessary Numbers\e[0m"
	if sed 's/.$//' nocomments.txt > removed_digit_at_end.txt ; then
		echo -e "\e[2mCleaned Unnecessary Lines\e[0m"
	else
		echo -e "Error: \e[91mCould not remove digit at end\e[0m" && exit 0
	fi

echo -e "\e[1mRemoving Spaces & Tabs\e[0m"
	if sed 's/[[:blank:]]*$//' removed_digit_at_end.txt > removed_tabs_and_spaces.txt ; then
		echo -e "\e[2mCleaned Spaces & Tabs\e[0m"
	else
		echo -e "Error: \e[91mCould not clean spaces & tabs\e[0m" && exit 0
	fi

echo -e "\e[1mInserting Prefix\e[0m"
	if sed -e 's/^/<fpc4:Str dt:dt="string">http:\/\//' removed_tabs_and_spaces.txt > inserted_prefix.txt ; then
		echo -e "\e[2mDone Inserting Prefix\e[0m"
	else
		echo -e "Error: \e[91mCould not insert prefix\e[0m" && exit 0
	fi
 
echo -e "\e[1mInserting Suffix\e[0m"
	if awk '{print $0"</fpc4:Str>"}' inserted_prefix.txt > ip-blacklist.xml ; then
		echo -e "\e[2mDone Inserting Suffix\e[0m"
	else
		echo -e "Error: \e[91mCould not insert suffix\e[0m" && exit 0
	fi

echo -e "\e[1mAdding Proper Tabs\e[0m"
	if sed -i -e 's/^/\t\t\t\t\t\t/' ip-blacklist.xml ; then 
		echo -e "\e[2mAdded Proper Tabs\e[0m"
	else
		echo -e "Error: \e[91mCould not add tabs\e[0m" && exit 0
	fi

echo -e "\e[1mCleaning Trash Files\e[0m"
	if rm inserted_prefix.txt && rm ipsum.txt && rm nocomments.txt && rm removed_digit_at_end.txt && rm removed_tabs_and_spaces.txt ; then
		echo -e "\e[2mTrash Files Cleaned\e[0m"
	else
		echo -e "Error: \e[91mCould not clean trash files\e[0m" && exit 0
	fi

echo -e "\e[1mListing TempFile Size:\e[36m"
du -sh ip-blacklist.xml

	if sed '/<fpc4:URLStrings>/ r ip-blacklist.xml' sample_tmg.xml > final.xml ; then
		echo -e "\e[93mCombining XML files\e[0m"
	else
		echo -e "Error: \e[91mCould not combine files\e[0m" && exit 0
	fi

sleep 7

echo -e "\e[2mCleaning Temp XML File\e[0m"
rm ip-blacklist.xml

echo -e "\e[1mListing Final File Size:\e[36m"
du -sh final.xml

echo -e "\e[32mDone!\e[0m"
exit 0
