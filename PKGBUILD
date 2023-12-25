# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efistub-tools
pkgver=0.1.0
pkgrel=10
_debpkgver=255
_debpkgrev=1
pkgdesc='Script to generate Unified Kernel Image'
arch=(x86_64 aarch64 riscv64)
provides=('efistub')
depends=('binutils-objcopy' 'linux' 'tinyramfs' 'llvm')
builddepends=('curl')
source=("genefistub" "cmdline" "$pkgname.hook" "sbat.csv" 'splash.bmp')
sha256sums=('78c62c3dac03ae3eab580541ad6cd5cd2184055a258138c35a868669acfd5ffe'
            '10940c019b1cf1015191ae987568464280d4bcd86194e5a98389a3e9ab12f635'
            'ff73ffd1deae8f16b5d07f766f01d63ad3d4708a6e8947df89fea9a95652872f'
            'e61b837f709fd23e6a78100b2f759befe5ef1c7f2e542ae30f61172249865a82'
            'aa34ec4e0c12c681461421e6b528b3b93c4aa8aec334e67cb25054ab60ce14f5')

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
  objcopy --update-section .sbat=sbat.csv efi.stub
}

package()
{
  install -D "cmdline" "$pkgdir/etc/kernel/cmdline"
  install -Dm 0755 "efi.stub" "$pkgdir/usr/share/efistub/efi.stub"
  install -Dm 0644 "splash.bmp" "$pkgdir/usr/share/efistub/splash.bmp"
  install -Dm 0755 "genefistub" "$pkgdir/usr/bin/genefistub"
  install -Dm 644 $srcdir/$pkgname.hook "$pkgdir/usr/share/libalpm/hooks/99-$pkgname.hook"
}
