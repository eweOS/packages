# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lxqt-panel
pkgver=2.2.2
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
sha256sums=('5d150e7a4e8818715b8f4eec7f4bb26c98f740cd56f972199b35fc7c81da1969'
            'bbfcf634f3ea291f6cfadaba789e0c941c6e22c73b0fbaa3e5b3d435a3672847')

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
