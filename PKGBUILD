# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=conmon
pkgver=2.2.1
pkgrel=1
pkgdesc='OCI container runtime monitor'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/containers/conmon'
license=(APACHE)
depends=(glib2)
makedepends=(git linux-headers)
source=("git+https://github.com/containers/conmon#commit=v${pkgver}")
sha256sums=('d3e602a1ae17dc73d1ee1b099a7510202878344f4546612547a86daee67be079')

build() {
  cd conmon
  make PREFIX=/usr LIBEXECDIR=/usr/lib DESTDIR="$pkgdir"
}

package() {
  install -Dm755 conmon/bin/conmon "$pkgdir/usr/bin/conmon"
}
