# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=7.4.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=(x86_64 aarch64 riscv64)
url="https://limine-bootloader.org/"
license=('BSD')
makedepends=('nasm' 'lld')
source=(
  "https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  limine.cfg
  limine-mkconfig
)
sha256sums=('94f7ac81010d66431bc65ff8b21fb04d1db541f3c9839ec20e6a93c1ccb86f69'
            '0dae8d8ee6bc3a563afc8d47939ed0e8e77916620fbfdfd2e15dd662bfd87326'
            '9a989c72af2467fed26818408612218ec3ae1cdedfa2c019f239d3f1873103c4')


build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-uefi-$CARCH TOOLCHAIN_FOR_TARGET=llvm
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 $srcdir/limine.cfg "$pkgdir/usr/share/limine/limine.cfg"
  install -Dm 755 $srcdir/limine-mkconfig "$pkgdir/usr/bin/limine-mkconfig"
}

