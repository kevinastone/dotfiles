if test -d /opt/android_sdk

    # exports
    set -x ANDROID_SDK /opt/android_sdk
    set -x ANDROID_HOME "$ANDROID_SDK"

    fish_add_path -g "$ANDROID_SDK/tools" "$ANDROID_SDK/platform-tools"
end
