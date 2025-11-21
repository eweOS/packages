# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=25.2.1
pkgrel=1
pkgdesc='JavaScript runtime'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://nodejs.org/'
license=('MIT')
depends=('musl' 'llvm-libs' 'brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares')
makedepends=('git' 'python' 'linux-headers')
optdepends=('npm: package manager')
# 0001: Should be upstreamed, don't link libatomic for targets without
#	non-word-sized atomic ops, as compiler-rt doesn't provide the library.
# 0002: Downstream, highway's detection of RVV is broken, and doesn't support
#	dispatch at runtime.
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.xz"
        "0001-no-libatomic.patch"
	"0002-hwy-broken-rvv.patch")
sha512sums=('a189eb01a8dece7bf789ddac4d8f6a1b948418e943a0d64fdbea33944f12d2a8be9fb4e2acb9a5cc6057c79c5363936c3a95bdbb9151b784725e9fb90724b8cb'
            '2c51251e303d64980deb8f00dfadf5928c31fb66ec2bbe94790868ffd6c7a4b2dba0584fe5bd53f70feb33b6a735a8e78dc7fa0d746645408e072eef3bed9d9f'
            'de07b0d9c3481036ee97a22941ff444fee86c78abbc26afef36f17508bb479ce3ab83ca160109fbf4f0b9b3266dcce30860873dc8ffbcac1a70e98d17638ca55')

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
