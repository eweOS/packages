# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=python
pkgname=(python python-tests)
pkgver=3.12.2
pkgrel=3
_pybasever=${pkgver%.*}
pkgdesc='The Python programming language'
arch=(x86_64 aarch64 riscv64)
url='http://www.python.org'
license=('PSF-2.0')
depends=(libffi ncurses expat openssl readline sqlite)
makedepends=(
  libffi
  ncurses
  openssl
  xz
  readline
  zlib
)
source=(
  "https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
  python-expat-2.6.patch::https://github.com/python/cpython/pull/115289.patch
  EXTERNALLY-MANAGED)
sha256sums=('be28112dac813d2053545c14bf13a16401a21877f1a69eb6ea5d84c4a0f3d870'
            'e2f9a36df0442f34b838db4f261c8be9daf18f81679f800282bf5a5f0d8a9eb7'
            'fbe6c6ac37ccc7ad8b60f6508e58f542a6745d45602f27b68bbcc80b502168a4')

prepare()
{
  cd Python-${pkgver}

  patch -Np1 -i ../python-expat-2.6.patch

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries
  # rather than copies shipped in the tarball
  rm -r Modules/expat

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
    --with-computed-gotos \
    --enable-ipv6 \
    --with-system-expat \
    --enable-optimizations \
    --with-lto \
    --enable-shared \
    --without-static-libpython \
    --enable-loadable-sqlite-extensions \
    ax_cv_c_float_words_bigendian=no
}

package_python()
{
  optdepends=('python-setuptools: for building Python packages using tooling that is usually bundled with Python'
              'python-pip: for installing Python packages using tooling that is usually bundled with Python'
              'python-pipx: for installing Python software not packaged on Arch Linux'
              'sqlite: for a default database integration'
              'mpdecimal: for decimal'
              'xz: for lzma'
              'tk: for tkinter')
  provides=('python3' 'python-externally-managed')
  replaces=('python3' 'python-externally-managed')

  cd Python-${pkgver}

  # Hack to avoid building again
  sed -i 's/^all:.*$/all: build_all/' Makefile

  make DESTDIR="${pkgdir}" install

  # Why are these not done by default...
  ln -s python3               "${pkgdir}"/usr/bin/python
  ln -s python3-config        "${pkgdir}"/usr/bin/python-config
  ln -s idle3                 "${pkgdir}"/usr/bin/idle
  ln -s pydoc3                "${pkgdir}"/usr/bin/pydoc
  ln -s python${_pybasever}.1 "${pkgdir}"/usr/share/man/man1/python.1
  ln -s pip3                  "${pkgdir}"/usr/bin/pip

  # some useful "stuff" FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # Split tests
  cd "$pkgdir"/usr/lib/python*/
  rm -r {test,idlelib/idle_test}
}

package_python-tests() {
  pkgdesc="Regression tests packages for Python"
  depends=('python')

  cd Python-${pkgver}

  make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" libinstall
  cd "$pkgdir"/usr/lib/python*/
  #workaround for busybox
  mv test $srcdir/test
  rm -r ./*
  mv $srcdir/test .
}
