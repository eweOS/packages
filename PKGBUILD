# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-lyaml
pkgname=(lua51-lyaml lua54-lyaml)
_lvers=(5.1 5.4)
pkgver=6.2.9
pkgrel=1
pkgdesc='LibYAML binding for Lua'
url='http://gvvaughan.github.io/lyaml'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libyaml)
makedepends=(lua51 lua54 luarocks51 luarocks54)
source=("https://github.com/gvvaughan/lyaml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('515e81d21903c1e428b017f2fe9dffa4e29ae9881b0d49ddbe6ba625e3164fe3')

build() {
	cd lyaml-"$pkgver"

	for v in ${_lvers[*]}; do
		"luarocks-$v" make "lyaml-$pkgver-1.rockspec" \
			--tree="./build-$v"
	done
}

do_package() {
	v=$1
	builddir="$srcdir/lyaml-$pkgver/build-$v"

	mkdir -p "$pkgdir/usr"
	install -Dm755 "$builddir/lib/lua/$v/yaml.so" \
		-t "$pkgdir/usr/lib/lua/$v"
	cp -rf "$builddir"/share "$pkgdir"/usr
	_install_license_ "$srcdir/lyaml-$pkgver/LICENSE"
}

package_lua51-lyaml() {
	depends+=(lua51)

	do_package 5.1
}

package_lua54-lyaml() {
	depends+=(lua54)

	do_package 5.4
}
