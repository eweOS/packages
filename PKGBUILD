# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=acpica
pkgver=20251212
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
sha256sums=('6f77bd550655183c63f0a307fb0f29ef6140b1f522d61783a16b2af8d9149a0d')
_dirname="acpica-$_ver"

build() {
	cd "$_dirname"
	make NOWERROR=TRUE
}

package() {
	cd "$_dirname"
	make install DESTDIR="$pkgdir" NOWERROR=TRUE
}
