function fish_prompt --description 'Write out the prompt'
    # Prompt status only if it's not 0
    set -g last_status $status

    # Print a newline when it's not the first prompt
    if test $prompt_number -gt 1
        echo
    end

    set -l parts (set_color -f red ;; echo "$(set_color -b red)") \
        (set_color -f '#181926' -b red ;; get_login) \
        (set_color -f red -b bryellow ;; echo ) \
        (set_color -f '#181926' -b bryellow ;; get_pwd) \
        (set_color -f bryellow -b green ;; echo ) \
        (set_color -f '#181926' -b green ;; get_vcs) \
        (set_color -f green  -b brblue ;; echo ) \
        (set_color -f '#181926' -b brblue ;; get_time)

    if test -n $(get_duration)
        set -a parts (set_color -f brblue  -b magenta ;; echo ) \
            (set_color -f '#181926' -b magenta ;; get_duration) \
            (set_color --reset ;; set_color -f magenta ;; echo )
    else
        set -a parts (set_color --reset ;; set_color -f brblue ;; echo )
    end

    string join " " -- $parts \
        (set_color --reset) (get_status)
end

function get_login
    echo -n (whoami)@(prompt_hostname)
end

function get_pwd
    prompt_pwd --full-length-dirs 1
end

function get_vcs
    # VCS settings
    set -g __fish_git_prompt_showdirtystate true

    fish_vcs_prompt | string trim --chars " ()"
end

function get_time --description 'Simply print the full time (HH:mm:ss)'
    date +'%H:%M:%S'
end

function pad_duration --argument-names time
    string pad --width 2 --char 0 $time
end
function get_duration --description 'Print the duration of the last executed command'
    if test $CMD_DURATION -eq 0
        echo
        return
    end
    if test $CMD_DURATION -lt $(math 5 \* 1000)
        echo
        return
    end

    set -l seconds $(math round $(math $CMD_DURATION / 1000))
    set -l result "$(string join "" $seconds s)"

    if test $seconds -gt $(math 60 \* 60)
        set -l hours $(math floor $(math $seconds / $(math 60 \* 60)))
        set -l minutes $(pad_duration $(math round $(math $seconds % $(math 60 \* 60) / 60)))
        set result $(string join "" $hours h $minutes m)
    else if test $seconds -gt 60
        set -l minutes $(math floor $(math $seconds / 60))
        set -l seconds $(pad_duration $(math $seconds % 60))
        set result $(string join "" $minutes m $seconds s)
    end

    echo $result
end

function get_status
    if test $last_status -ne 0
        string collect (set_color red)\n"⨯ "(set_color --reset)
    end
    if test $last_status -eq 0
        string collect (set_color green)\n"› "(set_color --reset)
    end
end
