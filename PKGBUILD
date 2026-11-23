# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-welcome
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='A friendly onboarding wizard for Plasma'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(llvm-libs
         musl
         kcmutils
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kirigami
         kirigami-addons
         kjobwidgets
         knewstuff
         kservice
         ksvg
         kuserfeedback
         kwindowsystem
         libplasma
         plasma-nm
         plasma5support
         qt6-5compat
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz)
sha256sums=('daa328c588f216ee50db8b1e7fec0d6239c4b06b6b69d4e6225c8677e785a4e8')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
