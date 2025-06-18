# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=nodejs
pkgver=24.2.0
pkgrel=1
pkgdesc='JavaScript runtime'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://nodejs.org/'
license=('MIT')
depends=('musl' 'llvm-libs' 'brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares')
makedepends=('git' 'python' 'linux-headers')
optdepends=('npm: package manager')
source=("https://nodejs.org/dist/v${pkgver}/node-v${pkgver}.tar.xz"
        "0001-no-libatomic.patch"
        "0002-riscv-fix-trap-handler.patch"
        "0003-hwy-broken-rvv.patch"                    # apply until highway fix its RVV implementation and add dynamic dispatch
        "0004-v8-riscv-fix-trampoline.patch"           # backport, fixes https://github.com/riscv-forks/electron/issues/9
        "0005-v8-riscv-fix-trampoline-release.patch")  # backport, fixes https://github.com/riscv-forks/electron/issues/9
sha512sums=('39569e668e6f98d0bdb76eae857e884d0765a25cf05cae58da0d5d0e2a96ad0100dcebac97b91ab9693a0e3403746a67222ec5ead8be1a6f0b7c83888d40b466'
            '2c51251e303d64980deb8f00dfadf5928c31fb66ec2bbe94790868ffd6c7a4b2dba0584fe5bd53f70feb33b6a735a8e78dc7fa0d746645408e072eef3bed9d9f'
            'a06423d47ccfd7682c73559dc82ee787024daa0ac0d04b0f8a2c49238e99652242ed2f128dc4c7bf44d661abeb7679c289ed7cc1ecb1d9e576bd76738cad197d'
            'de07b0d9c3481036ee97a22941ff444fee86c78abbc26afef36f17508bb479ce3ab83ca160109fbf4f0b9b3266dcce30860873dc8ffbcac1a70e98d17638ca55'
            '625507d38eb6c14e9a502aa85d6a265bf14444987b6a62da40cf63cdbb027ef530adafbae55e89266f2077715a3c94f77f32037c793340dd2b192c99ebd5abed'
            'fcb6226fae37958d3b0566a6e30e1ef6d8a434baa1d0850133c4c2aedf98108c6033de6a81858a5e84b04d8524c7d09080a965b00a9f6f9e13fc7825cb348ea5')

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
