# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=8.0.11
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=(x86_64 aarch64 riscv64)
url="https://limine-bootloader.org/"
license=('BSD')
makedepends=('nasm' 'lld' 'mtools')
optdepends=('efibootmgr: efi entries managing for limine-install')
source=(
  "https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  limine-mkconfig
  limine.defaults
  limine.conf
  limine-install
)
sha256sums=('b604c7d16d4a0b59bab327b4a3d6e59e77f9ac08b08275d215387a252261f74d'
            '4133cca3df6955b27e47e71400b5748e40a7dc3f3d4eaa664a7257d001ff9fdb'
            'b1d39bd3cc56b4d033f2ffe3c6f1eda8cbb0eb4788626e5041fcb56fa961ea86'
            'f722aacb1e5865489483c14b950900998241fe6558e58875b1119579ef91a5e0'
            '996416f738c981e2d04af00407adb7bc1e95a5acc5b11f65595d202cd6420290')

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
}

