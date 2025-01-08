# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprwayland-scanner"
pkgver=0.4.4
pkgrel=1
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/hyprwayland-scanner"
license=('BSD-3-Clause')
depends=('pugixml')
makedepends=('git' 'cmake')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac73f626019f8d819ff79a5fca06ce4768ce8a3bded6f48c404445f3afaa25ac')

build() {
	cd "$_archive"
	cmake -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX=/usr -B build
	cmake --build build --config Release
}

package() {
	cd "$_archive"
	DESTDIR="${pkgdir}" cmake --install build
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
