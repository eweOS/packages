# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-desktop-portal-kde
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='A backend implementation for xdg-desktop-portal using Qt/KF5'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         kconfig
         kcoreaddons
         kcrash
         kglobalaccel
         kguiaddons
         kiconthemes
         ki18n
         kio
         kio-fuse
         kirigami
         kirigami-addons
         kitemviews
         knotifications
         kpipewire
         kservice
         kstatusnotifieritem
         kwayland
         kwindowsystem
         libxkbcommon
         plasma-workspace
         qt6-base
         qt6-declarative
         qt6-wayland
         wayland
         xdg-desktop-portal)
makedepends=(extra-cmake-modules
             plasma-wayland-protocols
             wayland-protocols
             qt6-base-devel)
provides=(xdg-desktop-portal-impl)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('d7d695716ea101a76dbfccc2b97c07058b9caaa7bbbf8ad96a3ba6fcee84a109')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r $pkgdir/usr/lib/systemd
}
