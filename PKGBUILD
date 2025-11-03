# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpg123
pkgver=1.33.3
pkgrel=1
pkgdesc='Console based real time MPEG Audio Player for Layer 1, 2 and 3'
url='https://mpg123.de/'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('LGPL2.1')
depends=('alsa-lib')
makedepends=('sdl2' 'libpulse')
optdepends=(
  'sdl2: for sdl audio support'
  'libpulse: for pulse audio support'
  'perl: for conplay'
)
provides=(lib{mpg,out,syn}123.so)
source=(https://downloads.sourceforge.net/sourceforge/mpg123/mpg123-${pkgver}.tar.bz2)
sha512sums=('509841e296dabf6039b5301e8160fcea37f13963d7bedf12082d2ce0d3bd14229fd906cb899eea2be9942fb994d9e1e4f00c757ca96f4ca7d5a14469cf13b91d')

build() {
  cd mpg123-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-int-quality \
    --with-audio="alsa sdl pulse"
  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd mpg123-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 755 scripts/conplay -t "${pkgdir}/usr/bin"
}
