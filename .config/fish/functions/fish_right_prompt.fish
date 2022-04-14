function fish_right_prompt -d "Write out the right prompt"
    set -l last_status $status
    if test $last_status -ne 0
    	set_color $fish_color_error
	printf '%d' $last_status
    end
    if string match -q --invert '*dmitryd*' $hostname
        set_color $fish_color_host
	echo -n ' ('(hostname)')'
    end
    set_color $fish_color_command
    echo -n ' ['(date '+%H:%M:%S')']'
    set_color normal
end
