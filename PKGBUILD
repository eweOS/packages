# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=slibtool
pkgver=0.6.0
pkgrel=1
pkgdesc="Skinny libtool implementation, written in C"
url='http://git.midipix.org/cgit.cgi/slibtool'
license=('MIT')
provides=(libtool)
arch=(x86_64 aarch64 riscv64)
source=(
  "http://midipix.org/dl/slibtool/slibtool-$pkgver.tar.xz"
  compile install-sh libtool.m4 ltdl.m4 lt~obsolete.m4 ltsugar.m4 missing
  depcomp libtoolize ltargz.m4 ltmain.sh ltoptions.m4 ltversion.m4
  config.guess config.sub
)
sha256sums=('10b0a12c074b10fa1fec6fe74937b4812c3a7b37f7cc45d0dca68495c2b45e6a'
            'a8e92a6becc767713e58a5e381b121dca25bb40224c4f956e7330e985bddcff5'
            'd7c113e5484fce8b48f9a34a7a91e385ec279247d415b0b7d749bd56ad8ee8a2'
            '94ebc155f41e96e5cb8762a2661e0d39426274e1b2b930bfb6d99c680a041c58'
            '3811eb3a8d18345b3574edff2404b770255ed3efefd7d0a337688c014c8aff1e'
            '26fa3285c35dd6ab00ed1e466ba92a17e4655e01897731ec18a587a4cf5e4f8d'
            '5a6735cda60e0ba0d1b706c0ef648f5d096298da46daefd9cdecdb6a0f4584d3'
            'b1a337b731bbb58846d31ca2f5143c293a455fa41b481e236e89a9016d96b034'
            'f6b762f33e1b148a55d520e9e4bff48e5f29bd8f5b626ee24b3b42f6d122be22'
            '87667af7957b8bc7e9ace8f94b3cca9c91a8c252dc5836255f9b606d060e46e5'
            'aec3cfb66528a05ba3bce09826d5bbd14e5ee74a8da83f7f384b405e4044632c'
            '34ffaa53e9becccce1cee4f149a3b1cbba3c4cda06ab7dfaf1ae905ea4b2c0e3'
            'e77ebba8361b36f14b4d0927173a034b98c5d05049697a9ded84d85eb99a7990'
            'a27b754709de61575197bf5a980696c98ae49da3f92f0de8ee7f42dd543b7465'
            'c081ced2d645e3b107fbf864529cc0e5954399a09b87a4f1d300470854b6dea4'
            'f08fe8f207c0fa6d722312774c28365024682333f5547c8192d0547957b000af')

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
