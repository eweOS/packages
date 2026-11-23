# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=plasma-nm
pkgver=6.8.3
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://kde.org/plasma-desktop/'
license=(GPL-2.0-or-later)
depends=(glib2
         kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kcoreaddons
         kdbusaddons
         ki18n
         kio
         kjobwidgets
         knotifications
         kirigami
         kirigami-addons
         kquickcharts
         kservice
         kwidgetsaddons
         kwindowsystem
         libnm
         libplasma
         llvm-libs
         modemmanager-qt
         musl
         networkmanager-qt
         openssl
         plasma-workspace
         prison
         qcoro
         qt6-base
         qt6-declarative
         'qtkeychain-qt6>=0.16.0'
         solid)
makedepends=(extra-cmake-modules)
groups=(plasma)
# 0001: Downstream, remove X11-only window state handling for Wayland-only eweOS
# 0002: Backport, allow additional mobile providers in tests
# https://invent.kde.org/plasma/plasma-nm/-/commit/6757c3e0c913a6adff7eb4443740462015946bf2
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgname-$pkgver.tar.xz
        0001-remove-x11-window-state.patch
        0002-tests-allow-additional-mobile-providers.patch)
sha256sums=('dd5e6e01efde63220110401f713165c77433ad7fb78664e3c94dc36bb4011554'
            '808d55d7ca84746862450067aa8d1187cebfaa2fd8d619d42a4ff535dd707cb3'
            '5b3094df499c2492a4fa1892a77fef269b0bcac37637bd83840fd91e746e8802')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  # openconnect is not packaged in eweOS.
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_OPENCONNECT=OFF \
    -DBUILD_TESTING=ON
  cmake --build build
}

check() {
  QML2_IMPORT_PATH="$srcdir/build/bin" QML_IMPORT_PATH="$srcdir/build/bin" \
    QT_QPA_PLATFORM=offscreen ctest --test-dir "$srcdir/build" --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  _install_license_ "$srcdir/$pkgname-$pkgver/LICENSES/GPL-2.0-or-later.txt"
}
