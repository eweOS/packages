# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=kexec-tools
pkgver=2.0.32
pkgrel=1
pkgdesc='Userspace portion of Kexec'
url='Userspace'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(musl xz zlib-ng zstd)
makedepends=(linux-uapi-headers)
source=("https://github.com/horms/kexec-tools/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('34fbc52c3e5bcc5c1b26de37e3e5c164e633e02ccd3b0cede8a923eb5cd909df')

_makeflags=("BUILD_KEXEC_TEST=no")

build() {
	cd "$pkgname-$pkgver"

	autoreconf -fiv
	AS=clang ./configure --prefix=/usr \
		--sbindir=/usr/bin	\
		--with-zlib		\
		--with-lzma		\
		--with-zstd		\
		--with-xen

	make "${_makeflags[@]}"
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir" "${_makeflags[@]}"
}
