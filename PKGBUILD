# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5
pkgver=5.1.9
pkgrel=1
pkgdesc="Next generation of fcitx"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5"
license=('LGPL-2.1-or-later AND Unicode-DFS-2016')
groups=('fcitx5-im')
provides=('fcitx')
depends=('cairo' 'dbus' 'iso-codes' 'libuv' 'libxkbcommon' 'pango' 'wayland' 'gdk-pixbuf' 'json-c')
makedepends=('ninja' 'wayland-protocols' 'fmt' 'extra-cmake-modules' 'zstd')
source=("https://download.fcitx-im.org/fcitx5/fcitx5/fcitx5-${pkgver}_dict.tar.zst")
sha512sums=('b4964eb48acf224f5bda66a5d81c673983e8e20822b28a37afae00c9319fff9bf5f684e417b799afd92ee51f3d44822d9954640f63ce75d846dbb4868c4a4a22')

build() {
  cd $pkgname-$pkgver

  cmake \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -DENABLE_X11=OFF \
    -DENABLE_ENCHANT=OFF \
    -DUSE_SYSTEMD=OFF \
    .
  ninja
}

check() {
  cd $pkgname-$pkgver
  ninja test
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" ninja install
  install -Dm644 LICENSES/Unicode-DFS-2016.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
