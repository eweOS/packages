# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=(linux linux-headers)
_basename=linux
pkgver=5.19.3
pkgrel=1
pkgdesc='System kernel'
arch=(x86_64)
url='http://www.kernel.org'
license=(GPL2)
depends=()
makedepends=(bison flex perl python)
options=()
source=(
    "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz"
    linux-config
    busybox-find-compat.patch
)

sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

build() {
    cd ${_basename}-${pkgver}
    sed -i 's@/usr/bin/awk@/bin/awk@' scripts/ld-version.sh
    sed -i \
        -e "/rsync/s@rsync@find usr/include -not -type d -name '*.h' | cpio -dump --quiet \$\(INSTALL_HDR_PATH\); true@" \
        -e '/^CC/s@gcc@cc@g' \
        -e '/^HOSTCC/s@gcc@cc@g' Makefile
    patch -Np1 -i "${srcdir}/busybox-find-compat.patch"
    make LLVM=1 LLVM_IAS=1 mrproper
    cp "${srcdir}/linux-config" .config
    make LLVM=1 LLVM_IAS=1
}

package_linux() {
    cd ${_basename}-${pkgver}
    local modulesdir="$pkgdir/usr/lib/modules/$pkgver"
    make LLVM=1 LLVM_IAS=1 INSTALL_MOD_PATH="$pkgdir/usr" modules_install
    install "arch/${CARCH}/boot/bzImage" "${modulesdir}/vmlinux"

    rm -f "$modulesdir/build" \
          "$modulesdir/source"
}

package_linux-headers() {
    groups=(base-devel)
    cd ${_basename}-${pkgver}
    make LLVM=1 LLVM_IAS=1 INSTALL_HDR_PATH=dest HOSTCFLAGS="-D_GNU_SOURCE" headers_install
    set -o pipefail
    find usr -not -type d -name "*.h" | cpio -dump "${pkgdir}"
}
