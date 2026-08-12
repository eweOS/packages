# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=mpg123
pkgver=1.33.7
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
sha512sums=('694743802bb7be0f4a39bf62e681ae0bfed769cb87dc6c5b6fb5f9245966631efb5c5b9bd58588f7af55ced5d020f97c8a54993e71b5295bc45ebd152473f40e')

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
