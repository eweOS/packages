# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kinfocenter
pkgver=6.5.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='A utility that provides information about a computer system'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(dmidecode
         llvm-libs
         musl
         glu
         kauth
         kcmutils
         kconfig
         kcoreaddons
         kdeclarative
         ki18n
         kio
         kirigami
         kservice
         libdisplay-info
         libdrm
         libpulse
         libusb
         lm_sensors
         mesa-utils
         qt6-base
         qt6-declarative
         sh
         solid
         systemsettings
         vulkan-tools)
makedepends=(extra-cmake-modules
             linux-headers
             kdoctools
             vulkan-headers)
optdepends=('fwupd: firmware security module'
            'plasma-disks: SMART devices health monitor')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz kcm-about-distrorc)
sha256sums=('ffe09a169c76c79ce551ef2b4eee97a6e1d8726d0b1a2fc247f78da188604649'
            'fedd3ab36d246ad3a4807b2bcb5c2377bc8b860db7c18af2eaf10a994b215252')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_LIBEXECDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  
  install -Dm644 "$srcdir"/kcm-about-distrorc "$pkgdir"/etc/xdg/kcm-about-distrorc
}
