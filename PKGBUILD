# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=cryptopp
pkgname=crypto++
pkgver=8.9.0
pkgrel=1
pkgdesc='A free C++ class library of cryptographic schemes'
arch=(x86_64 aarch64 riscv64)
url=https://www.cryptopp.com/
license=(custom)
makedepends=(git)
source=(git+https://github.com/weidai11/cryptopp.git#tag=CRYPTOPP_${pkgver//./_})
sha256sums=('8414bdf8c79ad39d730aebe1686a8cff11d62593d504ca9493bf55238d0676c6')

prepare() {
  sed -i '/LDCONF/d' cryptopp/GNUmakefile
}

build() {
  export CXXFLAGS="$CXXFLAGS -DNDEBUG -fPIC"
  make PREFIX=/usr -C cryptopp dynamic cryptest.exe libcryptopp.pc
}

check() {
  make PREFIX=/usr -C cryptopp test
}

package() {
  make DESTDIR="${pkgdir}" PREFIX=/usr -C cryptopp install
  install -Dm 644 cryptopp/License.txt -t "${pkgdir}"/usr/share/licenses/crypto++/
  # Remove cryptest.exe and test files, only needed for check() and bloats the package
  # because cryptest.exe is linked statically.
  rm -rf "${pkgdir}"/usr/{bin,share/cryptopp}
}
