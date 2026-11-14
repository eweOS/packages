# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=26.13.1
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
sha512sums=('149fd201f1b99c67484daacdb2f6b0dbfc742c9f71f120b5b7160b389b04d6e0b1c17b228c5e27dd0194bc42076fb16909756d021ab0eb0054dacba1a589131a'
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
