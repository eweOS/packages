# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=rrdtool
pkgver=1.10.3
pkgrel=1
pkgdesc="Tool for logging and graphing various system status"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.rrdtool.org"
license=('GPL-2.0-or-later')
depends=('musl' 'libxml2' 'pango' 'ttf-dejavu')
makedepends=('intltool' 'python-setuptools' 'python-wheel' 'python-installer' 'tcl' 'lua51')
optdepends=('perl: to use perl binding'
            'tcl: to use tcl binding'
            'python: to use python binding'
	    'lua51: to use lua(5.1) binding')
options=('!emptydirs')
# 0001: Backport: https://github.com/oetiker/rrdtool-1.x/pull/1332
source=(
  https://github.com/oetiker/rrdtool-1.x/releases/download/v$pkgver/rrdtool-$pkgver.tar.gz
  0001-fix-heap-buffer-overflow.patch
)
sha256sums=('843b7caa2a80a815d44ac5c65daa42920cb64586fe804e36d0bc0783554e0635'
            'a9a80ecf0aa3c9f27f47fff53846d94882596667ed0727961ea32af099dc4196')

prepare() {
  _patch_ ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}

  sed -i \
    -e 's|$(PYTHON) -m pip install --upgrade --no-index --no-deps|$(PYTHON) -m installer --destdir=$(DESTDIR)|' \
    -e '/--no-cache-dir --disable-pip-version-check/d' \
    -e '/--target=$(DESTDIR)$(libdir)\/python3\/site-packages/d' \
    bindings/Makefile.am

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
