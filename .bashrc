
if [ -f ~/.bash_commons ]; 
then 
    echo "heyooo"
    source ~/.bash_commons; 
else
    echo "noooo commons"
fi

if [ -f ~/.sfdxcli_aliases ]; 
then 
    echo "heyooo"
    source ~/.sfdxcli_aliases; 
else
    echo "noooo sfdxcli commons"
fi

#timestamp on terminal
export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]\ "

# GREP
alias hg="history|grep "

#OTHER Aliases
alias apex-snippets="start ~/AppData/Roaming/Code/User/snippets/Apex.code-snippets"
alias lwc-snippets="start ~/AppData/Roaming/Code/User/snippets/lwc.code-snippets"

#GITHUB CLI ALIASES
alias ghview="gh repo view --web"

# NEW TERMINAL FROM TERMINAL
alias new-bash='start "" "C:\Program Files\Git\git-bash.exe"' #UNLINKED TO CURRENT TERMINAL PROCESS
alias git-bash='/git-bash.exe & > /dev/null 2&>1'   

#RE-INITIALIZE CURRENTLY OPEN TERMINAL
alias reinit="source ~/.bashrc"

#OPEN ALIAS FILE
alias open-alias="start ~/.bashrc"
alias open-bashrc="start ~/.bashrc"
alias open-bashcommons="start ~/.bash_commons"

#list directory items with file size
alias lt='ls --human-readable --size -1 -S --classify'

#get the current directory’s listing, in long format, including hidden directories:
alias ll="ls -lhA"

# Make ls display in columns and with a file type indicator (end directories with “/”, etc) by default:
alias lcf="ls -CF"

#SALESFORCE DX CLI ALIASES
alias dxaliaslist="sfdx force:alias:list"
alias dxorgopen="sfdx force:org:open"
dxaliasdelete() {
    sfdx force:alias:set $1=
}

# FUNCTIONS

#create a directory and then immediately move into that directory
mcd () {
    mkdir -p $1;
    cd $1;
}

#git functions
g-ignore-filereset() {
    git rm --cached -r $1
}

#git checkout main and delete current branch
gb-delete() {
    currentBranchToDelete=$(git branch --show-current)
    echo "Locally deleting: $currentBranchToDelete"
    git checkout main
    git branch -D $currentBranchToDelete
}


#CUMULUS CI cci
alias cci-changes-list-all="cci task run list_changes --org dev"
alias cci-changes-list-x-Profile="cci task run list_changes --org dev -o exclude 'Profile:'"
alias cci-retrieve="cci task run retrieve_changes --org dev -o exclude "Profile:""

cci-open() {
    cci org browser $1
}

cci-new-dev() {
    #creates scratch org aligned with dev configurations for Cumulus CI
    cci flow run dev_org --org dev
}

cci-scratch-delete() {
    cci org scratch_delete $1
}

cci-new-qa() {
    #creates scratch org aligned with dev configurations for Cumulus CI
    cci flow run qa_org --org qa
}








