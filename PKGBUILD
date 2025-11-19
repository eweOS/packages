# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Julian Droske <juliandroske@outlook.com>

pkgname=libplasma
pkgver=6.5.2
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
             qt6-tools)
conflicts=(plasma-framework)
replaces=(plasma-framework)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz no-x11.patch)
sha256sums=('194fcfd972b7c0882e88528603d8aef69aa0a5ef199730bf5b1e33022f21e6e1'
            '39f0f65542d6ebeb5632a785aad780cec994e874f1a590000dec3676f5d1e506')

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
