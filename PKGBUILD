# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcanberra
pkgver=0.30
pkgrel=4
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification"
url="https://0pointer.net/lennart/projects/libcanberra/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL)
depends=(libvorbis libltdl alsa-lib libpulse tdb sound-theme-freedesktop)
makedepends=(gtk-doc gtk3 git)
optdepends=('gtk3: canberra-gtk-play')
provides=(libcanberra-pulse libcanberra{,-gtk3}.so)
options=(libtool)
source=("http://0pointer.de/lennart/projects/libcanberra/libcanberra-$pkgver.tar.xz"
        libcanberra-multi-backend.patch)
sha256sums=('c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72'
            '203eeebd43cad2d8a7fab4bedec1fde80b7af585e6030f47347a329a6ee434b7')

prepare() {
  # https://bugs.archlinux.org/task/71341
  # https://bugs.freedesktop.org/show_bug.cgi?id=51662
  _patch_ $pkgname-$pkgver

  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --enable-pulse \
      --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver

  make -j1 DESTDIR="$pkgdir" install
}
