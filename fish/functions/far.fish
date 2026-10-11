function far --description "Find and replace [file] [find] [replace]" \
    -a file \
    -a find \
    -a replace

    find $file -type f \
        -exec sed --in-place --expression "s/$find/$replace/g" {} \;
end
