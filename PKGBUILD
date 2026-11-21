# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=lua-checkutf8
pkgname=(lua54-checkutf8 lua55-checkutf8)
_lvers=(5.4 5.5)
pkgver=0.0.1
pkgrel=1
pkgdesc='Module for validating and repairing UTF-8 sequences'
url='https://github.com/ziyao233/lua-checkutf8'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MPL-2.0)
depends=(musl)
makedepends=(lua54 lua55)
source=("https://github.com/ziyao233/lua-checkutf8/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10f4ce90459f6dcd15499ddc55fc7a51932a92cdad7cccea52e4e9541f866a44')

build() {
	cd "$pkgbase-$pkgver"

	for _ver in "${_lvers[@]}"; do
		cc checkutf8.c -o "$_ver-checkutf8.so" \
			$(pkg-config --cflags --libs "lua$_ver")	\
			$CFLAGS $LDFLAGS -fPIC -shared
	done
}

do_package() {
	_install_license_ "$pkgbase-$pkgver"/LICENSE
	install -Dm755 "$pkgbase-$pkgver/$1-checkutf8.so" \
		"$pkgdir"/usr/lib/lua/"$1"/checkutf8.so
}

package_lua54-checkutf8() {
	depends+=(lua54)
	do_package 5.4
}

package_lua55-checkutf8() {
	depends+=(lua55)
	do_package 5.5
}
