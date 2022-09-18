# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname='nsnake'
pkgver='3.0.1'
pkgrel='2'
pkgdesc='Customizable Snake game with ncurses for the terminal'
arch=('x86_64')
url='http://nsnake.alexdantas.net/'
license=('GPL3')
depends=('ncurses' 'llvm-libs')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/alexdantas/nSnake/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/nSnake-${pkgver}"
  make all CXX=/usr/bin/c++
}

package() {
  cd "${srcdir}/nSnake-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX='/usr' CXX=/usr/bin/c++ install
}
