# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=slibtool
pkgver=0.5.34
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
provides=(libtool)
arch=('x86_64' 'aarch64')
source=(
  "http://midipix.org/dl/slibtool/slibtool-$pkgver.tar.xz"
  compile install-sh libtool.m4 ltdl.m4 lt~obsolete.m4 ltsugar.m4 missing
  depcomp libtoolize ltargz.m4 ltmain.sh ltoptions.m4 ltversion.m4
  config.guess config.sub
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build()
{
  cd "$srcdir"/slibtool-$pkgver
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$srcdir"/slibtool-$pkgver
  make DESTDIR="$pkgdir" install

  ln -s slibtool "$pkgdir"/usr/bin/libtool

  mkdir -p "$pkgdir"/usr/share/libtool/build-aux \
    "$pkgdir"/usr/share/libtool/AC_CONFIG_MACRO_DIRS \
    "$pkgdir"/usr/share/aclocal/

  cd "$srcdir"

  for macros in ltversion.m4 libtool.m4 ltargz.m4 ltdl.m4 ltoptions.m4 ltsugar.m4 lt~obsolete.m4; do
    install -Dm644 $macros "$pkgdir"/usr/share/aclocal/$macros
    install -Dm644 $macros "$pkgdir"/usr/share/libtool/AC_CONFIG_MACRO_DIRS/$macros
  done

  for aux in compile depcomp install-sh missing; do
    install -Dm755 $aux "$pkgdir"/usr/share/libtool/build-aux/$aux
  done
  install -Dm755 ltmain.sh "$pkgdir"/usr/share/libtool/build-aux/ltmain.sh

  install -Dm755 config.sub "$pkgdir"/usr/share/libtool/build-aux/config.sub
  install -Dm755 config.guess "$pkgdir"/usr/share/libtool/build-aux/config.guess

  install -Dm755 libtoolize "$pkgdir"/usr/bin/libtoolize
  sed -i "s,uncom_sysroot,/usr,g" "$pkgdir"/usr/bin/libtoolize
}
