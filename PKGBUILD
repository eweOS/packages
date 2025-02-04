# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rdfind
pkgver=1.7.0
pkgrel=1
pkgdesc='Redundant data find - a program that finds duplicate files'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://rdfind.pauldreik.se'
license=('GPL-2.0-only')
depends=(nettle)
# 0001: downstream: change base64 --decode to busybox-compatible base64 -d
# 0002: downstream: Incompatible usage of stat
source=("${url}/${pkgname}-${pkgver}.tar.gz"
	"0001-testcases-base64-use-busybox-supported-arguments.patch"
	"0002-disable-busybox-incompatible-tests.patch")
sha256sums=('78c463152e1d9e4fd1bfeb83b9c92df5e7fc4c5f93c7d426fb1f7efa2be4df29'
            'd0a15534ba522ec75aad866915916fa184ca6c2e3b7c80cc20f833392496debc'
            'f75f4dcfc3d71b1197ad5ec4dd62db8296962da361c05de7c2202f7885c18c2f')

prepare() {
  _patch_ $pkgname-$pkgver

  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS ChangeLog README "${pkgdir}/usr/share/doc/${pkgname}"
}
