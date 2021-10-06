# bashcuts
Shortcuts using bashrc or bash_profile files.

You may not already have a .bashrc file on your system. To create one, open a bash terminal and use the paste the below command in the terminal or create a new file in your user directory with the name  **.bashrc**

**touch ~/.bashrc** 

You can also use the .bash_profile file instead of the .bashrc.

To get started, add the below content and associated logic to the your .bashrc file and from there it will load up all the aliases and functions referenced from the .bcut_home file. The "NEW_SUPPORT_TICKET_URL" variable is referenced in the shortcuts file ".supportcuts" and when we enter "new-support-ticket" it will open a browser with that whatever url we set that variable to:


		populate-custom-supportcuts-variables() {
			NEW_SUPPORT_TICKET_URL="https://myoganizations-supportdesk.supporting"
		}

		PATH_TO_BASHCUTS="/path/to/your/githubbachcuts/location"
		if [ -f $PATH_TO_BASHCUTS/bashcuts/.bcut_home ]; 
		then 
		    echo "bashrc loaded"
			populate-custom-supportcuts-variables
		    source $PATH_TO_BASHCUTS/bashcuts/.bcut_home
		else
		    echo "missing bashrc"
		fi
