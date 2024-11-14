# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openh264
pkgver=2.5.0
pkgrel=1
pkgdesc='Open Source H264 Codec'
url='https://github.com/cisco/openh264'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(nasm)
checkdepends=(googletest)
provides=(libopenh264.so)
source=("https://github.com/cisco/openh264/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('94c8ca364db990047ec4ec3481b04ce0d791e62561ef5601443011bdc00825e3')

build () {
	case "$CARCH" in
	x86*|aarch64|armv7)
		local asm="Yes"
		;;
	*)
		local asm="No"
		;;
	esac

	cd $pkgname-$pkgver
	make ARCH="$CARCH" \
		BUILDTYPE=Release \
		USE_ASM=$asm \
		ENABLEPIC=Yes \
		HAVE_AVX2=No
}

check() {
	cd $pkgname-$pkgver
	make test
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	_install_license_ LICENSE
}
