# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-workspace
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE Plasma Workspace'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(appstream-qt
         dbus
         fontconfig
         freetype2
         icu
         kactivitymanagerd
         karchive
         kauth
         kbookmarks
         kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kde-cli-tools
         kdeclarative
         kded
         kdbusaddons
         kglobalaccel
         kguiaddons
         kholidays
         ki18n
         kiconthemes
         kio
         kio-extras
         kio-fuse
         kirigami
         kirigami-addons
         kitemmodels
         kjobwidgets
         knewstuff
         knotifications
         knotifyconfig
         kpackage
         kparts
         kpipewire
         krunner
         kquickcharts
         kservice
         kstatusnotifieritem
         ksvg
         ktexteditor
         ktextwidgets
         kunitconversion
         kuserfeedback
         kwallet
         kwayland
         kwidgetsaddons
         kwin
         kwindowsystem
         kxmlgui
         layer-shell-qt
         libcanberra
         libkexiv2
         libkscreen
         libksysguard
         libplasma
         libqalculate
         ocean-sound-theme
         phonon-qt6
         plasma-activities
         plasma-activities-stats
         prison
         python
         plasma5support
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-location
         qt6-positioning
         qt6-svg
         qt6-tools
         qt6-virtualkeyboard
         union
         qt6-wayland
         sh
         solid
         wayland
         zlib)
makedepends=(extra-cmake-modules
             kdoctools
             networkmanager-qt
             plasma-wayland-protocols
             qt6-base-devel
             qt6-wayland-devel
             qcoro)
optdepends=('appmenu-gtk-module: global menu support for GTK2 and some GTK3 applications'
            'baloo: Baloo search runner'
            'discover: manage applications installation from the launcher'
            'kdepim-addons: displaying PIM events in the calendar'
            'kwayland-integration: Wayland integration for Qt5 applications'
            'networkmanager-qt: IP based geolocation'
            'plasma-workspace-wallpapers: additional wallpapers'
            'plasma5-integration: use Plasma settings in Qt5 applications'
            'xdg-desktop-portal-gtk: sync font settings to Flatpak apps')
conflicts=(plasma-wayland-session)
replaces=(plasma-wayland-session)
groups=(plasma)
source=(
  https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz
  no-x11-ewe.patch
)
sha256sums=('3f984e2d960c252ee6353ef639807379c7d1bb2777fecedd047943209c52ffcb'
            '7c9d9deac5ee9a41fb92aa53ab911f703690b8773fb587877ded0e62f00d60a5')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGLIBC_LOCALE_GEN=OFF \
    -DBUILD_TESTING=OFF \
    -DWITH_X11=OFF
  cmake --build build
}

package() {
  depends+=(plasma-integration)

  DESTDIR="$pkgdir" cmake --install build
  if [ -d "$pkgdir/usr/lib/systemd" ]; then
    rm -r "$pkgdir/usr/lib/systemd"
  fi
}
