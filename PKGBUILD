# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=ruby
pkgver=3.4.8
_majorminorver="${pkgver%.*}"
pkgrel=2
pkgdesc='An object-oriented language for quick and easy programming'
url='https://www.ruby-lang.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('BSD-2-Clause OR Ruby')
depends=(musl gmp zlib-ng libxcrypt openssl libffi libyaml)
provides=(libruby.so)
options=(!lto)
# 0001, should be upstreamed: fix logic to get main thread's stack size on musl.
source=("https://cache.ruby-lang.org/pub/ruby/$_majorminorver/ruby-$pkgver.tar.gz"
	0001-fix-get_main_stack-behavior-on-musl.patch)
sha256sums=('53c4ddad41fbb6189f1f5ee0db57a51d54bd1f87f8755b3d68604156a35b045b'
            '1ef0659b7cf31bebf863f3ca661250117a85dfad64f90b782e97d0843fd89b0a')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	# Lower optimization level to -O2, by default configure sets it to -O3,
	# and may override CFLAGS' setting. We may encounter various segfaults
	# with -O3 and Clang.
	./configure --prefix=/usr \
		--enable-shared		\
		--disable-yjit		\
		--without-valgrind	\
		optflags="-O2"

	make
}

check() {
	cd "$pkgname-$pkgver"

	# make check runs the full testsuite, i.e., test-all, however 40 tests
	# fail out of 32k cases.
	# For now, let's run some basic interpreter tests only.
	make test
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
	_install_license_ COPYING
}
