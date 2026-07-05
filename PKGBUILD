# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-gtk
pkgver=5.1.7
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
sha512sums=('0f6c1f00faab0898577969027ea88533e89123ebfe90c1076a4e6a900c4d992dcb34f8ccf20261b2565f3d8c53eed9780a5e9aca5add9487a7b291487e8b1d98')

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
