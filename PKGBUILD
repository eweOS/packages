# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=sof-bin
pkgname=(
  sof-firmware
  sof-tools
)
pkgver=2024.09
pkgrel=1
pkgdesc="Sound Open Firmware"
url="https://www.sofproject.org/"
arch=(x86_64 aarch64 riscv64)
license=(
  custom:BSD
  custom:ISC
)
source=(https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz)
sha256sums=('ea47d99f81359008d07618bca103cf78f82d84e940bfe941a28afe07c8cbc620')

package_sof-firmware() {
  options+=(!strip)

  local fwdir="$pkgdir/usr/lib/firmware/intel"
  mkdir -p "$fwdir"

  cd sof-bin-$pkgver

  cp -at "$fwdir" sof*

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENCE* Notice*
}

package_sof-tools() {
  pkgdesc+=" - tools"
  arch=(any)
  depends=(
    alsa-lib
    python
  )

  cd sof-bin-$pkgver

  install -Dt "$pkgdir/usr/bin" tools/*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENCE* Notice*
}
