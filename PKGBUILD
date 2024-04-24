# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=21.7.3
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://nodejs.org/'
license=('MIT')
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares')
makedepends=('git' 'python')
#source=("git+https://github.com/nodejs/node.git#tag=v$pkgver")
source=("https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v${pkgver}/node-v${pkgver}.tar.xz")
sha512sums=('1686947e0c03fa238c98bd47d96867a9cfa087eb79baa60828d600f04ca1e58fec02076bc2fdc06717b4f4ee67a74179dcc52b7eacc7d25a3743fb944d69b95c')

prepare() {
  cd node-v$pkgver
  # Clang with libc++
  sed -i 's/-latomic//g' node.gyp
}

build() {
  cd node-v$pkgver
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
  cd node-v$pkgver
  make test || :
}

package() {
  cd node-v$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/nodejs/

  cd "$pkgdir"/usr/lib
  ln -s libnode.so.* libnode.so
}
