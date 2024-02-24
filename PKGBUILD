# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=sof-bin
pkgname=(
  sof-firmware
  sof-tools
)
pkgver=2023.12
pkgrel=1
pkgdesc="Sound Open Firmware"
url="https://www.sofproject.org/"
arch=(x86_64 aarch64 riscv64)
license=(
  custom:BSD
  custom:ISC
)
source=(https://github.com/thesofproject/sof-bin/releases/download/v$pkgver/sof-bin-$pkgver.tar.gz)
sha256sums=('55e47eb63e6248dbdab7da232bb1e31ca2e7155b37dc116f6dc5b173cba3503b')

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
