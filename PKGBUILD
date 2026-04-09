# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=libburn
# pl01
pkgver=1.5.8
pkgrel=1
pkgdesc="Library for reading, mastering and writing optical discs"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('musl')
makedepends=('linux-headers')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
options=('!emptydirs')
sha256sums=('8e24dd99f5b7cafbecf0116d61b619ee89098e20263e6f47c793aaf4a98d6473')

prepare()
{
  cd "${pkgname}-${pkgver/.pl01/}"
  autoreconf -fiv
}

build()
{
  cd "${pkgname}-${pkgver/.pl01/}"
  ./configure --prefix=/usr --disable-static
  make
}

package()
{
  cd "${pkgname}-${pkgver/.pl01/}"
  make DESTDIR="${pkgdir}" install
}
