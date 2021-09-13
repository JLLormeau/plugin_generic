# Plugin Generic

Git clone

    git clone https://github.com/JLLormeau/plugin_generic/
    cd plugin_generic
   
 
Install the plugin on linux host
   
    sudo apt install unzip
    sudo unzip custom.python.system_commands.zip -d /opt/dynatrace/oneagent/plugin_deployment/
    sudo service oneagent restart

Copy the script on

    sudo mkdir /opt/dynatrace/oneagent/scripts/
    sudo cp -rf  ./scripts_linux/* /opt/dynatrace/oneagent/scripts/
    chmod +x /opt/dynatrace/oneagent/scripts/*.ksh
  

##Lab 1 - Script Count File
test the script
  
    cd /opt/dynatrace/oneagent/scripts
    ./CountFiles.ksh /opt/dynatrace/oneagent/scripts/testcountfiles
    
Apply the config
  
    {
    "metricname" : "File Count in /home/easytravel/testcountfiles",
    "type" : "float",
    "shell": "ksh",
    "command": "/opt/dynatrace/oneagent/scripts/CountFiles.ksh /opt/dynatrace/oneagent/scripts/testcountfiles"
    }


Script 2 

    sudo apt install apache2
    sudo service apache2 start
  
    cd /opt/dynatrace/oneagent/scripts
    /opt/dynatrace/oneagent/scripts/check_service_status.ksh httpd.service
  
  
 Config 2
 
    {
    "metricname" : "httpd.service status",
    "type" : "status_ko_ok",
    "frequency" : "1",
    "shell": "ksh",
    "command": "/opt/dynatrace/oneagent/scripts/check_service_status.ksh httpd.service",
    "ok_pattern" : "Active: (.*?) \\((.*?)\\) since (.*?);",
    "ok_message" : "Service httpd is ${word1} in status ${word2} since ${word3}",
    "ko_pattern" : "Active: inactive \\((.*?)\\)",
    "ko_message" : "Service httpd is down with status ${word1}"
    }

