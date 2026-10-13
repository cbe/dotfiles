function far --description "find and replace [path] [find] [replace]" \
    --argument-names path find replace

    argparse --min-args 3 -- $argv; or return

    if command -q rg
    else
        echo "`rg` (ripgrep) is required for finding files"
        return 1
    end
    if command -q difft
    else
        echo "`difft` (difftastic) is required for diffing the output before writing"
        return 1
    end

    set -l temp_directory $(mktemp --directory)
    set -l temp_copies "$temp_directory/copy"
    set -l temp_replace "$temp_directory/replace"
    set -l files_with_matches $(rg --case-sensitive --files-with-matches $find $path)

    if test $status -gt 0
        echo "No files found"
        return 1
    end

    for file_with_match in $files_with_matches
        set -l matching_copy $(path normalize "$temp_copies/$file_with_match")
        set -l replace_file $(path normalize "$temp_replace/$file_with_match")

        mkdir -p $(path dirname $matching_copy)
        mkdir -p $(path dirname $replace_file)

        cp $file_with_match $matching_copy
        cp $file_with_match $replace_file

        if is_linux
            sed --in-place --expression "s/$find/$replace/g" $replace_file
        else if is_mac # 😑
            sed -i "" "s/$find/$replace/g" $replace_file
        end
    end

    difft --color always "$temp_directory/copy" "$temp_directory/replace" | less -R

    if ask_yes_or_no "Write files as shown?"
        if test $(count $files_with_matches) -gt 1
            for file_with_match in $files_with_matches
                set -l replace_file $(path normalize "$temp_replace/$file_with_match")
                set -l target_file $(path normalize "$path/$file_with_match")

                cp $replace_file $target_file
            end
        else if test -f $files_with_matches
            set -l replace_file $(path normalize "$temp_replace/$file_with_match")
            set -l target_file $(path normalize "$file_with_match")

            cp $replace_file $target_file
        else
            echo "Unexpected error"
            return 1
        end
    end
end
