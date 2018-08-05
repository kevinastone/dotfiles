if test -d /opt/android_sdk

    # exports
    set -x ANDROID_SDK "/opt/android_sdk"
    set -x ANDROID_HOME "$ANDROID_SDK"

    for dir  in tools platform-tools
        if test -d "$ANDROID_SDK"/"$dir"
            set -x PATH "$ANDROID_SDK"/"$dir" $PATH
        end
    end
end
