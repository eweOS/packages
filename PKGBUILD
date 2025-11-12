# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=25.1.0
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
sha512sums=('467c9961c9937ac155cea53c02eece2294581feacf19b69eec7138f0b747f244a3a7fa1d7d760ac4911bd44db2d27a82dc68205171e2de9d54731eb464a95c10'
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
