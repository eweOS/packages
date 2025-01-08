# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprpicker
pkgver=0.4.1
pkgrel=4
pkgdesc="A wlroots-compatible Wayland color picker that does not suck."
arch=(x86_64 aarch64 riscv64 loongarch64)
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
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "fix-hyprwayland.patch::https://github.com/hyprwm/hyprpicker/commit/444c40e5e3dc4058a6a762ba5e73ada6d6469055.patch"
)

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
sha256sums=('e14d881f9645fd633b29370875ec4e98e24ad3455c522f7bcd68c3d17eda338a'
            '719224fe78eb6a38a85f475f4ecf77e2ea1167011d8f271d060a1d07423cc8f7')
