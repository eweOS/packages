# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zziplib
pkgver=0.13.79
pkgrel=1
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/gdraheim/zziplib"
license=('LGPL' 'MPL')
depends=('zlib')
makedepends=('python' 'xmlto' 'zip' 'cmake' 'ninja')
source=($pkgname-$pkgver.tar.gz::"https://github.com/gdraheim/zziplib/archive/v$pkgver.tar.gz")
sha512sums=('bed63fa7d430bd197bb70084f28ae6edc4c4120655b882bc8367f968b32c03340bb6d9bf1b14a5fcc5a1160d91ccf00e7b1131a4123da5d52233a84840ba8b7e')

build() {
  cd ${pkgname}-${pkgver}
  cmake \
    -Bbuild \
    -GNinja \
    -DZZIPDOCS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
