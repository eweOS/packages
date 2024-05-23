# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=7.5.2
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
sha256sums=('97d6b1f3dacd6d0b3c78dcae9637445c2bd8e46457b0df6acc80ebb22efa8848'
            '0dae8d8ee6bc3a563afc8d47939ed0e8e77916620fbfdfd2e15dd662bfd87326'
            '9a989c72af2467fed26818408612218ec3ae1cdedfa2c019f239d3f1873103c4')


build() {
  cd "${pkgname}-${pkgver}"
  local target_options=(
    --enable-uefi-$CARCH
  )
  [ $CARCH = x86_64 ] && target_options+=(--enable-bios --enable-bios-cd)
  ./configure --prefix=/usr ${target_options[*]} TOOLCHAIN_FOR_TARGET=llvm
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 $srcdir/limine.cfg "$pkgdir/usr/share/limine/limine.cfg"
  install -Dm 755 $srcdir/limine-mkconfig "$pkgdir/usr/bin/limine-mkconfig"
}

