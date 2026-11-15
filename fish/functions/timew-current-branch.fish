if command -q timew
    function timew-current-branch --description "Start time tracking for the story id in the current git branch"
        set -l branch $(git branch --show-current)
        set -l story $(echo $branch | string match --regex $(timew-story-pattern))

        if test -n "$story"
            timew start dev $story
        end
    end
end
