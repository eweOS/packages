# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-gtk
pkgver=5.1.5
pkgrel=1
pkgdesc="Fcitx5 gtk im module and glib based dbus client library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-gtk"
license=('LGPL-2.1-or-later')
groups=('fcitx5-im')
provides=('fcitx-gtk')
depends=('musl' 'llvm-libs' 'glib' 'libxkbcommon' 'pango' 'cairo' 'gdk-pixbuf')
makedepends=('python' 'extra-cmake-modules' 'gobject-introspection' 'gtk3' 'gtk4' 'ninja' 'vulkan-headers' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.zst")
sha512sums=('0b67b1d8f162a3a3ea467e75f01a37b9de974c538e137f6bc0c092f0fbfb5a99ecd80ec853b7d98168203e665180c599e7f1c927e0dc00feaf8ad767be90c2bf')

build(){
  cd $pkgname-$pkgver
  cmake -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DENABLE_GTK2_IM_MODULE=OFF \
    .
  ninja
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
}
