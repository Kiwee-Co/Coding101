
# git-prompt
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  export PS1="\[\033[1;31m\][\@]\[\033[0m\] \[\033[1;33m\]\u\[\033[0m\]@\[\033[4;34m\]\h\[\033[0m\] \[\033[1;32m\]\w\[\033[m\] \$(__git_ps1 \"\[\033[00;33m\]::%s::\") \[\033[1;37m\]$\[\033[m\]  \[\033[1;37m\]\[\033[0m\]"
else
PS1="(\[\e[0;36m\]\@\[\e[0m\])[\[\e[0;32m\]\u\[\e[0m\]@\[\e[4;34m\]\h\[\e[0m\]]:\[\e[0;33m\] \w\[\e[0m\]$ " 
#PS1="\[\033[1;31m\][\@]\[\033[0m\] \[\033[1;33m\]\u\[\033[0m\]@\[\033[4;34m\]\h\[\033[0m\] \[\033[1;32m\]\w\[\033[m\] \$(__git_ps1 \"\[\033[00;33m\]::%s::\") \[\033[1;37m\]$\[\033[m\]  \[\033[1;37m\]\[\033[0m\]"
fi


# git-autocomplete
if [ -f ~/.git-completion.bash ]; then
 . ~/.git-completion.bash
fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#PATH
PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/scripts/

# export
export JAVA_HOME=$(/usr/libexec/java_home -v17)
export EDITOR=/usr/bin/vim

export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/

#alias 
alias mkdir='mkdir -p'
alias ls='ls -hGF '
alias mvn="mvn -T 8C"



