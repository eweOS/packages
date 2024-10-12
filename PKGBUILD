# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: nut543 <kfs1@online.no>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=re2c
pkgver=3.1
pkgrel=1
arch=(x86_64 aarch64 riscv64)
depends=(llvm-libs)
makedepends=(cmake)
checkdepends=(python)
pkgdesc='A tool for generating C-based recognizers from regular expressions'
url='https://re2c.org'
license=('public domain')
source=(re2c-$pkgver.tar.gz::https://github.com/skvadrik/re2c/archive/$pkgver.tar.gz)
sha1sums=('41a1b26553ee07dd0b73ee2b9283afd6197f24e1')

build()
{
  cd $pkgname-$pkgver
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

check()
{
  cd $pkgname-$pkgver
  cmake --build build --target check
}

package()
{
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
