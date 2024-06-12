[[ -n "$LIBMAKEPKG_LINT_PACKAGE_NOGLIBC_SH" ]] && return
LIBMAKEPKG_LINT_PACKAGE_NOGLIBC_SH=1

LIBRARY=${LIBRARY:-'/usr/share/makepkg'}

source "$LIBRARY/util/message.sh"


lint_package_functions+=('warn_noglibc')

warn_noglibc() {
        local dependpkg
        for dependpkg in "${depends[@]}"; do
                if [ "$dependpkg" == "glibc" ] ; then
                        warning "glibc in depends, are you sure it is really needed?"
                fi
        done
        return 0
}
