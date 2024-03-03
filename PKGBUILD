# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgbase=musl
pkgname=(musl musl-static)
pkgver=1.2.5
pkgrel=1
pkgdesc='An implementation of the C/POSIX standard library.'
arch=(x86_64 aarch64 riscv64)
url='https://musl.libc.org'
license=(LGPL BSD)
groups=(base-devel)
makedepends=(lld)
provides=(ld-musl-$(arch).so.1 libc.so)
# disable lto: https://github.com/InBetweenNames/gentooLTO/issues/244
options=(!lto)
source=(
  "http://www.etalabs.net/musl/releases/${pkgbase}-${pkgver}.tar.gz"
  getconf.c
  getent.c
  iconv.c
)
sha256sums=('a9a118bbe84d8764da0ea0d28b3ab3fae8477fc7e4085d90102b8596fc7c75e4'
            'd87d0cbb3690ae2c5d8cc218349fd8278b93855dd625deaf7ae50e320aad247c'
            '002c1a216f6bed0f816ab1cfebde94a0b127193ef410c36b2190599983e015b8'
            'f79a2930a2e5bb0624321589edf8b889d1e9b603e01e6b7ae214616605b3fdd7')

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
  # Linking with mold would cause segfault with mimalloc
  CFLAGS="$CFLAGS -fuse-ld=lld"
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
