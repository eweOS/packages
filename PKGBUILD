# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-gtk
pkgver=5.1.2
pkgrel=1
pkgdesc="Fcitx5 gtk im module and glib based dbus client library"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5-gtk"
license=('GPL')
groups=('fcitx5-im')
provides=('fcitx-gtk')
depends=('glib')
makedepends=('python' 'extra-cmake-modules' 'gobject-introspection' 'gtk3' 'gtk4' 'ninja' 'vulkan-headers')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.xz")
sha512sums=('585a64b81caef55391e352a5efc2efcded1220c8be378be93e4fc6abc6b70132b3bb3211271d5ed02b1623a6ffcf7ce784de026969025b5efb3497f82676fefa')

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
