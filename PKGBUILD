# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=plasma-integration
pkgname=plasma-integration
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='Qt Platform Theme integration plugins for the Plasma workspaces'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         kcolorscheme
         kcompletion
         kconfig
         kcoreaddons
         kguiaddons
         kiconthemes
         ki18n
         kio
         kjobwidgets
         kservice
         kstatusnotifieritem
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qqc2-breeze-style
         qqc2-desktop-style
         qt6-base
         qt6-declarative
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             qt6-base-devel)
checkdepends=(dbus hicolor-icon-theme)
groups=(plasma)
# 0001: Downstream, support WITH_X11=OFF
# 0002: Downstream, set XDG_DATA_DIRS for the icon theme test
source=(
  https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz
  0001-guard-x11-integration.patch
  0002-set-test-xdg-data-dirs.patch
)
sha256sums=('e32e074d79159f584c3098de550a2de46142049234602dffd50596c574816e5b'
            '742b7877d7d1ee8caf6e913c81b3d2f5c40857a9d7cb37a214a7e69fb9930722'
            '9e3cf695afa484eb627dd49b26a7b1f5072925e18d7289cbf0c88cb492a48f3e')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=ON \
    -DBUILD_QT5=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

check() {
  QT_QPA_PLATFORM=offscreen QT_QPA_PLATFORMTHEME=kde \
    QT_PLUGIN_PATH="$srcdir/build/bin" \
    dbus-run-session -- ctest --test-dir build --output-on-failure
}

package() {
  depends+=(xdg-desktop-portal-kde)

  DESTDIR="$pkgdir" cmake --install build
}
