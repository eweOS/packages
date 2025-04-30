# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fcgi2
pkgname=fcgi
pkgver=2.4.6
pkgrel=1
pkgdesc="A language independent, high performant extension to CGI"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LicenseRef-OML')
url='http://www.fastcgi.com/'
source=("https://github.com/FastCGI-Archives/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('39af4fb21a6d695a5f0b1c4fa95776d2725f6bc6c77680943a2ab314acd505c1')

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
