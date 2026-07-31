# Maintainer: Weird Gumi <weirdgumi@tutamail.com>

pkgname=intel-ucode
pkgver=20260812
pkgrel=1
pkgdesc='Microcode update files for Intel CPUs'
arch=(x86_64)
url=https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files
license=(LicenseRef-scancode-intel-bcl)
makedepends=(iucode-tool)
source=($url/archive/refs/tags/microcode-$pkgver.tar.gz)
sha256sums=(7614616d7b2988c278060486f47de716ef44c19317928cb45ac9e288fafd5bd1)

build() {
  cd Intel-Linux-Processor-Microcode-Data-Files-microcode-$pkgver
  iucode_tool --write-earlyfw=intel-ucode.img intel-ucode{,-with-caveats}
}

package() {
  cd Intel-Linux-Processor-Microcode-Data-Files-microcode-$pkgver
  install -Dm644 -t "$pkgdir"/usr/lib/firmware/intel-ucode intel-ucode/*
  install -Dm644 -t "$pkgdir"/boot intel-ucode.img
  _install_license_ license
}
