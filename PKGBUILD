# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openh264
pkgver=2.4.1
pkgrel=3
pkgdesc='Open Source H264 Codec'
url='https://github.com/cisco/openh264'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
makedepends=(nasm)
checkdepends=(googletest)
provides=(libopenh264.so)
source=("https://github.com/cisco/openh264/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ffbe944e74043d0d3fb53d4a2a14c94de71f58dbea6a06d0dc92369542958ea')

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
