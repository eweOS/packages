# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libcue
pkgver=2.4.3
pkgrel=1
pkgdesc='Parses so-called cue sheets and handles the parsed data'
url='https://github.com/lipnitsk/libcue/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lipnitsk/libcue/archive/v$pkgver.tar.gz")
makedepends=('cmake' 'bison' 'flex')
sha512sums=('f8ad2650f1a13eb9076f9577cde8453280789d2ee7dec83c6f7ec35f06c77c3e935e26d0e20042c7a6294bccaaebc8391cb586653b45fd45c1209428e860f210')

build()
{
  cd ${pkgname}-${pkgver}
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    .
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
