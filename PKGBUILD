# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=gsm
pkgver=1.0.24
_ver=${pkgver%.*}
_patchlevel=${pkgver##*.}
_verstr=${_ver}-pl${_patchlevel}
pkgrel=1
pkgdesc='GSM lossy speech compression'
url='https://quut.com/gsm/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
provides=(libgsm.so)
source=("https://www.quut.com/gsm/gsm-$pkgver.tar.gz"
	"0001-fix-install-command.patch"
	"0002-build-libgsm-as-shared-library.patch")
sha256sums=('a3c40c6471928383f4abfcb2e8f24012a1f562be2f17b8d672145d5986681a92'
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
		GSM_INSTALL_LIB=$pkgdir/usr/lib			\
		GSM_INSTALL_INC=$pkgdir/usr/include		\
		GSM_INSTALL_MAN=$pkgdir/usr/share/man/man3	\
		TOAST_INSTALL_BIN=$pkgdir/usr/bin		\
		TOAST_INSTALL_MAN=$pkgdir/usr/share/man/man1	\
		LN='ln -s' SOVER=$pkgver
}

