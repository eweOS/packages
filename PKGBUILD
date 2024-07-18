# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=22.5.0
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://nodejs.org/'
license=('MIT')
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares')
makedepends=('git' 'python')
#source=("git+https://github.com/nodejs/node.git#tag=v$pkgver")
source=("https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v${pkgver}/node-v${pkgver}.tar.xz")
sha512sums=('151e05b256607ff1e3eaf0fcb5c8f7ac9790f113e086decb6fa6b8eef2a900ea6abcbc47257a19efd11cafbfb9039a70a648202913e79d586717288f6933b48a')

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
