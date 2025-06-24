# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rrdtool
pkgver=1.9.0
pkgrel=2
pkgdesc="Tool for logging and graphing various system status"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.rrdtool.org"
license=('GPL-2.0-or-later')
depends=('musl' 'libxml2' 'pango' 'ttf-dejavu')
makedepends=('intltool' 'python-setuptools' 'tcl' 'lua51')
optdepends=('perl: to use perl binding'
            'tcl: to use tcl binding'
            'python: to use python binding'
	    'lua51: to use lua(5.1) binding')
options=('!emptydirs')
source=(https://github.com/oetiker/rrdtool-1.x/releases/download/v$pkgver/rrdtool-$pkgver.tar.gz)
sha256sums=('5e65385e51f4a7c4b42aa09566396c20e7e1a0a30c272d569ed029a81656e56b')

prepare() {
  cd ${pkgname}-${pkgver}

  # https://github.com/oetiker/rrdtool-1.x/issues/1135
  autoreconf -fvi
}

build() {
  cd ${pkgname}-${pkgver}
  LUA=/usr/bin/lua5.1 \
    LUA_CFLAGS="`pkg-config --cflags --libs lua5.1`" LUA_INSTALL_CMOD="`pkg-config --variable=INSTALL_CMOD lua5.1`" \
    CFLAGS+=" -Wno-incompatible-pointer-types" \
    ./configure --prefix=/usr --localstatedir=/var --disable-rpath \
    --enable-perl --enable-perl-site-install --with-perl-options='INSTALLDIRS=vendor' \
    --enable-python --enable-lua --enable-lua-site-install --enable-tcl --disable-libwrap --disable-docs
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" includedir=/usr/include install
  _install_license_ COPYRIGHT LICENSE
}
