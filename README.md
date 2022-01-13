# bashcuts
Shortcuts using bashrc or bash_profile files. Many of the shortcuts provide prompts to support populated necessary arguments/flags to make the functions work

You may not already have a .bashrc file on your system. To create one, open a bash terminal and use the paste the below command in the terminal or create a new file in your user directory with the name  **.bashrc**

**touch ~/.bashrc** 

You can also use the .bash_profile file instead of the .bashrc.

To get started, add the below content and associated logic to the your .bashrc file and from there it will load up all the aliases and functions referenced from the .bcut_home file. The "NEW_SUPPORT_TICKET_URL" variable is referenced in the shortcuts file ".supportcuts" and when we enter "new-support-ticket" it will open a browser with that whatever url we set that variable to:


		populate-custom-supportcuts-variables() {
	        	NEW_SUPPORT_TICKET_URL="https://myoganizations-supportdesk.supporting"
		}

		PATH_TO_BASHCUTS="/path/to/your/githubbashcuts/location"
		if [ -f $PATH_TO_BASHCUTS/bashcuts/.bcut_home ]; 
		then 
		    echo "bashrc loaded"
		    populate-custom-supportcuts-variables
		    source $PATH_TO_BASHCUTS/bashcuts/.bcut_home
		else
		    echo "missing bashrc"
		fi
		
# To See Where Shortcuts our Loaded and may be available
* enter "o-bcut-bashrc" in a bash terminal
* To see alias' and associated functions, in bash terminal, type "o-" and then press tab to see options of each file of shortcuts  

# Tools used within these alias shortcuts

* Powershell 7 (and higher) - Installation instructions by operating system: https://github.com/powershell/powershell#get-powershell
* Python 3
   1. Download the latest version of python here: https://www.python.org/downloads/ 
     1. Be sure to select "Add to PATH" when prompted in the install/setup window
   1. After installing we will we will need to restart our machine
   1. Confirm successful install by opening up a terminal and typing "**python --version**"
* GitHub CLI: https://cli.github.com/
* CumulusCI: https://cumulusci.readthedocs.io/en/stable/
* sfdx plugins:
  * sfdx scanner: https://forcedotcom.github.io/sfdx-scanner/
  * sfdx texei: https://github.com/texei/texei-sfdx-plugin
  * sfdx shane-plugins: https://github.com/mshanemc/shane-sfdx-plugins




