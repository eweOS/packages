# Maintainer: Yao Zi <me@ziyao.cc>

pkgbase=lua-lyaml
pkgname=(lua51-lyaml lua54-lyaml lua55-lyaml)
_lvers=(5.1 5.4 5.5)
pkgver=6.2.10
pkgrel=1
pkgdesc='LibYAML binding for Lua'
url='http://gvvaughan.github.io/lyaml'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl libyaml)
makedepends=(lua51 lua54 lua55 luarocks51 luarocks54 luarocks55)
source=("https://github.com/gvvaughan/lyaml/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff2ae6c2c25941e44cd5bfd0fdc837f70c077571539e27fdf61443c5e6654de7')

build() {
	cd lyaml-"$pkgver"

	for v in "${_lvers[@]}"; do
		"luarocks-$v" make lyaml-$pkgver-*.rockspec \
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

package_lua55-lyaml() {
	depends+=(lua55)

	do_package 5.5
}
