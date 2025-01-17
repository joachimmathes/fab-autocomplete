#!/usr/bin/env bash

_fab()
{
    local cur=${COMP_WORDS[COMP_CWORD]}

    if [[ "$cur" == -* ]]
    then
	fab_options="--help --display= --list-format= --list --initial-password-prompt "
	fab_options+="--list --set= --shortlist --version --no_agent --forward-agent "
	fab_options+="--abort-on-prompts --config= --colorize-errors --disable-known-hosts "
	fab_options+="--eagerly-disconnect --fabfile= --gateway= --hide= --hosts= -i "
	fab_options+="--no-keys --keepalive= --linewise --connection-attempts= "
	fab_options+="-no-pty --password= --parallel --port= --reject-unknown-hosts "
	fab_options+="--system-known-hosts= --roles= --shell= --show= --skip-bad-hosts "
	fab_options+="--skip-unknown-tasks --ssh-config-path= --timeout= --command-timeout= "
	fab_options+="--user= --warn-only --exclude-hosts= --pool-size= "
	COMPREPLY=( $(compgen -W "${fab_options}" -- $cur) )
    else
	fab_functions=
	task_list=$(fab -l -F json)
	for i in `echo $task_list | jq -r .collections[].name`; do
	    for j in `echo $task_list | jq -r ".collections[] | select(.name == \"${i}\") | .tasks[].name"`; do
		fab_functions+="${i}.${j} "
	    done
	done
	COMPREPLY=( $(compgen -W "${fab_functions}" -- $cur) )
    fi
}
complete -F _fab fab
