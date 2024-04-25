# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=activate-linux
pkgver=r4.d3bc7ea
pkgrel=1
pkgdesc="The \"Activate Windows\" watermark for Wayland"
arch=(x86_64 aarch64 riscv64)
url='https://github.com/Kljunas2/activate-linux.git'
makedepends=('git')
depends=('gtk3' 'gtk-layer-shell')
license=('MIT')
sha512sums=('SKIP')
source=(git+https://github.com/Kljunas2/activate-linux)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D bin/activate-linux "$pkgdir/usr/bin/activate-linux"
}
