# Python
Status.json :  API status page 
Script.py : Actual Script file 
serverFile : File which contains actual host names 

# useage:
we need to pass the "serverFile" while invoking the script

example: ./Script.py serverFile

# SCRIPT:

    # Modules used:
    import sys       
    import os
    from urllib.error import URLError, HTTPError
    import json
    import requests
    
    # Statement 1:
    script will check for the length of the file that we passed along with script file if the specified file doesnt exit in the directory       returns error as "file does not exists. Exiting"
    
    # Statement 2:
     Read the server file for hostnames and checks for the status by using the API url specified .
     It will Retrive the JSON data from the status page and dumps the output into stdout.log and also produce the output to output.txt
    
     
