# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=7.5.3
pkgrel=2
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=(x86_64 aarch64 riscv64)
url="https://limine-bootloader.org/"
license=('BSD')
makedepends=('nasm' 'lld')
source=(
  "https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  limine.cfg
  limine-mkconfig
  limine.defaults
  limine.conf
)
sha256sums=('cee0473ee4bebddb520dfa119ba27455d21857732d66dc16e6acc28c336640a9'
            '0dae8d8ee6bc3a563afc8d47939ed0e8e77916620fbfdfd2e15dd662bfd87326'
            '71cd1b3ab4e05fa9b987dd9e3fbd2d981a9247df523aa76dd0033b601ba1be79'
            'e9cee335f19ddfe723537fed9170a52b2490495fbb2c54c4469f4b7c7c5f717d'
            '7cf846d1b05ed30a75527e78af6efb9050e684fcf80b8ad6313c06d18023aa22')

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
  install -Dm 644 $srcdir/limine.defaults "$pkgdir/etc/default/limine"
  install -Dm 644 $srcdir/limine.conf "$pkgdir/etc/limine.conf"
}

