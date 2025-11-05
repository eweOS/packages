# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc
pkgver=8.2.10
pkgrel=1
pkgdesc="A garbage collector for C and C++"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.hboehm.info/gc/"
license=(MIT)
depends=(llvm-libs musl)
source=("https://github.com/ivmai/bdwgc/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('56558bf81716caa882fd015f3f0d0d86d05f38680266b22798153b1e7f4a6fbbcded2efb3e125c41a4c52d44259ac4900061e61729663f62427e73b691e317b0')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
		--enable-cplusplus	\
		--disable-static
	make
}

check() {
	cd "$pkgname-$pkgver"
	make check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
	sed 's|GC_MALLOC 1L|gc 3|g' doc/gc.man \
		| install -Dm644 /dev/stdin "$pkgdir/usr/share/man/man3/gc.3"
}
