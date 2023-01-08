# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgbase=musl
pkgname=(musl musl-static)
pkgver=1.2.3
pkgrel=2
pkgdesc='An implementation of the C/POSIX standard library.'
arch=(x86_64 aarch64)
url='https://musl.libc.org'
license=(LGPL BSD)
groups=(base-devel)
depends=()
makedepends=()
provides=(ld-musl-$(arch).so.1 libc.so)

source=(
  "http://www.etalabs.net/musl/releases/${pkgbase}-${pkgver}.tar.gz"
  getconf.c
  getent.c
  iconv.c
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare()
{
  cd $pkgbase-$pkgver
  # utmp/wtmp path
  sed -i 's/\/dev\/null\/utmp/\/run\/utmps\/utmp/g' include/paths.h
  sed -i 's/\/dev\/null\/wtmp/\/var\/log\/wtmp/g' include/paths.h
}

build()
{
  cd $pkgbase-$pkgver
  ./configure --prefix=/usr --syslibdir=/usr/lib
  make
  cd $srcdir
  local i
  for i in getconf getent iconv; do
    cc $CFLAGS $i.c -o $i
  done
}

package_musl()
{
  cd $pkgbase-$pkgver
  make DESTDIR=${pkgdir} install
  install -d "${pkgdir}"/usr/bin
  ln -sf /usr/lib/libc.so "${pkgdir}"/usr/bin/ldd
  install -D \
    $srcdir/getent \
    $srcdir/getconf \
    $srcdir/iconv \
    $pkgdir/usr/bin
  # provide by utmps
  rm "${pkgdir}"/usr/include/utmp{,x}.h

  # provide by libxcrypt
  rm "${pkgdir}"/usr/include/crypt.h

  mkdir -p $srcdir/static
  mv $pkgdir/usr/lib/*.a $srcdir/static
}

package_musl-static()
{
  options=('staticlibs')
  mkdir -p $pkgdir/usr/lib
  mv $srcdir/static/*.a $pkgdir/usr/lib
}
