# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Julian Droske <juliandroske@outlook.com>

pkgname=libplasma
pkgver=6.8.3
pkgrel=1
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
             qt6-tools
             wayland-protocols)
conflicts=(plasma-framework)
replaces=(plasma-framework)
groups=(plasma)
# 0001: Backport, remove stale KWindowInfo include dropped from KF6 kwindowsystem
# https://invent.kde.org/plasma/libplasma/-/commit/39ba1c0ff589cc13165be5488f2da53fd510f91d
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz
        0001-remove-unused-KWindowInfo-include.patch)
sha256sums=('76f081f2d96c7dccf1f29fa0a301572d0115b0c5bec1b32ede0fea4a45c254c4'
            '49c59fba859296ff33fc866de2f40cc653eaa5cef6209b05a5fd7dc95113836b')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
