function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal
    if git rev-parse --git-dir > /dev/null 2>&1
        echo -n (fish_git_prompt)
	# git diff --quiet
	# set -l modified_status $status
	# if test $modified_status -eq 1
 #            set_color $fish_color_cwd
	#     echo -n '·'
	# end
    end
    echo -n ' ▸ '
end
