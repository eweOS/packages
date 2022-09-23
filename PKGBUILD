# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efivar
pkgdesc="Tools and libraries to work with EFI variables"
pkgver=38
pkgrel=1
arch=(x86_64)
url="https://github.com/rhboot/efivar"
license=(LGPL2.1)
depends=(musl)
makedepends=(linux-headers git lld)
_commit=bc65d63ebf8fe6ac8a099ff15ca200986dba1565
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  # currently we do not have mandoc
  sed -i 's:docs::g' $pkgname/Makefile
}

build() {
  # mold is not supported
  export LD=ld.lld CFLAGS='--ld-path=/usr/bin/ld.lld'
  # disable -Werror by default by setting ERRORS to empty string
  make ERRORS='' all -C "${pkgname}"
}

package() {
  make DESTDIR="${pkgdir}/" \
       libdir=/usr/lib/ \
       bindir=/usr/bin/ \
       includedir=/usr/include/ \
       install -j1 V=1 \
       -C "${pkgname}"
  install -vDm 644 "${pkgname}/"{README.md,TODO} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
