# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-panel
pkgver=2.4.0
pkgrel=2
pkgdesc="The LXQt desktop panel"
arch=("x86_64" "aarch64" "riscv64" "loongarch64")
groups=("lxqt")
url="https://github.com/lxqt/$pkgname"
license=("LGPL2.1")
depends=(
  "libdbusmenu-lxqt" "lxqt-menu-data" "lxqt-globalkeys"
  "solid" "libQt6Xdg.so" "layer-shell-qt"
)
optdepends=(
  "libpulse: Volume control plugin"
  "alsa-lib: Volume control plugin"
  "libstatgrab: CPU monitor and Network monitor plugins"
  "libsysstat: System Statistics plugin"
  "lm_sensors: Sensors plugin"
)
makedepends=(
  "lxqt-build-tools" "liblxqt" "libpulse" "libstatgrab" "libsysstat"
  "alsa-lib" "linux-headers" "qt6-base-devel"
)
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz" no-x11.patch)
sha256sums=('23b9cda6e6ad47df61d2e813de2fced52597fd547de120d2eae8df5db4573702'
            'a72934fb229305a46023065445f8170b063aebf7a96701544c215a79392c465b')

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  # KBINDICATOR_PLUGIN: X11-XCB
  # SENSORS_PLUGIN: lm_sensors
  # TRAY_PLUGIN: X11-XCB
  cmake -B build -S "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DKBINDICATOR_PLUGIN=OFF \
    -DSENSORS_PLUGIN=OFF \
    -DTRAY_PLUGIN=OFF
        
  make -C build
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
