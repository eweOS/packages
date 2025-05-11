# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=libfm
pkgname=(libfm libfm-extra libfm-gtk3)
pkgver=1.4.0
pkgrel=1
pkgdesc='Library for file management'
url='https://lxde.org/'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL')
depends=('gtk3' 'libexif' 'menu-cache')
makedepends=('intltool' 'gtk-doc' 'vala')
source=(https://github.com/lxde/libfm/archive/$pkgver/$pkgbase-$pkgver.tar.gz)
sha256sums=('7d7b616411992389a4b7f35796109d605f30bc2ceab84d4081d1665254ebbf82')

prepare() {
  cd $pkgbase-$pkgver
  # Update xarchiver option
  # https://github.com/lxde/libfm/issues/35
  sed -i 's/create=xarchiver --add-to %F/create=xarchiver --compress %F/' data/archivers.list

  autoreconf -fi
}

build() {
  cd "$srcdir"
  # GTK+ 3 version
  [ -d gtk3 ] || cp -r $pkgbase-$pkgver gtk3
  cd gtk3
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-gnu-ld \
    --with-gtk=3 \
    --enable-gtk-doc

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package_libfm() {
  depends=('libexif' "libfm-extra=$pkgver" 'menu-cache')
  
  cd gtk3
  make DESTDIR="$pkgdir" install

  # Temporary fix to FS#32361
  rm -rf "$pkgdir"/usr/include/libfm
  mv "$pkgdir"/usr/include/libfm-1.0/ "$pkgdir"/usr/include/libfm

  # Split libfm-extra
  [[ -d "$srcdir/libfm-extra" ]] && rm -r "$srcdir/libfm-extra/"
  mkdir "$srcdir"/libfm-extra
  mv "$pkgdir"/usr/include/libfm/fm-{extra,version,xml-file}.h \
     "$pkgdir"/usr/lib/libfm-extra.* \
     "$pkgdir"/usr/lib/pkgconfig/libfm-extra.pc \
     "$srcdir/libfm-extra/"

  # Split libfm-gtk3
  [[ -d "$srcdir/libfm-gtk3" ]] && rm -r "$srcdir/libfm-gtk3/"
  mkdir "$srcdir"/libfm-gtk3
  mv "$pkgdir/usr/bin" \
     "$pkgdir"/usr/lib/libfm-gtk3.* \
     "$pkgdir"/usr/lib/libfm/modules/gtk-* \
     "$pkgdir/usr/lib/pkgconfig/libfm-gtk3.pc" \
     "$pkgdir/usr/share/applications" \
     "$pkgdir/usr/share/man" \
     "$srcdir/libfm-gtk3/"
}

package_libfm-extra() {
  pkgdesc="Extra library for file management" 
  depends=('glib2')

  cd "$srcdir"/libfm-extra
  mkdir -p "$pkgdir"/usr/{include/libfm,lib/pkgconfig}
  mv *.h "$pkgdir/usr/include/libfm"
  mv libfm-extra.so* "$pkgdir/usr/lib"
  mv libfm-extra.pc "$pkgdir/usr/lib/pkgconfig"
}

package_libfm-gtk3() {
  pkgdesc='GTK+ 3 library for file management'
  depends=('gtk3' 'menu-cache' "libfm=$pkgver")
  conflicts=('lxshortcut')

  cd "$srcdir"/libfm-gtk3
  mkdir -p "$pkgdir"/usr/{lib/{libfm/modules,pkgconfig},share}
  mv bin "$pkgdir/usr"
  mv libfm-gtk3.so* "$pkgdir"/usr/lib
  mv gtk-* "$pkgdir"/usr/lib/libfm/modules
  mv libfm-gtk3.pc "$pkgdir/usr/lib/pkgconfig"
  mv applications "$pkgdir/usr/share"
  mv man "$pkgdir/usr/share"
}
