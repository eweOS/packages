# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=kwin
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(breeze
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kdecoration
         kglobalaccel
         kguiaddons
         ki18n
         kidletime
         kirigami
         kitemmodels
         knewstuff
         knighttime
         knotifications
         kpackage
         kquickcharts
         krunner
         kservice
         ksvg
         kwayland
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         lcms2
         libdisplay-info
         libdrm
         libei
         libepoxy
         libinput
         libpipewire
         libqaccessibilityclient-qt6
         libxcvt
         libxkbcommon
         mesa
         pipewire-session-manager
         libplasma
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-multimedia
         qt6-sensors
         qt6-tools
         qt6-wayland
         seatd
         wayland)
makedepends=(extra-cmake-modules
             krunner
             plasma-wayland-protocols
             python
             wayland-protocols
             linux-headers
             qt6-base-devel)
optdepends=('maliit-keyboard: virtual keyboard for kwin-wayland')
groups=(plasma)
# 0001: Downstream, avoid X11-only headers when building Wayland-only KWin.
# 0002: Downstream, add a libseat session backend for seatd.
source=(
  https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz
  no-x11.patch
  session-seatd.patch
)
options=(!strip)
sha256sums=('fd5cb783f220ea4526a9afee2f72b582c3e87ef7f91b19bc5c7a6662ffe7fbdc'
            '21fb4a7c2922535810ad9da691cfc9bb7d0b2c9f251bfe8b365c15f3cab3e1de'
            '1e8f3a9b17dd70a33f9c7c6be48a772343796ec56b6e2fc798a9c433db8b8ecd')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DKWIN_BUILD_X11=OFF \
    -DKWIN_BUILD_GLOBALSHORTCUTS=OFF \
    -DKWIN_BUILD_SCREENLOCKER=OFF \
    -DCMAKE_BUILD_TYPE=Debug
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # plasma-kwin_wayland.service
  rm -r "$pkgdir/usr/lib/systemd"
}
