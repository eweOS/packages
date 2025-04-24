# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=fcgi2
pkgname=fcgi
pkgver=2.4.5
pkgrel=1
pkgdesc="A language independent, high performant extension to CGI"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('LicenseRef-OML')
url='http://www.fastcgi.com/'
source=("https://github.com/FastCGI-Archives/$pkgbase/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('92b0111a98d8636e06c128444a3d4d7a720bdd54e6ee4dd0c7b67775b1b0abff')

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
