# Maintainer: Yao Zi <ziyao@disroot.org>
# Contributor: Aleksana QwQ <me@aleksana.moe>
# Contributor: Daniel Isenmann <daniel [at] archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>

pkgname=gc
pkgver=8.2.12
pkgrel=2
pkgdesc="A garbage collector for C and C++"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.hboehm.info/gc/"
license=(MIT)
depends=(llvm-libs musl)
source=("https://github.com/ivmai/bdwgc/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('af175b33f85b4ba9ea5d5fd4f62e96bfafb1582a5159b6c1798bac48893969f2988e95a05666635b6dee9761bdeedbd1d7212cad5fd272a3a07daf4ec2ea5cc4')

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
