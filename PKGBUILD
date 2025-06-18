# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=23.11.0
pkgrel=1
pkgdesc='JavaScript runtime'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://nodejs.org/'
license=('MIT')
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares')
makedepends=('git' 'python' 'linux-headers')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.xz"
        "0001-no-libatomic.patch"
        "0002-riscv-fix-trap-handler.patch")
sha512sums=('6f332ec26e13b42c8f0c7cbca4e45034ded455dbc5cfa1776115439292698fc825a5f60a8a88dc43aa0561a3504267bfa4bd3fb9476fc9c81a0e739d8c35b637'
            'cb795f3780e45ef2c3645c5320bc61ac7ea5f85ffe3541bdf16ddba5ba88b813a3825fea3047443108d9d8b3d56bb2d786ad7020afff2f621c726c8a5c723e28'
            'a06423d47ccfd7682c73559dc82ee787024daa0ac0d04b0f8a2c49238e99652242ed2f128dc4c7bf44d661abeb7679c289ed7cc1ecb1d9e576bd76738cad197d')

prepare() {
  _patch_ node-v$pkgver
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
