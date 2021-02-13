

if [ -f /c/git/jdschleicher/bashcuts/bashcuts/.bash_commons ]; 
then 
    source /c/git/jdschleicher/bashcuts/bashcuts/.bash_commons; 
else
    echo "missing commons"
fi

if [ -f /c/git/jdschleicher/bashcuts/bashcuts/.sfdxcli_bashcuts ]; 
then 
    source /c/git/jdschleicher/bashcuts/bashcuts/.sfdxcli_bashcuts; 
else
    echo "missing sfdxcli"
fi


if [ -f /c/git/jdschleicher/bashcuts/bashcuts/.gitcli_bashcuts ]; 
then 
    source /c/git/jdschleicher/bashcuts/bashcuts/.gitcli_bashcuts; 
else
    echo "missing gitcli_bashcuts"
fi


if [ -f /c/git/jdschleicher/bashcuts/bashcuts/.ghcli_bashcuts ]; 
then 
    source /c/git/jdschleicher/bashcuts/bashcuts/.ghcli_bashcuts; 
else
    echo "missing ghcli_bashcuts"
fi

if [ -f /c/git/jdschleicher/bashcuts/bashcuts/.open_bashcuts ]; 
then 
    source /c/git/jdschleicher/bashcuts/bashcuts/.open_bashcuts; 
else
    echo "missing open_bashcuts"
fi

if [ -f /c/git/jdschleicher/bashcuts/bashcuts/.ccicli_bashcuts ]; 
then 
    source /c/git/jdschleicher/bashcuts/bashcuts/.ccicli_bashcuts; 
else
    echo "missing ccicli_bashcuts"
fi











