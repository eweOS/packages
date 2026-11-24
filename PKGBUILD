# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kddockwidgets
pkgver=2.5.1
pkgrel=1
pkgdesc='Dock widgets library for Qt 6'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/KDAB/KDDockWidgets'
license=(GPL-2.0-only
         GPL-3.0-only)
depends=(fmt
         qt6-base
         qt6-declarative
         spdlog)
makedepends=(cmake
             nlohmann-json
             qt6-base-devel
             qt6-declarative-devel
             qt6-tools)
# 0001: Downstream, avoid the Qt private X11 header; eweOS does not support X11
source=("kddockwidgets-$pkgver.tar.gz::https://github.com/KDAB/KDDockWidgets/releases/download/v$pkgver/kddockwidgets-$pkgver.tar.gz"
        0001-remove-X11-private-header-usage.patch)
sha256sums=('d86c86c7a186a16400e08f78da2c6d0ac792d45822ced5cba29e3537edee952a'
            '1f74c56905316379ec5bc5860b75f6bc4d9170d2f5cfc7975aa77a23c8ba2bfc')

prepare() {
  _patch_ "KDDockWidgets-$pkgver"
}

build() {
  cmake -B build -S "KDDockWidgets-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDDockWidgets_FRONTENDS='qtwidgets;qtquick' \
    -DKDDockWidgets_EXAMPLES=OFF \
    -DKDDockWidgets_TESTS=OFF
  cmake --build build
}

package() {
  cd "KDDockWidgets-$pkgver"
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
  _install_license_ LICENSE.txt LICENSE.txt
  _install_license_ LICENSES/GPL-2.0-only.txt GPL-2.0-only.txt
  _install_license_ LICENSES/GPL-3.0-only.txt GPL-3.0-only.txt
}
