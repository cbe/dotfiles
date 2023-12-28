function _is_linux
    test "$(uname)" = Linux
end

function _is_mac
    test "$(uname)" = Darwin
end
