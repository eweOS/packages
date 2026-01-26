# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=discover
pkgver=6.5.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://apps.kde.org/discover/'
license=(LGPL-2.0-or-later)
depends=(appstream-qt
         attica
         discount
         llvm-libs
         glib2
         musl
         kcmutils
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         ki18n
         kiconthemes
         kidletime
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knewstuff
         knotifications
         kservice
         kstatusnotifieritem
         kuserfeedback
         kwidgetsaddons
         kwindowsystem
         purpose
         qcoro
         qqc2-desktop-style
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             flatpak)
optdepends=('flatpak: Flatpak packages support')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('4202dd2d854b716c15b2f374965f5c1af69915d379c25bcbd4d0fbcf73699634')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
