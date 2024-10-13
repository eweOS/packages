# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmypaint
pkgver=1.6.1
pkgrel=1
pkgdesc='Library for making brushstrokes which is used by MyPaint and other projects'
url='http://mypaint.org/'
arch=('x86_64' 'aarch64' 'riscv64')
license=('ISC')
depends=('json-c' 'gegl' 'glib2' 'json-glib' 'babl')
makedepends=('intltool' 'python' 'gobject-introspection' 'autoconf')
source=(https://github.com/mypaint/libmypaint/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        libmypaint-autoconf-2.7.patch::https://github.com/mypaint/libmypaint/commit/a6bac154db018e1f1cc4dbddc34f6c8422c891fb.patch)
sha512sums=('f759223e2e2da9fcc675bc2fa6324e2688ab36bdd979c0b3fad6737a6884e6095b6599c37960fd4897b9fd9063d5643fc2ab7e559438095c1872e019cd46d38b'
            'a3ed4de701c24fa2fe1bdd50c0f2993f35c238e0145b514b2eee60cd35c4928f5aa552d761326ac9722da485a034421d1b3222c13d79e82812f78755a96158b4')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 < ../libmypaint-autoconf-2.7.patch
  sed -i 's/-1.16/-1.17/' ./autogen.sh
  ./autogen.sh
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-gegl
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
