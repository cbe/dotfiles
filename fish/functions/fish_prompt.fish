function fish_prompt --description 'Write out the prompt'
    # Prompt status only if it's not 0
    set -g last_status $status

    echo
    string join " " -- (set_color -f red ;; echo "$(set_color -b red)") (set_color -f '#181926' -b red ;; get_login) (set_color -f red -b bryellow ;; echo ) (set_color -f '#181926' -b bryellow ;; get_pwd) (set_color -f bryellow -b green ;; echo ) (set_color -f '#181926' -b green ;; get_vcs) (set_color -f green  -b brblue ;; echo ) (set_color -f '#181926' -b brblue ;; get_time) (set_color --reset ;; set_color -f brblue ;; echo ) (set_color --reset) (get_status)
end

function get_login
    echo -n (whoami)@(prompt_hostname)
end

function get_pwd
    prompt_pwd --full-length-dirs 2
end

function get_vcs
    # VCS settings
    set -g __fish_git_prompt_showdirtystate true

    fish_vcs_prompt | string trim
end

function get_time --description 'Simply print the full time (HH:mm:ss)'
    date +'%H:%M:%S'
end

function get_status
    if test $last_status -ne 0
        string collect (set_color red)\n"⨯ "(set_color --reset)
    end
    if test $last_status -eq 0
        string collect (set_color green)\n"› "(set_color --reset)
    end
end
