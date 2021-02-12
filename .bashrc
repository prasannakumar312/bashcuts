

if [ -f /c/git/bashcuts/bashcuts/.bash_commons ]; 
then 
    echo "heyooo commons"
    source /c/git/bashcuts/bashcuts/.bash_commons; 
else
    echo "noooo commons"
fi

if [ -f /c/git/bashcuts/bashcuts/.sfdxcli_bashcuts ]; 
then 
    echo "heyooo sfdxcli"
    source /c/git/bashcuts/bashcuts/.sfdxcli_bashcuts; 
else
    echo "noooorrr sfdxcli"
fi


if [ -f /c/git/bashcuts/bashcuts/.gitcli_bashcuts ]; 
then 
    echo "heyooo gitcli"
    source /c/git/bashcuts/bashcuts/.gitcli_bashcuts; 
else
    echo "noooo gitcli_bashcuts"
fi


if [ -f /c/git/bashcuts/bashcuts/.ghcli_bashcuts ]; 
then 
    echo "heyooo gh"
    source /c/git/bashcuts/bashcuts/.ghcli_bashcuts; 
else
    echo "noooo ghcli_bashcuts"
fi

if [ -f /c/git/bashcuts/bashcuts/.open_bashcuts ]; 
then 
    echo "heyooo open"
    source /c/git/bashcuts/bashcuts/.open_bashcuts; 
else
    echo "noooo open_bashcuts"
fi

if [ -f /c/git/bashcuts/bashcuts/.ccicli_bashcuts ]; 
then 
    echo "heyooo cci"
    source /c/git/bashcuts/bashcuts/.ccicli_bashcuts; 
else
    echo "noooo ccicli_bashcuts"
fi











