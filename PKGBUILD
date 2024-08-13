# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libdbusmenu
pkgname=($pkgbase-glib $pkgbase-gtk3)
pkgver=16.04.0
pkgrel=1
pkgdesc='Library for passing menus over DBus'
url='https://launchpad.net/libdbusmenu'
arch=('x86_64' 'aarch64' 'riscv64')
license=('GPL3' 'LGPL2.1' 'LGPL3')
makedepends=('gobject-introspection' 'intltool' 'vala' 'autoconf' 'json-glib' 'glib2' 'gtk3')
options=('!emptydirs')
source=($url/${pkgver%.*}/$pkgver/+download/$pkgbase-$pkgver.tar.gz)
sha512sums=('ee9654ac4ed94bdebc94a6db83b126784273a417a645b2881b2ba676a5f67d7fc95dd2bb37bfb0890aa47299ed73cb21ed7de8b75f3fed6b69bfd39065062241')

prepare() {
  cd ${pkgbase}-$pkgver
  #FIXME: missing gtk-doc
  export GTKDOCIZE=echo
  autoreconf -fiv
}

build() {
  cd ${pkgbase}-$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-gtk=3 \
    --disable-dumper
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_libdbusmenu-glib() {
  depends=('glib2')

  cd ${pkgbase}-$pkgver
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
}

package_libdbusmenu-gtk3() {
  pkgdesc+=" (GTK+ 3 library)"
  depends=("${pkgbase}-glib" 'gtk3')

  cd ${pkgbase}-$pkgver
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-gtk DESTDIR="${pkgdir}" install
  make -j1 -C libdbusmenu-glib DESTDIR="${pkgdir}" uninstall
}
