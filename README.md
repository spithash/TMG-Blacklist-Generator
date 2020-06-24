# TMG IP Blacklist XML Generator
A very simple bash script that I wrote to generate an XML IP blacklist so I can import it to Forefront TMG (Threat Management Gateway) URLSets or IP based blacklists. 

It's useful when you want to bulk import IPs to block. 

The list is constantly updated, huge shoutout to https://github.com/stamparm/ipsum

You need both files (sample_tmg.xml & TMG.sh) for it to work.

# Configuring
Create a folder in your home directory and just drop them there, then just change your destination directory at line #2 of TMG.sh and you're done. (or just clone the repo). 
You can chose between you're either creating an IP blacklist (default), or, a URLSet blacklist by commenting/uncommenting the lines that are described in the TMG.sh file.


Keep it updated using a cronjob or run it manually, it only takes a few seconds.

# Licence
<p><a href="https://github.com/spithash/TMG-Blacklist-Generator/blob/master/LICENSE">TMG.sh is GPLv3+.</a></p>

Enjoy :)

# Demo (URLSet)
![TMG.sh execution in linux terminal](https://github.com/spithash/trunk/blob/master/TMG.gif?raw=true)
