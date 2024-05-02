# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rnnoise
_fullhash=372f7b4b76cde4ca1ec4605353dd17898a99de38
_modelver=0b50c45
pkgver=20240416.${_fullhash:0:7}
pkgrel=1
pkgdesc='Recurrent neural network for audio noise reduction.'
url='https://github.com/xiph/rnnoise'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
source=("https://github.com/xiph/rnnoise/archive/$_fullhash.tar.gz"
	"https://media.xiph.org/rnnoise/models/rnnoise_data-$_modelver.tar.gz")
noextract=("rnnoise_data-$_modelver.tar.gz")
provides=(librnnoise.so)
sha256sums=('40ff1568af151959933699fcbf2db3ee3c62fa9559557dbf61a65e7a12cd335d'
            '4ac81c5c0884ec4bd5907026aaae16209b7b76cd9d7f71af582094a2f98f4b43')

prepare() {
	tar xvf rnnoise_data-$_modelver.tar.gz -C rnnoise-$_fullhash
}

build () {
	cd rnnoise-$_fullhash
	autoreconf -ivsf
	./configure --prefix=/usr
	make
}

check() {
	cd rnnoise-$_fullhash
	make check
}

package() {
	cd rnnoise-$_fullhash
	make install DESTDIR=$pkgdir
	license_path=$pkgdir/usr/share/doc/rnnoise/COPYING
	_install_license_ $license_path
	rm $license_path
}
