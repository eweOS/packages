# Maintainer: Weiji Wang <nebclllo0444@gmail.com>

pkgname=('libgpiod' 'python-gpiod')
pkgbase='libgpiod'
pkgver=2.2
pkgrel=1
pkgdesc='C library and tools for interacting with the linux GPIO character device'
url='https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('LGPL-2.1-or-later')
depends=('musl')
makedepends=('autoconf-archive' 'help2man' 'python-setuptools' 'python-build' 'linux-headers')
source=("https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/snapshot/libgpiod-$pkgver.tar.gz"
	'0001-disable-python-build-isolation.patch')
sha256sums=('ae35329db7027c740e90c883baf27c26311f0614e6a7b115771b28188b992aec'
	'4d82aa1a46c4c604bb857589a15968924389166b105a1777bcc2a4204dc0468b')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh \
		--prefix=/usr \
		--enable-tools=yes \
		--enable-bindings-cxx \
		--enable-bindings-python
	make
}

package_libgpiod() {
	cd "$pkgname-$pkgver"
	make install DESTDIR="$pkgdir"
	cd "$pkgdir"
	_pick_ python-gpiod usr/lib/python*
}

package_python-gpiod() {
	depends=("libgpiod=$pkgver" 'python')
	mv -v pkgs/python-gpiod/* "$pkgdir"
}
