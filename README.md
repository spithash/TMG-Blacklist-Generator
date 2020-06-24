# TMG IP Blacklist XML Generator
A very simple bash script that I wrote to generate an XML IP blacklist so I can import it to Forefront TMG (Threat Management Gateway) URLSets. 

It's useful when you want to bulk import IPs to block. 

The list is constantly updated, huge shoutout to https://github.com/stamparm/ipsum

You need both files (sample_tmg.xml & TMG.sh) for it to work.

Create a folder in your home directory and just drop them there, then just change your destination directory at line #2 of TMG.sh and you're done. (or just clone the repo)

Keep it updated using a cronjob or run it manually, it only takes a few seconds.

<p><a href="https://github.com/spithash/TMG-Blacklist-Generator/blob/master/LICENSE">TMG.sh is GPLv3+.</a></p>

Enjoy :)


![alt text](https://github.com/spithash/trunk/blob/master/TMG.gif?raw=true)
