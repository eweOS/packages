# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=24.3.0
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
# 0005: Under review, fix duplicate symbols on targets without maglev support
#	(riscv64, loongarch64) caused by files compiled twice for both
#	v8_base_without_compiler and v8_compiler.
#	Reference: https://github.com/nodejs/node/pull/58861
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.xz"
        "0001-no-libatomic.patch"
        "0002-hwy-broken-rvv.patch"
        "0003-v8-riscv-fix-trampoline.patch"
        "0004-v8-riscv-fix-trampoline-release.patch"
        "0005-tools-Compile-maglev-files-for-v8_compiler-only-when.patch")
sha512sums=('5ab1f04ae18f379b34e2eb3df80c19ba276404ce39e9491c55fa5ea7dab49e8daaa037efc5e3088840358eacbc31bc7b569c1469660a8cbcf088a2bb41710ab4'
            '2c51251e303d64980deb8f00dfadf5928c31fb66ec2bbe94790868ffd6c7a4b2dba0584fe5bd53f70feb33b6a735a8e78dc7fa0d746645408e072eef3bed9d9f'
            'de07b0d9c3481036ee97a22941ff444fee86c78abbc26afef36f17508bb479ce3ab83ca160109fbf4f0b9b3266dcce30860873dc8ffbcac1a70e98d17638ca55'
            '625507d38eb6c14e9a502aa85d6a265bf14444987b6a62da40cf63cdbb027ef530adafbae55e89266f2077715a3c94f77f32037c793340dd2b192c99ebd5abed'
            'fcb6226fae37958d3b0566a6e30e1ef6d8a434baa1d0850133c4c2aedf98108c6033de6a81858a5e84b04d8524c7d09080a965b00a9f6f9e13fc7825cb348ea5'
            '23ae583467a6d213879f650f61f7f2c9b2f1b0648c492352af69c0221a8c0537c7de252dd3c6fd165e37d4f2e4aca010acafd6f19207fdfc91057b1ef4e5f839')

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
