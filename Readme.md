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
  

## Lab 1 - Script Count File
Test the script
  
    cd /opt/dynatrace/oneagent/scripts
    ./CountFiles.ksh /opt/dynatrace/oneagent/scripts/testcountfiles
    
Apply the config
  
    {
      "metricname" : "File Count in /home/easytravel/testcountfiles",
      "frequency" : "1m",
      "timeout" : "10",
      "type" : "float",
      "shell": "",
      "command": "/opt/dynatrace/oneagent/scripts/CountFiles.ksh /opt/dynatrace/oneagent/scripts/testcountfiles"
    },
    
    
## Lab 2 - Apache status

Install appache 2 

    sudo apt install apache2
    sudo service apache2 start

Test the script

    cd /opt/dynatrace/oneagent/scripts
    /opt/dynatrace/oneagent/scripts/check_service_status.ksh apache2.service
  
Apply the config

     {
      "metricname" : "httpd.service status on message",
      "type" : "status_ko_ok_on_message",
      "frequency" : "1m",
      "timeout" : "30",
      "shell": "",
      "command": "/opt/dynatrace/oneagent/scripts/check_service_status.ksh httpd.service",
      "ok_pattern" : "Active: (.*?) \\((.*?)\\) since (.*?);",
      "ok_message" : "Service httpd is ${word1} in status ${word2} since ${word3}",
      "ko_pattern" : "Active: inactive \\((.*?)\\)",
      "ko_message" : "Service httpd is down with status ${word1}"
    }

After 2 minutes 

    sudo service apache2 stop

## Lab 3 - cft_status

Test the script

    cd /opt/dynatrace/oneagent/scripts
    /opt/dynatrace/oneagent/scripts/demo_metric.ksh
    
 Apply the config

 	{
		"metricname" : "cft_status",
		"type" : "status_ok_warning_critical",
		"frequency" : "1m",
		"timeout" : "10",
		"shell": "ksh",
		"command": "/opt/dynatrace/oneagent/scripts/demo_metric.ksh",
		"ok_pattern" : "Application: (.*?), Server: (.*?), Status: Ok",
		"ok_message" : "${word1} ${word2} server is OK",
		"warning_pattern" : "Application: (.*?), Server: (.*?), Status: Warning, ErrorCode: (.+)",
		"warning_message" : "Nouveau warning message ${word1} ${word2} server is in Warning status. Error code is : ${word3}",
		"critical_pattern" : "Application: (.*?), Server: (.*?), Status: Critical, ErrorCode: (.+)",
		"critical_message" : "${word1} ${word2} server is in Critial status. Error code is : ${word3}"
	}
    
After 2 minutes : 

     sudo cp demo_metric_warning.txt demo_metric.txt
     
     
5 minutes later :

     sudo cp demo_metric_critical.txt demo_metric.txt
    
