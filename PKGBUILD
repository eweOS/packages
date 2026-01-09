# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fcgi2
pkgname=fcgi
pkgver=2.4.7
pkgrel=1
pkgdesc="A language independent, high performant extension to CGI"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LicenseRef-OML')
url='http://www.fastcgi.com/'
source=("https://github.com/FastCGI-Archives/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e41ddc3a473b555bdc0cbd80703dcb1f4610c1a7700d3b9d3d0c14a416e1074b')

prepare()
{
  cd "$pkgbase-$pkgver"
  ./autogen.sh
}

build()
{
  cd "$pkgbase-$pkgver"
  ./configure --prefix=/usr
  make
}

package()
{
  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  _install_license_ LICENSE
}
