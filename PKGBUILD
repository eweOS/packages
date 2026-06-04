# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Julian Droske <juliandroske@outlook.com>

pkgname=libplasma
pkgver=6.5.5
pkgrel=3
pkgdesc='Plasma library and runtime components'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(plasma-activities
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kglobalaccel
         ki18n
         kiconthemes
         kio
         kirigami
         knotifications
         kpackage
         ksvg
         kwidgetsaddons
         kwindowsystem
         libglvnd
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-wayland
         wayland)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
	     qt6-base-devel
             qt6-tools)
conflicts=(plasma-framework)
replaces=(plasma-framework)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz no-x11.patch)
sha256sums=('7d88f9bd0f90b90f4d2290cd8fa0f37e7af3810a0ed58c7d226a02838ab8a71a'
            'f64601c4cd8587c55418b9b2758ab41cf1e2af1867f4465dfb937d315b3688a1')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF \
    -DWITHOUT_X11=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
