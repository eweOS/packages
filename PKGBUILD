# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=python
pkgname=(python python-tests)
pkgver=3.13.2
pkgrel=1
_pybasever=${pkgver%.*}
pkgdesc='The Python programming language'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='http://www.python.org'
license=('PSF-2.0')
depends=(libffi ncurses expat openssl readline sqlite mpdecimal)
makedepends=(
  libffi
  ncurses
  openssl
  xz
  readline
  zlib
  linux-headers
)
source=(
  "https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
  musl-find_library.patch
)
sha256sums=('d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56'
            '055a00bef64a9c22d746be5e9072d09b303e21cf0865daed1d7a67210207fb4f')

prepare()
{
  _patch_ Python-${pkgver}
  cd Python-${pkgver}

  # Ensure that we are using the system copy of various libraries
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/_decimal/libmpdec

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
    --with-lto \
    --enable-shared \
    --without-static-libpython \
    --with-system-libmpdec \
    --enable-loadable-sqlite-extensions \
    ax_cv_c_float_words_bigendian=no

  make
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
