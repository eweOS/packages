# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=cmatrix
pkgver=2.0
pkgrel=2
pkgdesc="A curses-based scrolling 'Matrix'-like screen"
arch=(x86_64 aarch64)
url="https://www.asty.org/cmatrix/"
license=('GPL3')
depends=('ncurses')
makedepends=('cmake')
optdepends=('kbd: cmatrix-tty custom font'
  'xterm: cmatrix-tty custom font')
source=("cmatrix-$pkgver.tgz::https://github.com/abishekvashok/cmatrix/archive/v$pkgver.tar.gz")
sha512sums=('1aeecd8e8abb6f87fc54f88a8c25478f69d42d450af782e73c0fca7f051669a415c0505ca61c904f960b46bbddf98cfb3dd1f9b18917b0b39e95d8c899889530')

# cmatrix-tty is ignored, see archlinux

prepare()
{
  mkdir build
}

build()
{
  cd build
  cmake ../$pkgname-$pkgver \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    make
}

package()
{
  # only the binary has a target to install
  make -C build DESTDIR="$pkgdir" install

  cd $pkgname-$pkgver

  # install X font
  install -D -m644 mtx.pcf "$pkgdir"/usr/share/fonts/misc/mtx.pcf

  # install console font
  install -D -m644 matrix.fnt "$pkgdir"/usr/share/kbd/consolefonts/matrix.fnt
  install -D -m644 matrix.psf.gz "$pkgdir"/usr/share/kbd/consolefonts/matrix.psf.gz

  for i in AUTHORS NEWS COPYING README ChangeLog INSTALL; do
    install -Dm644 $i "$pkgdir/usr/share/doc/$pkgname/$i"
  done

  install -Dm644 cmatrix.1 "$pkgdir/usr/share/man/man1/cmatrix.1"
}
