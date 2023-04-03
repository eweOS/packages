# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=libburn
pkgver=1.5.4 # .pl01
pkgrel=1
pkgdesc="Library for reading, mastering and writing optical discs"
arch=(x86_64 aarch64)
url="https://dev.lovelyhq.com/libburnia"
license=('GPL')
depends=('musl')
source=(https://files.libburnia-project.org/releases/${pkgname}-${pkgver}.tar.gz)
options=('!emptydirs')
sha256sums=('525059d10759c5cb8148eebc863bb510e311c663603da7bd2d21c46b7cf63b54')

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
