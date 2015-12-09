
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
function removefrom()
{
    local varname=$1
    local entry="$2"

    unset newvar
    for value in `IFS=: eval echo \\$$varname`; do
	if [ "$value" != "$entry" ]; then
	    newvar="${newvar}${newvar+:}${value}"
	fi
    done

    # Set it again
    eval $varname="$newvar"
    unset newvar
}

removefrom PATH $QTDIR/bin
unset QTDIR

export PROJECTS=${HOME}/Projects
export CTEST_OUTPUT_ON_FAILURE=1
export TDSSIM_DEV=1

export PATH=${PROJECTS}/3rdParty/tools/install/bin:${PATH}


export DISTCC_CONF_EMAIL="John.Waggenspack@nyab.com"
export DISTCC_CONF_MACHINE="ext-waggensj-vm"
export PATH="/home/nyab/perforce/perforce-latest/bin:${PATH}:/home/nyab/Projects/perforce-tools/common/devtools"
export P4PORT=dfws0074:1666
export P4USER=ext-waggensj
export P4CONFIG=".p4config"
export PERL5LIB="/home/nyab/Projects/perforce-tools/common/lib"

alias p4cl="p4 changes -u $P4USER -s pending -c `p4 info -s | grep 'Client name:' | cut -d: -f2` | grep -iv clang\ changes"

PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
