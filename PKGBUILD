# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gtksourceview4
pkgver=4.8.4
pkgrel=1
pkgdesc='A text editor widget for code editing'
url='https://wiki.gnome.org/Projects/GtkSourceView/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(glib gtk3 libxml2 fribidi pcre2)
makedepends=(meson ninja gobject-introspection vala)
provides=(libgtksourceview-4.so)
source=("https://download.gnome.org/sources/gtksourceview/${pkgver%.*}/gtksourceview-$pkgver.tar.xz")
sha256sums=('7ec9d18fb283d1f84a3a3eff3b7a72b09a10c9c006597b3fbabbb5958420a87d')

build () {
	ewe-meson gtksourceview-$pkgver build
	meson compile -C build
}

# find out a way to run headlessly
# check() {
	# meson test -C build
# }

package() {
	meson install -C build --destdir $pkgdir
}
