# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=fcitx5
pkgver=5.1.22
pkgrel=1
pkgdesc="Next generation of fcitx"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/fcitx/fcitx5"
license=('LGPL-2.1-or-later AND Unicode-DFS-2016')
groups=('fcitx5-im')
provides=('fcitx')
depends=('cairo' 'dbus' 'iso-codes' 'libuv' 'libxkbcommon' 'pango' 'wayland' 'gdk-pixbuf')
makedepends=('ninja' 'wayland-protocols' 'fmt' 'extra-cmake-modules' 'zstd'
	     'linux-headers' 'nlohmann-json' 'plasma-wayland-protocols')
source=("https://download.fcitx-im.org/fcitx5/fcitx5/fcitx5-${pkgver}_dict.tar.zst")
sha512sums=('de37034aa4e8fd1a2de79e01ce5c622625eebe43391b5a2aa850a17cef0d08d17d1f735eadc3605b0fda5062f6e2ab8bdb82f4cb52f42e799f2e3b679776a4f0')

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
