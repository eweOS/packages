# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5
pkgver=5.1.10
pkgrel=1
pkgdesc="Next generation of fcitx"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/fcitx/fcitx5"
license=('LGPL-2.1-or-later AND Unicode-DFS-2016')
groups=('fcitx5-im')
provides=('fcitx')
depends=('cairo' 'dbus' 'iso-codes' 'libuv' 'libxkbcommon' 'pango' 'wayland' 'gdk-pixbuf' 'json-c')
makedepends=('ninja' 'wayland-protocols' 'fmt' 'extra-cmake-modules' 'zstd'
	     'linux-headers')
source=("https://download.fcitx-im.org/fcitx5/fcitx5/fcitx5-${pkgver}_dict.tar.zst")
sha512sums=('196bc26f7dd50596da90e6b4b0a8b4886b57ec928c182427fb8763507f1f4cb39a252bfddcbd6eccaa0cc920070b7b9fda03f18fd444f84154ddd925678ad7d4')

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
