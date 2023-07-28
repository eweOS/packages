# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libburn
# pl01
pkgver=1.5.6
pkgrel=1
pkgdesc="Library for reading, mastering and writing optical discs"
arch=(x86_64 aarch64 riscv64)
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('musl')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
options=('!emptydirs')
sha256sums=('7295491b4be5eeac5e7a3fb2067e236e2955ffdc6bbd45f546466edee321644b')

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
