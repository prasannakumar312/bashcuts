
if [ -f bashcuts/.bash_commons ]; 
then 
    echo "heyooo commons"
    source bashcuts/.bash_commons; 
else
    echo "noooo commons"
fi

if [ -f bashcuts/.sfdxcli_bashcuts ]; 
then 
    echo "heyooo sfdxcli"
    source bashcuts/.sfdxcli_bashcuts; 
else
    echo "noooorrr sfdxcli"
fi


if [ -f bashcuts/.gitcli_bashcuts ]; 
then 
    echo "heyooo gitcli"
    source bashcuts/.gitcli_bashcuts; 
else
    echo "noooo gitcli_bashcuts"
fi


if [ -f bashcuts/.ghcli_bashcuts ]; 
then 
    echo "heyooo gh"
    source bashcuts/.ghcli_bashcuts; 
else
    echo "noooo ghcli_bashcuts"
fi

if [ -f bashcuts/.open_bashcuts ]; 
then 
    echo "heyooo open"
    source bashcuts/.open_bashcuts; 
else
    echo "noooo open_bashcuts"
fi

if [ -f bashcuts/.ccicli_bashcuts ]; 
then 
    echo "heyooo cci"
    source bashcuts/.ccicli_bashcuts; 
else
    echo "noooo ccicli_bashcuts"
fi











