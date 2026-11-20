# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=breeze
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
arch=(x86_64 aarch64 riscv64 loongarch64)
pkgdesc='Artwork, styles and assets for the Breeze visual style for the Plasma Desktop'
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(breeze-icons
         frameworkintegration
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kdecoration
         kguiaddons
         ki18n
         hicolor-icon-theme
         kiconthemes
         kirigami
         kwidgetsaddons
         kwindowsystem
         qt6-base
         qt6-declarative
         qt6-svg)
makedepends=(extra-cmake-modules)
optdepends=('breeze-gtk: Breeze widget style for GTK applications')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('1d47a61f9f397f212d7a23d7ed7a7289b026757a050610304bb945dc067937e2')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
