# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libgee
pkgver=0.20.6
pkgrel=1
pkgdesc="A collection library providing GObject-based interfaces and classes for commonly used data structures"
url="https://gitlab.gnome.org/GNOME/libgee"
license=(LGPL2.1)
arch=(x86_64 aarch64 riscv64)
depends=(glib2)
makedepends=(gobject-introspection vala autoconf-archive git)
source=("git+https://gitlab.gnome.org/GNOME/libgee.git#tag=$pkgver")
sha256sums=('46689f4659c4a92785189f75d2868417f12a79df48ae841aa055fb3c1b7013c6')

prepare() {
  cd libgee
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libgee
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd libgee
  # generates a bazillion traps - make sure systemd's core_pattern
  # is deactivated, or you'll DoS the journal and the system
  #make check
}

package() {
  depends+=(libg{lib,object,io}-2.0.so)
  provides+=(libgee-0.8.so)

  cd libgee
  make DESTDIR="$pkgdir" install
}
