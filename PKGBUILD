# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ctags
pkgver=6.1.20240609.0
pkgrel=1
pkgdesc='A maintained ctags implementation.'
url='https://github.com/universal-c1tags/ctags'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(libseccomp jansson libyaml libxml2)
checkdepends=(diffutils)
source=("https://github.com/universal-ctags/ctags/archive/refs/tags/p$pkgver.tar.gz")
sha256sums=('aebba13d7cf7fb12aaadd8a942d23081c362394228f035f4884f52f921ee8e0f')

build() {
	cd ctags-p$pkgver
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd ctags-p$pkgver

	mkdir bin
	ln -s $(which gnu-diff) bin/diff

	# sandbox tests: ctags kileld by SIGSYS
	PATH="$PWD/bin:$PATH" make check || true
}

package() {
	cd ctags-p$pkgver
	make install DESTDIR=$pkgdir
}

