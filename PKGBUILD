# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=20.5.0
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://nodejs.org/'
license=('MIT')
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares')
makedepends=('git' 'python')
source=("git+https://github.com/nodejs/node.git#tag=v$pkgver")
sha512sums=('SKIP')

prepare() {
  cd node
  # Clang with libc++
  sed -i 's/-latomic//g' node.gyp
}

build() {
  cd node
  export CC=cc CXX=c++
  ./configure \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --shared \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --experimental-http-parser \
    --shared-nghttp2 \
    --shared-cares \
    --shared-brotli

  make
}

check() {
  cd node
  make test || :
}

package() {
  cd node
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/nodejs/

  cd "$pkgdir"/usr/lib
  ln -s libnode.so.* libnode.so
}
