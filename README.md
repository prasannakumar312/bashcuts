# bashcuts
Shortcuts using bashrc or bash_profile files.

You may not already have a .bashrc file on your system. To create one, open a bash terminal and use the paste the command "touch ~/.bashrc" in the terminal.

You can also use the .bash_profile file isntead of the .bashrc.

To get started, add the below logic to the your .bashrc file and from there it will load up all the aliases and functions referenced from the .bcut_home file


    if [ -f /path_to_where_the_repo_lives_locally/bashcuts/.bcut_home ]; 
    then 
        echo "heyooo bashrc"
        source /path_to_where_the_repo_lives_locally/bashcuts/.bcut_home; 
    else
        echo "noooo bashrc"
    fi


