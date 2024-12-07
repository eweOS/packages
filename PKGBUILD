# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fcgi2
pkgname=fcgi
pkgver=2.4.3
pkgrel=2
pkgdesc="A language independent, high performant extension to CGI"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('custom')
url='http://www.fastcgi.com/'
source=("https://github.com/FastCGI-Archives/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5273bc54c28215d81b9bd78f937a9bcdd4fe94e41ccd8d7c991aa8a01b50b70e')

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
