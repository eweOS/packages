# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=23.2.0
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://nodejs.org/'
license=('MIT')
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares')
makedepends=('git' 'python' 'linux-headers')
#source=("git+https://github.com/nodejs/node.git#tag=v$pkgver")
source=("https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/v${pkgver}/node-v${pkgver}.tar.xz" "fix-rv.patch")
sha512sums=('cc2aa8c87b9ec36dc6008ae3b8d9401c348336c446ff862963174891e1339e825de22cc16f9c09e1da8fd6714ae3ee1dd428d2b23ea76b75a65831b82f1dbf66'
            'a06423d47ccfd7682c73559dc82ee787024daa0ac0d04b0f8a2c49238e99652242ed2f128dc4c7bf44d661abeb7679c289ed7cc1ecb1d9e576bd76738cad197d')

prepare() {
  _patch_ node-v$pkgver
  cd node-v$pkgver
  # Clang with libc++
  sed -i 's/-latomic//g' node.gyp
  sed -i 's/-latomic//g' tools/v8_gypfiles/v8.gyp
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
