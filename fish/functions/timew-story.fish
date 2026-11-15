if command -q timew
    function timew-story --description "Print the story id if one is currently being tracked"
        timew | grep --extended-regexp --only-matching --color=never $(timew-story-pattern)
    end
end
