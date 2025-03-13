# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=protobuf-c
pkgver=1.5.1
pkgrel=3
pkgdesc='Protocol Buffers implementation in C'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/protobuf-c/protobuf-c'
license=('BSD')
depends=('protobuf')
provides=('libprotobuf-c.so')
# 0001: Backport, fix compatibility with protobuf 30.0
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
	"0001-fix-build-with-protobuf-30-0.patch::https://github.com/protobuf-c/protobuf-c/pull/762.patch")
sha256sums=('20d1dc257da96f8ddff8be4dd9779215bbd0a6069ed53bbe9de38fa7629be06b'
            '23c54e2c3385b62420961a1e572706f446a1d25e84a3b3bd32109617d06cd321')

prepare() {
  _patch_ "$pkgname-$pkgver"

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

