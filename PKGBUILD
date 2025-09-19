# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libfyaml
pkgver=0.9
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
source=("git+https://github.com/pantoniou/libfyaml#tag=v$pkgver"
	0001-Use-version-number-for-libtool-ABI-versioning.patch)
sha256sums=('1fcd041e736b6a9bd5f9e4bea1d182573e4db6f2442080b6e9f9a73ece8910ae'
            'e55cafd16ddc700b217fcc0baa32b8a0b56f5445dd38f63aea44688694fb2611')

prepare() {
  _patch_ $pkgname

  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  _install_license_ LICENSE
}
