# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libyaml
pkgver=0.2.5
pkgrel=1
pkgdesc="YAML 1.1 library"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://pyyaml.org/wiki/LibYAML"
license=('MIT')
source=("https://pyyaml.org/download/libyaml/yaml-$pkgver.tar.gz")
sha256sums=('c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2988e3c02678ef4')

build() {
  cd "$srcdir/yaml-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/yaml-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 License "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

