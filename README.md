# TMG IP Blacklist XML Generator
A very simple bash script that I wrote to generate an XML IP blacklist so I can import it to Forefront TMG (Threat Management Gateway) URLSets. 

It's useful when you want to bulk import IPs to block. 

The list is constantly updated, huge shoutout to https://github.com/stamparm/ipsum

You need both sample_tmg.xml for the script to work.

Create a folder and just drop them there, then just change your destination directory at line #2 of TMG.sh and you're done.
