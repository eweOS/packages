# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=make
pkgver=4.4
pkgrel=1
arch=(x86_64 aarch64)
pkgdesc="GNU make utility to maintain groups of programs"
url="https://www.gnu.org/software/make"
license=(GPL3)
groups=(base-devel)
makedepends=(make)

source=(
  "http://ftp.gnu.org/gnu/make/make-${pkgver}.tar.gz"
)

sha256sums=(
  'SKIP'
)

build()
{
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-nls
  make
}

package()
{
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
