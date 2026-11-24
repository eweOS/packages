# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=python
pkgname=(python python-tests)
pkgver=3.13.18
pkgrel=2
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
# 0001: Backport cpython#146404 to avoid using the fixed-version SSL/TLS methods
#       removed in OpenSSL 4.
# 0002: Backport cpython#159388 to keep reporting TLS 1.0–1.2 as available
#       even though their fixed-version methods were removed.
# 0003: Backport cpython#149102 to preserve SSLEOFError on repeated I/O.
# 0004: Backport cpython#148601 to use the OpenSSL 4 error reason names.
# 0005: Backport the POP3 test fix from cpython#149356 for renamed TLS alerts.
source=(
  "https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
  musl-find_library.patch
  0001-Add-support-for-OpenSSL-4.0.0-alpha1.patch
  0002-Fix-TLS-availability-with-OpenSSL-4.patch
  0003-Preserve-SSL-EOF-errors-with-OpenSSL-4.patch
  0004-Add-OpenSSL-4-error-codes.patch
  0005-Accept-OpenSSL-4-alerts-in-POP3-tests.patch
  EXTERNALLY-MANAGED
)
sha256sums=('abb0102e6d4ae027509bcb82327d9dd85515b44a3ba8ad538cfc5e9847029f68'
            '055a00bef64a9c22d746be5e9072d09b303e21cf0865daed1d7a67210207fb4f'
            '0d7c3b2738e956625f0258e692e28ca4b078349984390de003144fab16db0369'
            'aae7016a0163de7ee254abdc5bee78f011c39aec8a7d7e4867598ff3e49a0e82'
            '1e57da24b1c56bf54c91c9075e4ebb9f316fef89424a995b5644feebfc5fe695'
            'f8de7f1bc516a6e9d255f115a1ca45929c69b9b07ec6d01e350779ff476eb976'
            '9e61f65daf8fb42d967b72683634e4113c4cee7cb34d8f230d1f653be9ed771e'
            'eb165082097dfc3bde16b25d861093ae4dcadaf1cf102e45e5e2e630fbb58de8')

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
    --without-ensurepip \
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

  # some useful "stuff" FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # PEP668
  install -Dm644 "$srcdir"/EXTERNALLY-MANAGED -t "${pkgdir}/usr/lib/python${_pybasever}/"

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
