# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=lua-cffi
pkgname=(lua51-cffi lua54-cffi lua55-cffi)
pkgver=0.2.4
_lvers=(5.1 5.4 5.5)
pkgrel=1
pkgdesc='Portable C FFI for Lua 5.1 and later'
url='https://github.com/q66/cffi-lua'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl llvm-libs libffi)
makedepends=(meson ninja lua51 lua54 lua55)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/q66/cffi-lua/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('89e418e734c3628d4169fe5d237dff3f7769d0c42de5ed8b484a404f42cdc061')

build() {
	for v in "${_lvers[@]}"; do
		ewe-meson "cffi-lua-$pkgver" build-$v \
			-Dlua_version=$v		\
			-Dtests=true
		meson compile -C build-$v
	done
}

check() {
	for v in "${_lvers[@]}"; do
		meson test -C build-$v
	done
}

do_install() {
	v=$1
	depends+=(lua"${v//./}")
	meson install -C build-$v --destdir "$pkgdir"
	_install_license_ "cffi-lua-$pkgver"/COPYING.md
}

package_lua51-cffi() {
	do_install 5.1
}

package_lua54-cffi() {
	do_install 5.4
}

package_lua55-cffi() {
	do_install 5.5
}
