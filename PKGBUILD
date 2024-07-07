# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=lua-lmerge
pkgname=(lua54-lmerge)
pkgver=0.2.0
pkgrel=1
pkgdesc='A tool for merging Lua sources.'
url='https://github.com/ziyao233/lmerge'
arch=(any)
license=(MIT)
source=("https://github.com/ziyao233/lmerge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4284219c9cc0b2dcf18a767ec8eaeabe97de15e6bdd12f9dfdd69f6d2168915')

package_lua54-lmerge() {
depends=(lua54)

	cd lmerge-$pkgver
	install -Dm755 src/lmerge.lua $pkgdir/usr/bin/lmerge
	_install_license_ LICENSE
}
