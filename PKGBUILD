# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=24.8.0
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
# 0003, 0004: Backport, fix Check failures (assertion failures) on RISC-V,
#	reference: https://github.com/riscv-forks/electron/issues/9
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.xz"
        "0001-no-libatomic.patch"
        "0002-hwy-broken-rvv.patch"
        "0003-v8-riscv-fix-trampoline.patch"
        "0004-v8-riscv-fix-trampoline-release.patch")
sha512sums=('5dcd25fda47eff6d6dfa5f4d24261dcbc7ab6de962a1b8a217bf910cdfebedcd03cd2034315630850240b64924cfe5f5e103cd3c76fa6b31b524503ba16d926e'
            '2c51251e303d64980deb8f00dfadf5928c31fb66ec2bbe94790868ffd6c7a4b2dba0584fe5bd53f70feb33b6a735a8e78dc7fa0d746645408e072eef3bed9d9f'
            'de07b0d9c3481036ee97a22941ff444fee86c78abbc26afef36f17508bb479ce3ab83ca160109fbf4f0b9b3266dcce30860873dc8ffbcac1a70e98d17638ca55'
            '531ed581212fad93782a5c38a3077be898c74b27b0211313a807cadb7fd6dbadb959c36d380c30ff597d0d0e9da9e68b9f8769d8a1ac6928fb27441f0e9812f5'
            '1bd56f854cb50eecdeced4a007335e407def69fabe14305f053e4d33c226740bb0bbaa861880df6b45d7a761150b77ab8dca28ad0489c75b52cd4c4cad61ddc7')

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
