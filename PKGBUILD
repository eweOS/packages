# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gsm
pkgver=1.0.22
_ver=${pkgver%.*}
_patchlevel=${pkgver##*.}
_verstr=${_ver}-pl${_patchlevel}
pkgrel=1
pkgdesc='GSM lossy speech compression'
url='https://quut.com/gsm/'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
provides=(libgsm.so)
source=("https://www.quut.com/gsm/gsm-$pkgver.tar.gz"
	"0001-fix-install-command.patch"
	"0002-build-libgsm-as-shared-library.patch")
sha256sums=('f0072e91f6bb85a878b2f6dbf4a0b7c850c4deb8049d554c65340b3bf69df0ac'
	    '7829d46febb63dd4f21e4f3a606d545333e5521e49fc1f6fcf1386519e151c68'
	    'd6bcefc4739eaafaf4101bf8e1181d50937169396ee8cea2642b06bfdeec999b')

prepare() {
	_patch_ gsm-$_verstr
}

build () {
	cd gsm-$_verstr
	make LN='ln -s' SOVER=$pkgver
}

check() {
	cd gsm-$_verstr
	make addtst CC="cc -std=c89" LN='ln -s' SOVER=$pkgver
}

package() {
	cd gsm-$_verstr
	_install_license_ COPYRIGHT
	mkdir -p $pkgdir/usr
	make install INSTALL_ROOT=$pkgdir/usr \
		GSM_INSTALL_LIB=$pkgdir/usr/lib		\
		GSM_INSTALL_INC=$pkgdir/usr/include	\
		GSM_INSTALL_MAN=$pkgdir/usr/share/man	\
		TOAST_INSTALL_BIN=$pkgdir/usr/bin	\
		TOAST_INSTALL_MAN=$pkgdir/usr/man/man1	\
		LN='ln -s' SOVER=$pkgver
}

