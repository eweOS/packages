# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efibootmgr
pkgver=18
pkgrel=5
pkgdesc="Linux user-space application to modify the EFI Boot Manager"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/rhboot/efibootmgr"
license=(GPL2)
depends=(musl popt efivar)
makedepends=(linux-headers)
# 0001: Backport, fix the "no such file or directory" error when marking boot item as active or inactive
#       or re-ordering boot items.
#
#       https://github.com/rhboot/efibootmgr/issues/186
#       https://github.com/rhboot/efibootmgr/commit/3eac27c5fccf93d2d6e634d6fe2a76d06708ec6e
source=(
  "$url/archive/refs/tags/$pkgver.tar.gz"
  "0001-fix-bootorder.patch"
)
sha512sums=('04e40a705cb82440fd823043b598ef9fd1acc2ceda3e8d043a93e49d43ea9481b7386cad0f46de9862beff19b8a5480d79e7d6522ae584aff6655472f967764d'
            '46f8d9cf9fbc2b2e56a6d21988070a69df19808a4ddfc15749ba676e86ec1698afe4045032db8303390f82dffa707df570a1549785fdcb699ca758cd78b208e7')

prepare()
{
  _patch_ $pkgname-$pkgver

  # use limine.efi as default loader name
  sed -i 's/EFI_LOADER := grub.efi/EFI_LOADER := limine.efi/' $pkgname-$pkgver/Make.defaults
}

build()
{
  make libdir=/usr/lib sbindir=/usr/bin EFIDIR=ewe -C $pkgname-$pkgver
}

package()
{
  make DESTDIR="$pkgdir" libdir=/usr/lib sbindir=/usr/bin EFIDIR=ewe install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,README,README.md,TODO} -t "$pkgdir/usr/share/doc/$pkgname/"
}
