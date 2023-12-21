# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efistub-tools
pkgver=0.1.0
pkgrel=9
_debpkgver=255
_debpkgrev=1
pkgdesc='Script to generate Unified Kernel Image'
arch=(x86_64 aarch64 riscv64)
provides=('efistub')
depends=('binutils-objcopy' 'linux' 'tinyramfs')
builddepends=('curl')
source=("genefistub" "cmdline" "$pkgname.hook" "sbat.csv")
sha256sums=('940533cc4569340dd51a06ecdc96d71a81a85d0161a3d77a5afad7ab40de58a1'
            '10940c019b1cf1015191ae987568464280d4bcd86194e5a98389a3e9ab12f635'
            'ff73ffd1deae8f16b5d07f766f01d63ad3d4708a6e8947df89fea9a95652872f'
            'e61b837f709fd23e6a78100b2f759befe5ef1c7f2e542ae30f61172249865a82')

prepare()
{
  mkdir -p debian-efi
  case $CARCH in
    x86_64)
      debarch=amd64
      ;;
    aarch64)
      debarch=arm64
      ;;
    riscv64)
      debarch=riscv64
      ;;
  esac
  curl -L https://deb.debian.org/debian/pool/main/s/systemd/systemd-boot-efi_${_debpkgver}-${_debpkgrev}_$debarch.deb -o efi.deb
  ar x efi.deb
  bsdtar -xJf data.tar.xz -C debian-efi

  sed -i "s/@pkgname@/$pkgname/; s/@pkgver@/$pkgver/" sbat.csv
}

build()
{
  # TODO: Compile EFI stub instead of binary file
  cp debian-efi/usr/lib/systemd/boot/efi/linux*.stub efi.stub
  binutils-objcopy --update-section .sbat=sbat.csv efi.stub
}

package()
{
  install -D "cmdline" "$pkgdir/etc/kernel/cmdline"
  install -Dm 0755 "efi.stub" "$pkgdir/usr/share/efistub/efi.stub"
  install -Dm 0755 "genefistub" "$pkgdir/usr/bin/genefistub"
  install -Dm 644 $srcdir/$pkgname.hook "$pkgdir/usr/share/libalpm/hooks/99-$pkgname.hook"
}
