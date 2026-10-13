function ask_yes_or_no --description "Wait for user response to a simple y/N question"
    set -l result ( read -P "$argv ([y]es or [N]o): " | tr '[A-Z]' '[a-z]' )

    switch $result
        case y yes
            true
        case '*'
            false
    end
end
