# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hidapi
pkgver=0.15.0
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
sha512sums=('a4ddd13a80a84956872fa52aa861b40e4959f301d8d91afe0feaf9dbd87394561e1fdd20cbf8cf47200845f80a8db8a934bc2e3025fe6f16435e37c17621e7b6')

build() {
  cmake -B build -S ${pkgname}-${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm0644 ${pkgname}-${pkgname}-${pkgver}/LICENSE*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
