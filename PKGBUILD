# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-panel
pkgver=2.1.4
pkgrel=1
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
  "alsa-lib" "linux-headers"
)
source=("https://github.com/lxqt/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.xz" no-x11.patch)
sha256sums=('ffd1b8ee73d20c61e7f4b8888593fa8c484ab9aa0f902c628415646eed2915e6'
            'ed92571784ec0b5ff91450657e1f200e1900487b2a8009cd19d97b6cee0a73bf')

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
