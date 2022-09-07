# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=vim
_vermajor=8
_verminor=2
_verpatch=3388
pkgver="${_vermajor}.${_verminor}.${_verpatch}"
pkgrel=1
pkgdesc='An IMproved version of the vi editor'
arch=(x86_64)
url='http://www.vim.org'
license=(VIM)
groups=()
depends=()
makedepends=(ncurses)
options=(emptydirs)

source=(
    "https://github.com/vim/vim/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    'SKIP'
)


build() {
	cd ${srcdir}/${pkgname}-${pkgver}
    # Set the path of the default vimrc file
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h

    CC='clang' \
        ./configure \
        --prefix=/usr \
        --enable-multibyte \
        --with-tlib=ncursesw
    make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="${pkgdir}/" install
    rm -f "${pkgdir}/usr/bin/xxd"
}

