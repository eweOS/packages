# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=9.3.3
pkgrel=2
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://limine-bootloader.org/"
license=('BSD-2-Clause')
makedepends=('nasm' 'lld' 'mtools')
optdepends=('efibootmgr: efi entries managing for limine-install')
source=(
  "https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  limine-mkconfig
  limine-mkconfig.hook
  limine.defaults
  limine.conf
  limine-install
  update-limine-config
)
sha256sums=('fb284716df52bd8525fed8dfc19c91d0e24af3e043ce278b4b600563557234b1'
            '5e24a657b49dba06796acce158dea400ee40307b6d971605981cadafb79219eb'
            '98904f4fd1dece1663e4f96e4022718d83706a3c05477ef07d20892d133a46a3'
            'b1d39bd3cc56b4d033f2ffe3c6f1eda8cbb0eb4788626e5041fcb56fa961ea86'
            'f722aacb1e5865489483c14b950900998241fe6558e58875b1119579ef91a5e0'
            '996416f738c981e2d04af00407adb7bc1e95a5acc5b11f65595d202cd6420290'
            'b182038c9b1d424137a62968ca6ce44212fc4ea3d721c44048f4f6d6d63a0e4d')

build() {
  cd "${pkgname}-${pkgver}"
  local target_options=(
    --enable-uefi-$CARCH
    --enable-uefi-cd
  )
  [ $CARCH = x86_64 ] && target_options+=(--enable-bios --enable-bios-cd --enable-bios-pxe)
  ./configure --prefix=/usr ${target_options[*]} TOOLCHAIN_FOR_TARGET=llvm
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 755 $srcdir/limine-mkconfig "$pkgdir/usr/bin/limine-mkconfig"
  install -Dm 755 $srcdir/limine-install "$pkgdir/usr/bin/limine-install"
  install -Dm 644 $srcdir/limine.defaults "$pkgdir/etc/default/limine"
  install -Dm 644 $srcdir/limine.conf "$pkgdir/etc/limine.conf"
  install -Dm 644 $srcdir/limine-mkconfig.hook "$pkgdir/usr/share/libalpm/hooks/limine-mkconfig.hook"
  install -Dm 755 $srcdir/update-limine-config "$pkgdir/usr/share/libalpm/scripts/update-limine-config"
}

