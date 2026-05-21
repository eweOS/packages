# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libgudev
pkgver=238
pkgrel=2
pkgdesc='GObject bindings for libudev'
url='https://gitlab.gnome.org/GNOME/libgudev'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl libudev-zero)
makedepends=(meson ninja gobject-introspection gtk-doc vala)
provides=(libgudev-1.0.so)
# 0001: Backport, bd531e8622e2 ("build: drop erroneous -export-dynamic linker flag")
#	Drop "-export-dynamic" flag when linking libgudev to fix build on Clang.
#	This flag is a copy-paste when migrating from autotools, and makes no
#	sense when not using libtool.
source=("https://gitlab.gnome.org/GNOME/libgudev/-/archive/$pkgver/libgudev-$pkgver.tar.gz"
	0001-build-drop-erroneous-export-dynamic-linker-flag.patch)
sha256sums=('443c702c6339775f413f45d13309b2c641a94530bb27981142a2605eedb0aafd'
            '10410bdfc8e223add7e82729b8b7979a74cbda8b6a3192dc222f00513fd88ec8')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	# missing umockdev
	ewe-meson "$pkgname-$pkgver" build \
		-Dtests=disabled
	meson compile -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
}
