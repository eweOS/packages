# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=plasma-integration
pkgname=plasma-integration
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
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
groups=(plasma)
# 0001: Downstream, fix build with WITH_X11=OFF
source=(
  https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz
  0001-guard-x11-integration.patch
)
sha256sums=('e32e074d79159f584c3098de550a2de46142049234602dffd50596c574816e5b'
            'e8911ddef0315b890e9c19938976f3c8c787bfb81207d2f731459bd91fabcfce')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  # Autotests require KWindowInfo, which eweOS kwindowsystem does not provide.
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  depends+=(xdg-desktop-portal-kde)

  DESTDIR="$pkgdir" cmake --install build
}
