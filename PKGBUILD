# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=chrpath
pkgver=0.18
pkgrel=1
pkgdesc="Change or delete the rpath or runpath in ELF files"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://codeberg.org/pere/chrpath"
license=('GPL-2.0-or-later')
depends=('musl')
source=("https://codeberg.org/pere/chrpath/archive/release-$pkgver.tar.gz")
sha256sums=('f09c49f0618660ca11fc6d9580ddde904c7224d4c6d0f6f2d1f9bcdc9102c9aa')

prepare() {
	cd "$pkgname"
	autoreconf -fiv
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr \
		--mandir=/usr/share/man
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" docdir=/usr/share/doc/chrpath install
}
