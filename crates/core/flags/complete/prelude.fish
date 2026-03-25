# Usage: __gg_contains_opt LONG [SHORT]
function __gg_contains_opt --description 'Specialized __fish_contains_opt'
    # Cache the config file because this function is called many times per
    # completion attempt.
    # The cache will persist for the entire shell session (even if the
    # variable or the file contents change).
    if not set -q __gg_config
        set -g __gg_config
        if set -qx RIPGREP_CONFIG_PATH
            set __gg_config (
                cat -- $RIPGREP_CONFIG_PATH 2>/dev/null \
                | string trim \
                | string match -rv '^$|^#'
            )
        end
    end

    set -l commandline (commandline -cpo) (commandline -ct) $__gg_config

    if contains -- "--$argv[1]" $commandline
        return 0
    end

    if set -q argv[2]
        if string match -qr -- "^-[^-]*$argv[2]" $commandline
            return 0
        end
    end

    return 1
end
