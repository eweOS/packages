# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-gtk
pkgver=5.1.4
pkgrel=1
pkgdesc="Fcitx5 gtk im module and glib based dbus client library"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5-gtk"
license=('GPL')
groups=('fcitx5-im')
provides=('fcitx-gtk')
depends=('glib')
makedepends=('python' 'extra-cmake-modules' 'gobject-introspection' 'gtk3' 'gtk4' 'ninja' 'vulkan-headers' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/$pkgname/$pkgname-$pkgver.tar.zst")
sha512sums=('901e00a167f835bb56e7450eb4ab409998643f10c5a93ea12e111161478b0a1127554a70d7d31930e5ea91a836883c7205735f9e25a3a5ec83d4d4942910669c')

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
