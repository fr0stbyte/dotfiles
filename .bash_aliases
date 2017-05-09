alias hostclasstag='date +%Y.%m.%d_%H.%M'
alias gitready="git pull --rebase && git prune && git remote prune origin"
alias scheme="rlwrap -r -c -f ~/scheme-completion.txt scheme"

function set_java_ver {
   case $1 in
     '1.8')
        export JAVA_HOME=$(/usr/libexec/java_home -v 1.8 -a x86_64)
        ;;
     '1.7')
        export JAVA_HOME=$(/usr/libexec/java_home -v 1.7 -a x86_64)
        ;;
     '1.6')
        export JAVA_HOME=$(/usr/libexec/java_home -v 1.6 -a x86_64)
        ;;
     *)
        echo "no version specified : $1"
        ;;
   esac
}

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ; }

if [ -e ~/.bash_aliases_groupon ]; then
  source ~/.bash_aliases_groupon
fi
