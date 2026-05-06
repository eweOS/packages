# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=acpica
pkgver=20260408
_ver_y=${pkgver:0:4}
_ver_m=${pkgver:4:2}
_ver_d=${pkgver:6:2}
_ver="${pkgver}"
pkgrel=1
pkgdesc='An open-source operating system-independent implementation of the Advanced Configuration and Power Interface specification (ACPI)'
url='https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(musl)
source=("https://github.com/acpica/acpica/archive/refs/tags/$_ver.tar.gz")
sha256sums=('ddc5d3e0f54030e2348484fff681861a161efb4e388e20631209574e7884ad39')
_dirname="acpica-$_ver"

build() {
	cd "$_dirname"
	make NOWERROR=TRUE
}

package() {
	cd "$_dirname"
	make install DESTDIR="$pkgdir" NOWERROR=TRUE
}
