# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python
_vermajor=3
_verminor=11
pkgver=${_vermajor}.${_verminor}.1
pkgrel=4
pkgdesc='A clear and powerful object-oriented programming language,'
arch=(x86_64 aarch64 riscv64)
url='http://www.python.org'
license=(Python)
depends=(libffi ncurses openssl readline)
makedepends=(
  libffi
  ncurses
  openssl
  sqlite
  xz
  readline
  zlib
)
source=(
  "https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
)
sha256sums=('85879192f2cffd56cb16c092905949ebf3e5e394b7f764723529637901dfb58f')

prepare()
{
  cd Python-${pkgver}
  # Ignore "x86_64-linux-gnu" output for "cc --print-multiarch"
  sed -i 's@--print-multiarch@@g' ./configure
}

build()
{
  cd Python-${pkgver}
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-system-ffi \
    --enable-shared \
    --without-static-libpython \
    ax_cv_c_float_words_bigendian=no
  make
}

package()
{
  cd Python-${pkgver}
  make DESTDIR="${pkgdir}" install
  cd ${pkgdir}
  ln -s "python${_vermajor}.${_verminor}" usr/bin/python
  ln -s "pip${_vermajor}" usr/bin/pip
  find . -name "*.pyc" -delete -o -name "*.pyo" -delete
  find . -name 'test' -type d -exec rm -rf '{}' + || true
}
