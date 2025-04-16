# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=acpica
pkgver=20250404
_ver_y=${pkgver:0:4}
_ver_m=${pkgver:4:2}
_ver_d=${pkgver:6:2}
_ver="R${_ver_y}_${_ver_m}_${_ver_d}"
pkgrel=1
pkgdesc='An open-source operating system-independent implementation of the Advanced Configuration and Power Interface specification (ACPI)'
url='https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/overview.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(musl)
source=("https://github.com/acpica/acpica/archive/refs/tags/$_ver.tar.gz")
sha256sums=('9991ec103b3660d17715780406ee7409f705cf87ac55e9a32374affe1a6f275a')
_dirname="acpica-$_ver"

build() {
	cd "$_dirname"
	make NOWERROR=TRUE
}

package() {
	cd "$_dirname"
	make install DESTDIR="$pkgdir" NOWERROR=TRUE
}
