# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5-gtk
pkgver=5.1.6
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
sha512sums=('ea87ab7500dcf18285e784504983e000895f7662d4684c231be4aae81ba995dea84bc9ae82b706562004fb39d1bff00b4e94f0b898b9676743710a3ec37563f0')

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
