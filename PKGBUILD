# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=12.4.2
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
  limine-mkconfig.hook
  limine.defaults
  limine.conf
  limine-install
  update-limine-config
)
sha256sums=('9ab373f389caa9e63dc298a7b45af5351ac9a4d00f804f68c1cba619865cdade'
            'a93f5b67465c5dc55408720c5faaac343f7f8674fb112005540ad736bd10973b'
            '98904f4fd1dece1663e4f96e4022718d83706a3c05477ef07d20892d133a46a3'
            'b1d39bd3cc56b4d033f2ffe3c6f1eda8cbb0eb4788626e5041fcb56fa961ea86'
            'f722aacb1e5865489483c14b950900998241fe6558e58875b1119579ef91a5e0'
            '307eaea79af8eb9e9c1f6b5c6f17841f31e5a01856738cddecb20f7039c21094'
            '283f4f612b63d952075572419e9e2283be7369e7cffaf51a98ab360178797870')

build() {
  cd "${pkgname}-${pkgver}"
  local target_options=(
    --enable-uefi-$CARCH
    --enable-uefi-cd
  )
  [ $CARCH = x86_64 ] && target_options+=(--enable-bios --enable-bios-cd --enable-bios-pxe)
  ./configure --prefix=/usr ${target_options[*]}
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

