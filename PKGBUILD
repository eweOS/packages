# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=lm_sensors
pkgver=3.6.2
_pkgver=${pkgver//./-}
pkgrel=3
pkgdesc="User space tools for general SMBus access and hardware monitoring"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hramrach/lm-sensors"
license=('GPL-2.0-only OR LGPL-2.1-only')
depends=('bash' 'musl')
makedepends=('rrdtool' 'perl')
optdepends=('rrdtool: for logging with sensord'
            'perl: for sensor detection and configuration convert')
provides=('libsensors.so')
source=(lm_sensors-${pkgver}.tar.gz::${url}/archive/refs/tags/V${_pkgver}.tar.gz)
sha256sums=('c6a0587e565778a40d88891928bf8943f27d353f382d5b745a997d635978a8f0')

build() {
  cd lm-sensors-${_pkgver}
  make PREFIX=/usr
}

package() {
  cd lm-sensors-${_pkgver}
  make PROG_EXTRA=sensord BUILD_STATIC_LIB=0 \
    PREFIX=/usr SBINDIR=/usr/bin MANDIR=/usr/share/man DESTDIR="${pkgdir}" install
}
