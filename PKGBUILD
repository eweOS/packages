# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=scrcpy
pkgver=5.0.1
pkgrel=1
pkgdesc='Display and control your Android device'
url='https://github.com/Genymobile/scrcpy'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(musl android-tools libusb sdl3 ffmpeg)
makedepends=(meson ninja libdrm)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Genymobile/scrcpy/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/Genymobile/scrcpy/releases/download/v$pkgver/scrcpy-server-v$pkgver")
noextract=("scrcpy-server-v$pkgver")
sha256sums=('a24b996ac23d0f674d3237c00b39a97829d8acbe9e1657a6c216fd51ea488ee5'
            '764eb6f79811d5211fe9df341120882ba9994c7a61b897d7bf3fb662e53bc536')

build() {
	# Use the prebuilt server binary, which requires Android SDK to build
	# from source
	ewe-meson "$pkgname-$pkgver" build \
		-Dprebuilt_server="$srcdir"/scrcpy-server-v$pkgver	\
		-Dportable=false					\
		-Dv4l2=true						\
		-Dusb=true						\
		-Dvaapi=true						\
		-Dd3d11va=false						\
		-Dvideotoolbox=false
	meson compile -C build
}

package() {
	meson install -C build --destdir="$pkgdir"

	_install_license_ scrcpy-$pkgver/LICENSE
}
