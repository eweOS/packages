# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=8.6.1
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://limine-bootloader.org/"
license=('BSD-2-Clause')
makedepends=('nasm' 'lld' 'mtools')
optdepends=('efibootmgr: efi entries managing for limine-install')
source=(
  "https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  limine-mkconfig
  limine.defaults
  limine.conf
  limine-install
  0001-protos-Keep-linux-protocol-disabled-on-loong64-as-it.patch
)
sha256sums=('4fae32769633dbdf521c3118d0bd2039be31c11a4e4241aff1122397d8ffe44c'
            '7952ba8555a3b82725cd8f7255a91f8cf363e8cfd99d86aa7438638252239665'
            'b1d39bd3cc56b4d033f2ffe3c6f1eda8cbb0eb4788626e5041fcb56fa961ea86'
            'f722aacb1e5865489483c14b950900998241fe6558e58875b1119579ef91a5e0'
            '996416f738c981e2d04af00407adb7bc1e95a5acc5b11f65595d202cd6420290'
            'd397e862240edd3d457a8ea82c2dbb0854f2f647349809a17e3d32ab6d041813')

prepare() {
  cd "$pkgname-$pkgver"
  # enable loongarch64 linux protocol support
  patch -R -p1 < "$srcdir/0001-protos-Keep-linux-protocol-disabled-on-loong64-as-it.patch"
}

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

