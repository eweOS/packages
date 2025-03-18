# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=conmon
pkgver=2.1.13
pkgrel=1
pkgdesc='OCI container runtime monitor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/containers/conmon'
license=(APACHE)
depends=(glib2)
makedepends=(git linux-headers)
source=("git+https://github.com/containers/conmon#commit=v${pkgver}")
sha256sums=('54ddb3c6b383abcff85c9dcecb65605ad79e4024d3679d667a7f4b70996be52a')

build() {
  cd conmon
  make PREFIX=/usr LIBEXECDIR=/usr/lib DESTDIR="$pkgdir"
}

package() {
  install -Dm755 conmon/bin/conmon "$pkgdir/usr/bin/conmon"
}
