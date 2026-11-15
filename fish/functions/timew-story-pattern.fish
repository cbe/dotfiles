if command -q timew
    function timew-story-pattern --description "Print the pattern for ticket regex matching"
        echo "T-[0-9]+"
    end
end
