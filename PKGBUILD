# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=protobuf-c
pkgver=1.5.2
pkgrel=4
pkgdesc='Protocol Buffers implementation in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/protobuf-c/protobuf-c'
license=('BSD')
depends=('protobuf')
provides=('libprotobuf-c.so')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e2c86271873a79c92b58fef7ebf8de1aa0df4738347a8bd5d4e65a80a16d0d24')

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  make -C "$pkgname-$pkgver" check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

