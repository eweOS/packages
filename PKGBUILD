# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-gtk
pkgver=5.1.8
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
sha512sums=('deceaa88fd6c6247d9803884289f618f945561cb618d399988672c1448b4f3e89cddd452b6b3f36b7353d6ccfe09e7f09c14192d1fed15d54ab704e3fde0e6d2')

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
