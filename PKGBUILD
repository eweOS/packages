# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=26.12.1
pkgrel=1
pkgdesc='JavaScript runtime'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://nodejs.org/'
license=('MIT')
depends=('musl' 'llvm-libs' 'brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares' 'ada-url' 'zstd' 'libffi' 'sqlite' 'simdutf' 'googletest')
makedepends=('git' 'python' 'ninja' 'linux-headers')
optdepends=('npm: package manager')
# 0001: Should be upstreamed, don't link libatomic for targets without
#	non-word-sized atomic ops, as compiler-rt doesn't provide the library.
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.xz"
        "0001-no-libatomic.patch")
sha512sums=('f6f76e258af33f7f877c65a2141d281ea307aae017a90bb8a75a7d4df271ad9d17c7d0edfd5751a977edd6bdb03c704d727628c4c7215c878d421787a35240f2'
            '7a27dc9dcb99be39f5925ef9a20f0afd2e1b475d72efd89c790516a01c5d35f38450fbb879f2d138d8abfa69a45ed73c44e2c0e603cb619a0476bc32764799c3')

prepare() {
  _patch_ node-v$pkgver
}

build() {
  # TODO: Devendor abseil-cpp, highway, and simdutf
  cd node-v$pkgver
  export CC=cc CXX=c++
  ./configure \
    --ninja \
    --prefix=/usr \
    --with-intl=system-icu \
    --without-npm \
    --without-lief \
    --shared \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --shared-nghttp2 \
    --shared-cares \
    --shared-brotli \
    --shared-ada \
    --shared-ffi \
    --shared-sqlite \
    --shared-gtest \
    --shared-zstd

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
