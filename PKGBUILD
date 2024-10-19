# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zziplib
pkgver=0.13.78
pkgrel=2
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/gdraheim/zziplib"
license=('LGPL' 'MPL')
depends=('zlib')
makedepends=('python' 'xmlto' 'zip' 'cmake' 'ninja')
source=($pkgname-$pkgver.tar.gz::"https://github.com/gdraheim/zziplib/archive/v$pkgver.tar.gz")
sha512sums=('e96771c310a1a9eb227027e8c2a495409c01dd273b483b3a04119d6a273cce7c88ba77c192fcde5e85d0a37c847a0df8e521f460d00920e62153400f0743ea78')

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
