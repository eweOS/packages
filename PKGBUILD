# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprpicker
pkgver=0.3.0
pkgrel=2
pkgdesc="A wlroots-compatible Wayland color picker that does not suck."
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hyprwm/hyprpicker"
license=('BSD-3-Clause')
depends=('cairo' 'libxkbcommon' 'wayland')
optdepends=('wl-clipboard: Allows --autocopy to automatically copy the output to the clipboard.')
makedepends=('cmake'
             'libglvnd'
             'libjpeg'
             'ninja'
             'pango'
	     'wayland-protocols')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"0001-cmake-use-CXX_STANDARD-instead-of-a-flag.patch")
sha256sums=('a443188ef7619be48c9992ea208121772b7e1da6662d672c650e30e159eeb891'
            '69543b77de140263ad9d45b2d3b87ddfedce64009fd9c89b64908f13a94f12bd')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

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
