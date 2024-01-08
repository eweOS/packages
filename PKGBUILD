# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=limine
pkgver=6.20240107.0
pkgrel=1
pkgdesc="An advanced, portable, multiprotocol bootloader"
arch=(x86_64 aarch64 riscv64)
url="https://limine-bootloader.org/"
license=('BSD')
makedepends=('nasm' 'lld')
source=(
  "https://github.com/limine-bootloader/limine/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"
  limine.hook
  limine.cfg
)
sha256sums=('9376963769dc420e1004285c12bec6324de0812bf8b6776a1cebc96a64191dfe'
            '36e5bcb5d283c8946c21c6d4ad536e3ee05d8fbabdf383863645708d76cf5fb1'
            '0dae8d8ee6bc3a563afc8d47939ed0e8e77916620fbfdfd2e15dd662bfd87326')


build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --enable-uefi-$CARCH TOOLCHAIN_FOR_TARGET=llvm
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm 644 $srcdir/$pkgname.hook "$pkgdir/usr/share/libalpm/hooks/99-$pkgname.hook"
  install -Dm 644 $srcdir/limine.cfg "$pkgdir/usr/share/limine/limine.cfg"
}

