# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname="hyprwayland-scanner"
pkgver=0.3.8
pkgrel=1
pkgdesc="A Hyprland implementation of wayland-scanner, in and for C++"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hyprwm/hyprwayland-scanner"
license=('BSD-3-Clause')
depends=('pugixml')
makedepends=('git' 'cmake')
_archive="${pkgname}-$pkgver"
source=("$_archive.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8f596074fbb990ae6c3a427872b32219aeb17cbeb296b8f30482ef7f46249173')

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
