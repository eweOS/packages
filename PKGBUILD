# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rdfind
pkgver=1.8.0
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
sha256sums=('0a2d0d32002cc2dc0134ee7b649bcc811ecfb2f8d9f672aa476a851152e7af35'
            'd0a15534ba522ec75aad866915916fa184ca6c2e3b7c80cc20f833392496debc'
            'ea44cbf509e129d224b44ee7a22cdf441867d4db0752cc27c089fde8f1490d3b')

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
