# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5
pkgver=5.1.24
pkgrel=1
pkgdesc="Next generation of fcitx"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5"
license=('LGPL-2.1-or-later AND Unicode-DFS-2016')
groups=('fcitx5-im')
provides=('fcitx')
depends=('cairo' 'dbus' 'iso-codes' 'libuv' 'libxkbcommon' 'pango' 'wayland'
	 'gdk-pixbuf' 'librsvg')
makedepends=('ninja' 'wayland-protocols' 'fmt' 'extra-cmake-modules' 'zstd'
	     'linux-headers' 'nlohmann-json' 'plasma-wayland-protocols')
source=("https://download.fcitx-im.org/fcitx5/fcitx5/fcitx5-${pkgver}_dict.tar.zst")
sha512sums=('9e7e22efc1827d5a868871dcf1ae4722c2d45aa0f7bce50c846150861446238467d8bacb8c7a59061b6cfbc7cadd3f561f02500155e42b1044bd2547c2684445')

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
