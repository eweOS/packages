# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=cdrdao
pkgname=('cdrdao' 'gcdmaster')
pkgver=1.2.6
pkgrel=1
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('GPL-2.0-or-later')
url="http://cdrdao.sourceforge.net/"
pkgdesc='Records audio/data CD-Rs in disk-at-once (DAO) mode'
depends=('atkmm' 'cairomm' 'dconf' 'glib2' 'glibmm' 'gtk3' 'gtkmm3' 'lame'
         'libao' 'libmad' 'libsigc++2' 'libvorbis' 'pangomm')
makedepends=('linux-headers')
options=('!emptydirs')
source=(https://downloads.sourceforge.net/${pkgbase}/${pkgbase}-${pkgver}.tar.bz2)
sha256sums=('0cf29e1183ffd8e4d167c403d7a6ea2109a2dd4cd97e61f80417cf1373220ff4')

build() {
  cd ${pkgbase}-${pkgver}
  ./configure --prefix=/usr \
	--mandir=/usr/share/man \
	--sysconfdir=/etc \
	--with-lame \
	--with-ogg-support \
	--with-mp3-support
  make
}

package_cdrdao() {
  depends=('lame' 'libao' 'libmad' 'libvorbis')

  cd ${pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  make -C gcdmaster DESTDIR="${pkgdir}" uninstall
}

package_gcdmaster() {
  pkgdesc='GUI frontend for creating audio CDs and burning them using cdrdao'
  depends=('atkmm' 'cairomm' 'cdrdao' 'dconf' 'glib2' 'glibmm' 'gtk3' 'gtkmm3'
           'libao' 'libmad' 'libsigc++2' 'libvorbis' 'pangomm')

  cd ${pkgbase}-${pkgver}
  make -C gcdmaster DESTDIR="${pkgdir}" install
}
