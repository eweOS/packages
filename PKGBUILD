# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9.6
pkgrel=1
pkgdesc='Fully feature complete YAML parser and emitter'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://pantoniou.github.io/libfyaml/'
license=(MIT)
depends=(musl)
makedepends=(git linux-headers)
provides=(libfyaml.so)
# 0001: Downstream, upstream Makefile.am passes invalid argument to libtool for
#	ABI versioning, breaking build with slibtool.
#	Reference: https://github.com/pantoniou/libfyaml/issues/148
# 0002: Downstream, configure.ac doesn't handle "none required" from AC_SEARCH_LIBS
source=("git+https://github.com/pantoniou/libfyaml#tag=v$pkgver"
	0001-Use-version-number-for-libtool-ABI-versioning.patch
	0002-Fix-LIBM-check-for-none-required.patch)
sha256sums=('6e3066fc231e83fe7899c3ccd8ed8931cb46461ffb25e73fcab89a35affaeccd'
            'e9dfc4ea117c1f5265ac8cfaaf152727149c9b2840d87898667613e4183bfd7f'
            'c1e2705f5d0fcf5341976a9aa60acaa2b12de8b2e615b208d63fb18863a8a131')

prepare() {
  _patch_ $pkgname

  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --without-libclang
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  _install_license_ LICENSE
}
