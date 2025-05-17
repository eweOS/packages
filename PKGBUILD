# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgbase=kmod
pkgname=(kmod libkmod)
pkgver=34.2
pkgrel=1
pkgdesc="Linux kernel module management"
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
license=(LGPL-2.1-or-later GPL-2.0-or-later)
depends=(musl openssl xz zlib zstd) # shared between kmod and libkmod
makedepends=(meson scdoc)
checkdepends=(linux-devel libelf lld linux)
source=("https://www.kernel.org/pub/linux/utils/kernel/$pkgname/$pkgname-$pkgver.tar.xz"
        depmod-search.conf
        depmod.hook
        depmod.script)
sha256sums=('5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54'
            '1a92bfeae870f61ce814577e69d2a147a9c0caf6aed1131243e4179241fcc4a8'
            'c11c2a0f66ea405493e8617689ca10818dc81dd1dddc19bdb220c8b2917119c1'
            '60149f97cd139ef0f4962552d40e03b945aab8a69ffb3f9c6c7d502e11c4fe41')

build() {
  ewe-meson $pkgbase-$pkgver build \
    -Dbuild-tests=true \
    -Dmanpages=true \
    -Dopenssl=enabled \
    -Dxz=enabled \
    -Dzlib=enabled \
    -Dzstd=enabled
  meson compile -C build
}

check() {
  meson test -C build
}

package_kmod() {
  pkgdesc="$pkgdesc tool"
  license=(GPL-2.0-or-later)
  # Does not depend on libkmod due to its static link to libkmod_internal

  meson install -C build --destdir "${pkgdir}"
  _pick_ libkmod "${pkgdir}"/usr/{lib,include}

  # extra directories
  install -dm0755 "${pkgdir}"/{etc,usr/lib}/{depmod,modprobe}.d

  # install depmod.d file for search/ dir
  install -Dm0644 "${srcdir}/depmod-search.conf" "${pkgdir}/usr/lib/depmod.d/search.conf"

  # hook
  install -Dm0644 "${srcdir}/depmod.hook" "${pkgdir}/usr/share/libalpm/hooks/60-depmod.hook"
  install -Dm0755 "${srcdir}/depmod.script" "${pkgdir}/usr/share/libalpm/scripts/depmod"
}

package_libkmod() {
  pkgdesc="$pkgdesc library"
  license=(LGPL-2.0-or-later)
  provides=(libkmod.so)

  install -d $pkgdir/usr
  mv libkmod/* $pkgdir/usr
}
