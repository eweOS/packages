# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fcgi2
pkgname=fcgi
pkgver=2.4.4
pkgrel=1
pkgdesc="A language independent, high performant extension to CGI"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom')
url='http://www.fastcgi.com/'
source=("https://github.com/FastCGI-Archives/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c0e0d9cc7d1e456d7278c974e2826f593ef5ca555783eba81e7e9c1a07ae0ecc')

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
