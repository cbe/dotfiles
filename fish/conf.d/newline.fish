set -g prompt_number 0

function newline_handler --on-event fish_prompt --description "Increase a counter when a new prompt is rendered so we can address the first prompt"
    set prompt_number (math $prompt_number + 1)
end

bind \cl "set prompt_number 1; commandline -f clear-screen"
