# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hidapi
pkgver=0.16.0
pkgrel=1
pkgdesc='Simple library for communicating with USB and Bluetooth HID devices'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/libusb/hidapi'
license=('GPL-3.0-or-later BSD-3-Clause OR LicenseRef-HIDAPI')
depends=('musl' 'libudev')
optdepends=('libusb: for hidapi-libusb')
makedepends=('cmake' 'libusb' 'linux-headers')
provides=('libhidapi-hidraw.so' 'libhidapi-libusb.so')
source=("https://github.com/libusb/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha512sums=('071d00eab861a18a05664e5a2e81beb332df06fb40feeba72b64e3f70c1e0772e2556f8ae5677e2340a5417fc6109ef450bcb67e74f5529d3984d4a7c10b433e')

build() {
  cmake -B build -S ${pkgname}-${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm0644 ${pkgname}-${pkgname}-${pkgver}/LICENSE*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
