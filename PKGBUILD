# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5
pkgver=5.1.17
pkgrel=1
pkgdesc="Next generation of fcitx"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5"
license=('LGPL-2.1-or-later AND Unicode-DFS-2016')
groups=('fcitx5-im')
provides=('fcitx')
depends=('cairo' 'dbus' 'iso-codes' 'libuv' 'libxkbcommon' 'pango' 'wayland' 'gdk-pixbuf' 'json-c')
makedepends=('ninja' 'wayland-protocols' 'fmt' 'extra-cmake-modules' 'zstd'
	     'linux-headers')
source=("https://download.fcitx-im.org/fcitx5/fcitx5/fcitx5-${pkgver}_dict.tar.zst")
sha512sums=('fe3f13d7615ae823b0746bd731d0eac4df90b216c22c186c4f63ab71c0450f38adfa558e906a5493bb5eab873bffea913477c8dcb2ba7055668305cf995e235f')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver

  # std::osyncstream requires -fexperimental-library with libc++
  CXXFLAGS="$CXXFLAGS -fexperimental-library"	\
  LDFLAGS="$LDFLAGS -fexperimental-library"	\
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
