# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zziplib
pkgver=0.13.80
pkgrel=1
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/gdraheim/zziplib"
license=('LGPL-2.1-or-later')
depends=('musl' 'zlib')
makedepends=('python' 'xmlto' 'zip' 'cmake' 'ninja')
source=($pkgname-$pkgver.tar.gz::"https://github.com/gdraheim/zziplib/archive/v$pkgver.tar.gz")
sha512sums=('1560b9b6851247ef07e64c689551e191eb26e2756f7ba32bdd1a7ed345a76b444050474b2fdd5f6308ca2ff1e9a55a55c8961eefaf8db0c6674c6a2f1c368a68')

build() {
  cmake -S ${pkgname}-${pkgver} -B build -G Ninja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DZZIPDOCS=OFF \
    -DZZIP_TESTCVE=OFF
  cmake --build build
}

check() {
  cmake --build build -t tests
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
