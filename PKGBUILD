# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprpicker
pkgver=0.4.1
pkgrel=1
pkgdesc="A wlroots-compatible Wayland color picker that does not suck."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hyprwm/hyprpicker"
license=('BSD-3-Clause')
depends=('cairo' 'libxkbcommon' 'wayland' 'hyprutils')
optdepends=('wl-clipboard: Allows --autocopy to automatically copy the output to the clipboard.')
makedepends=('cmake'
	     'hyprwayland-scanner'
             'libglvnd'
             'libjpeg'
             'ninja'
             'pango'
	     'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e14d881f9645fd633b29370875ec4e98e24ad3455c522f7bcd68c3d17eda338a')

build() {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build

	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 doc/hyprpicker.1 "${pkgdir}/usr/share/man/man1/hyprpicker.1"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/$pkgname/README.md"
}
