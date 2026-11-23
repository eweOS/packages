# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-desktop
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE Plasma Desktop'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(attica
         font-emoji
         icu
         kauth
         kbookmarks
         kcmutils
         kcodecs
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
         kirigami-addons
         kitemmodels
         kitemviews
         kjobwidgets
         kmenuedit
         knewstuff
         knotifications
         knotifyconfig
         kpackage
         kpipewire
         krunner
         kservice
         ksvg
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libcanberra
         libksysguard
         libxkbcommon
         libplasma
         plasma-activities
         plasma-activities-stats
         plasma-workspace
         plasma5support
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-wayland
         sdl2
         solid
         sonnet
         systemsettings
         wayland
         xdg-user-dirs)
optdepends=('bluedevil: Bluetooth applet'
            'glib2: kimpanel IBUS support'
            'ibus: kimpanel IBUS support'
            'kaccounts-integration: OpenDesktop integration plugin'
            'kscreen: screen management'
            'libaccounts-qt: OpenDesktop integration plugin'
            'packagekit-qt6: to install new krunner plugins'
            'plasma-nm: Network manager applet'
            'plasma-pa: Audio volume applet'
            'scim: kimpanel SCIM support')
makedepends=(extra-cmake-modules
             intltool
             kaccounts-integration
             kdoctools
             qt6-base-devel)
groups=(plasma)
# 0001: Downstream, drop X11-only components for eweOS
# 0002: Downstream, revert manual polkit authorization because polkit-qt6 is unavailable
# https://github.com/KDE/plasma-desktop/commit/9925397bb89baac7136a5eaa540bc5fcb0668754
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz
        0001-no-x11-ewe.patch
        0002-revert-dateandtime-polkit-auth.patch)
sha256sums=('aa050cfb1005d6f806dc347bb11bc583d5360dd11d51b4501f6328aa7b26d370'
            'de2ad1e59ed38673bc9f16b5e877c29be53a5c5a4cb893144b770f444933efd6'
            'e6eeaf56e94534c93cdfbebf5ddf1cc6d99f08f135fb78afebdece52c6552b2e')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  # The tablet KCM needs libwacom, which is not packaged in eweOS.
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DBUILD_KCM_TABLET=OFF
  cmake --build build
}

check() {
  # Headless Qt and a session bus are required by the KIO-backed tests.
  QT_QPA_PLATFORM=offscreen dbus-run-session -- ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
