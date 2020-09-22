# TMG IP Blacklist XML Generator
A very simple bash script that I wrote to generate an XML IP blacklist so I can import it to Forefront TMG (Threat Management Gateway) URLSets. 

It's useful when you want to bulk import IPs to block. 

The list is constantly updated, huge shoutout to https://github.com/stamparm/ipsum

You need both files (sample_tmg.xml & TMG.sh) for it to work.

# Configuring - Importing/Exporting
Create a folder in your home directory and just drop the files there, then just change your destination directory at line #3 of TMG.sh and you're done. (or just clone the repo). 

You probably need to create your own sample_tmg.xml at some point and replace the contents of the file. To do that, go to Forefront TMG Management and just create an empty URLset in Web Access Policy > Toolbox > URL Sets > New > URL set. 
After that, right click on it from the list of the URLsets which are in the Toolbox list on the right and export it, it's an XML file. Paste its contents into sample_tmg.xml and when you run TMG.sh, it will use that sample to create the final.xml file.

More info on exporting the sample XML and also on importing the final.xml that you will generate can be found on this tutorial over here https://github.com/spithash/trunk/wiki/This-tutorial-is-written-to-help-TMG-administrator-to-upload-URL-Sets-the-easiest-way
# Licence
<p><a href="https://github.com/spithash/TMG-Blacklist-Generator/blob/master/LICENSE">TMG.sh is GPLv3+.</a></p>

Enjoy :)

# Demo (URLSet)
![TMG.sh execution in linux terminal](https://github.com/spithash/trunk/blob/master/TMG.gif?raw=true)
