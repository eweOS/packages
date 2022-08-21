# Maintainer: Yukari Chiba <i@0x7f.cc>

# needsrootforbuild
pkgname=(util-linux util-linux-libs)
pkgver=2.37.2
pkgrel=1
pkgdesc='Miscellaneous system utilities for Linux'
arch=(x86_64)
url=https://github.com/karelzak/util-linux
license=(GPL)
groups=()
depends=()
makedepends=(
    bison
    gettext
    libtool
)
options=()

source=(
    "util-linux-${pkgver}.tar.gz::https://github.com/karelzak/util-linux/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    'SKIP'
)

build() {
    cd "${pkgbase}-${pkgver}"
    ./autogen.sh
    ./configure \
        --prefix=/usr \
        --libdir=/usr/lib \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --localstatedir=/var \
        --enable-usrdir-path \
        --enable-fs-paths-default=/usr/bin:/usr/local/bin
    make
}

package_util-linux() {
  depends=('util-linux-libs')
  cd "${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" usrsbin_execdir=/usr/bin install
  find ${pkgdir}/usr/bin -type f -not -name 'blkid' -delete
  find ${pkgdir}/usr/share/bash-completion/completions -type f -not -name 'blkid' -delete
  rm "${pkgdir}"/usr/lib/lib*.{a,so}*
  mv "${pkgdir}"/usr/include "${srcdir}"/include
}

package_util-linux-libs() {
  provides=('libutil-linux')
  make -C "${pkgbase}-${pkgver}" DESTDIR="${pkgdir}" install-usrlib_execLTLIBRARIES
  mv "${srcdir}"/include "${pkgdir}"/usr/include
}
