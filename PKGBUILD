# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libgee
pkgver=0.20.8
pkgrel=1
pkgdesc="A collection library providing GObject-based interfaces and classes for commonly used data structures"
url="https://gitlab.gnome.org/GNOME/libgee"
license=(LGPL-2.1-or-later)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(glib2)
makedepends=(gobject-introspection vala autoconf-archive git)
source=("git+https://gitlab.gnome.org/GNOME/libgee.git#tag=$pkgver")
sha256sums=('59025d6e55bf8fa566d0733a85e8ecb61391619f4504e752521da88d9df210af')

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
