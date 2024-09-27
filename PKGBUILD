# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libcanberra
pkgver=0.30
pkgrel=1
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification"
url="https://0pointer.net/lennart/projects/libcanberra/"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(libvorbis libltdl alsa-lib libpulse tdb sound-theme-freedesktop)
makedepends=(gtk-doc gtk3 git)
optdepends=('gtk3: canberra-gtk-play')
provides=(libcanberra-pulse libcanberra{,-gtk3}.so)
options=(libtool)
source=("git+https://git.0pointer.net/clone/libcanberra.git#tag=v$pkgver"
        no-lynx.patch::https://git.0pointer.net/libcanberra.git/patch/?id=5a71fffd3da981127d0a012dda1a1412acaee7d8
        libcanberra-multi-backend.patch)
sha256sums=('b1ac2a064527edc38154d3832ae31204ec6bb2272a5956a2b607b84ccbfd1f71'
            '7a0910dbab2ca924fee711a36a25e4432ba68ec3c9406493f98cf0d7d0f21479'
            '203eeebd43cad2d8a7fab4bedec1fde80b7af585e6030f47347a329a6ee434b7')

prepare() {
  cd libcanberra

  # https://bugs.archlinux.org/task/71341
  # https://bugs.freedesktop.org/show_bug.cgi?id=51662
  git apply -3 ../libcanberra-multi-backend.patch
  patch -p1 < ../no-lynx.patch

  ./autogen.sh
}

build() {
  cd libcanberra
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --enable-pulse \
      --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libcanberra

  make -j1 DESTDIR="$pkgdir" install
}
