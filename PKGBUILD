# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ii
pkgver=2.0
pkgrel=1
pkgdesc='Minimalistic FIFO and filesystem based IRC client'
url='https://tools.suckless.org/ii/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
source=("https://dl.suckless.org/tools/ii-$pkgver.tar.gz")
sha256sums=('4f67afcd208c07939b88aadbf21497a702ad0a07f9b5a6ce861f9f39ffe5425b')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir" PREFIX=/usr

	install -dm755 "$pkgdir"/usr/share/licenses/
	ln -s /usr/share/doc/ii/LICENSE "$pkgdir"/usr/share/licenses/ii
}
