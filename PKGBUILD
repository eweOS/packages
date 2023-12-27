# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=efistub-tools
pkgver=0.1.0
pkgrel=13
_debpkgver=253
_debpkgrev=4
pkgdesc='Script to generate Unified Kernel Image'
arch=(x86_64 aarch64 riscv64)
provides=('efistub')
depends=('binutils-objcopy' 'linux' 'tinyramfs')
builddepends=('curl')
source=("genefistub" "cmdline" "$pkgname.hook" "sbat.csv" 'splash.bmp')
sha256sums=('ebc7b777c9169ad2e6511691f0a5e5f3e0e2bc2f89b7abcdfcfe5bc3538bf89a'
            '10940c019b1cf1015191ae987568464280d4bcd86194e5a98389a3e9ab12f635'
            'ff73ffd1deae8f16b5d07f766f01d63ad3d4708a6e8947df89fea9a95652872f'
            'e61b837f709fd23e6a78100b2f759befe5ef1c7f2e542ae30f61172249865a82'
            'aa34ec4e0c12c681461421e6b528b3b93c4aa8aec334e67cb25054ab60ce14f5')

prepare()
{
  mkdir -p debian-efi
  _DEBBASE="http://snapshot.debian.org/archive/debian/20230701T025017Z/pool/main/s/systemd"
  case $CARCH in
    x86_64)
      debarch=amd64
      bootarch=BOOTX64
      ;;
    aarch64)
      debarch=arm64
      bootarch=BOOTAA64
      ;;
    riscv64)
      debarch=riscv64
      _DEBBASE="http://snapshot.debian.org/archive/debian-ports/20230701T032658Z/pool-riscv64/main/s/systemd"
      bootarch=BOOTRISCV64
      ;;
  esac
  curl -L ${_DEBBASE}/systemd-boot-efi_${_debpkgver}-${_debpkgrev}_$debarch.deb -o efi.deb
  ar x efi.deb
  bsdtar -xJf data.tar.xz -C debian-efi
  sed -i "s/BOOTARCH/$bootarch/" genefistub
  sed -i "s/@pkgname@/$pkgname/; s/@pkgver@/$pkgver/" sbat.csv
}

build()
{
  # TODO: Compile EFI stub instead of binary file
  cp debian-efi/usr/lib/systemd/boot/efi/linux*.efi.stub efi.stub
  if [ "$CARCH" == "x86_64" ]; then
    objcopy --update-section .sbat=sbat.csv efi.stub
  fi
}

package()
{
  install -D "cmdline" "$pkgdir/etc/kernel/cmdline"
  install -Dm 0755 "efi.stub" "$pkgdir/usr/share/efistub/efi.stub"
  install -Dm 0644 "splash.bmp" "$pkgdir/usr/share/efistub/splash.bmp"
  install -Dm 0755 "genefistub" "$pkgdir/usr/bin/genefistub"
  install -Dm 644 $srcdir/$pkgname.hook "$pkgdir/usr/share/libalpm/hooks/99-$pkgname.hook"
}
