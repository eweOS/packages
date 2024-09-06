# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hidapi
pkgver=0.14.0
pkgrel=1
pkgdesc='Simple library for communicating with USB and Bluetooth HID devices'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/libusb/hidapi'
license=('GPL3' 'BSD' 'custom')
optdepends=('libusb: for hidapi-libusb')
makedepends=('cmake' 'libusb' 'linux-headers')
provides=('libhidapi-hidraw.so' 'libhidapi-libusb.so')
source=("https://github.com/libusb/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('66a045144f90b41438898b82f0398e80223323ebfe6e4f197d2713696bb3ae60f36aea5a37a9999b34b12294783fd7e4c28c6e785462559cbe21276009da1eac')

build() {
  cmake -B build -S ${pkgname}-${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm0644 ${pkgname}-${pkgname}-${pkgver}/LICENSE*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
