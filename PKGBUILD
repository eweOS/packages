# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=protobuf-c
pkgver=1.5.0
pkgrel=1
pkgdesc='Protocol Buffers implementation in C'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/protobuf-c/protobuf-c'
license=('BSD')
depends=('protobuf')
provides=('libprotobuf-c.so')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
         protobuf-26.patch)
sha256sums=('7b404c63361ed35b3667aec75cc37b54298d56dd2bcf369de3373212cc06fd98'
            '6bbc0c031283fdd3bc4052e2e67b6706d0f298b9e4cada3b8baecb1766d9464c')

prepare() {
  _patch_ $pkgname-$pkgver
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

