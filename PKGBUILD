# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=7.12.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=(x86_64 aarch64 riscv64)
url="https://limine-bootloader.org/"
license=('BSD')
makedepends=('nasm' 'lld' 'mtools')
source=(
  "https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
  limine.cfg
  limine-mkconfig
  limine.defaults
  limine.conf
)
sha256sums=('4375cf42ef6eec06180c23eb2269b7d8ff50a6f09bf92ebf838c130a7214c457'
            '0dae8d8ee6bc3a563afc8d47939ed0e8e77916620fbfdfd2e15dd662bfd87326'
            'a5e1cd8bcd925c60428adb757dc371a317a97ad0f51506ec73404d0d7f1e8d99'
            'e9cee335f19ddfe723537fed9170a52b2490495fbb2c54c4469f4b7c7c5f717d'
            'f722aacb1e5865489483c14b950900998241fe6558e58875b1119579ef91a5e0')

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
  install -Dm 644 $srcdir/limine.cfg "$pkgdir/usr/share/limine/limine.cfg"
  install -Dm 755 $srcdir/limine-mkconfig "$pkgdir/usr/bin/limine-mkconfig"
  install -Dm 644 $srcdir/limine.defaults "$pkgdir/etc/default/limine"
  install -Dm 644 $srcdir/limine.conf "$pkgdir/etc/limine.conf"
}

