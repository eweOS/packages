# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dolphin
pkgver=26.08.3
pkgrel=1
pkgdesc='KDE File Manager'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://apps.kde.org/dolphin/'
license=(LGPL-2.0-or-later)
depends=(baloo
         baloo-widgets
         llvm-libs
         musl
         kbookmarks
         kcmutils
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         kguiaddons
         ki18n
         kiconthemes
         kio
         kio-extras
         kjobwidgets
         knewstuff
         knotifications
         kparts
         kservice
         ktextwidgets
         kuserfeedback
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qt6-base
         qt6-multimedia
         solid)
makedepends=(extra-cmake-modules
             kdoctools)
optdepends=('ffmpegthumbs: video thumbnails'
            'filelight: detailed disk usage statistics'
            'kde-cli-tools: for editing file type options'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'kdenetwork-filesharing: samba usershare properties menu'
            'kdf: view disk usage'
            'kio-admin: for managing files as administrator'
            'kompare: comparing files menu action'
            'konsole: terminal panel'
            'purpose: share context menu')
groups=(kde-applications
        kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz no-x11.patch)
sha256sums=('8d73851ba561f81b9aa27bba53157a59d9eeaa548fd82f0c9c2167b5a7c4a65d'
            'e2dc220589d5fa11e8706e50fa5057ce89b6f6aa4f717886619737a3fe8a74e4')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm -r $pkgdir/usr/lib/systemd
}
