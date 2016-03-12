function segment -a text color background suffix prefix -d "Add prompt segment"
    if test -z "$segment_color"
        set segment_color normal
    end

    set -g segment (echo (set_color $color -b $background)"$prefix$text"(
        set_color $background -b $segment_color)"$suffix")"$segment"

    set -g segment_color $background
end
