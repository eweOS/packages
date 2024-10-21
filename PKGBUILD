# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libvoikko
pkgver=4.3.2
pkgrel=2
pkgdesc="A spelling and grammar checker, hyphenator and collection of related linguistic data for Finnish language"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://voikko.sourceforge.net"
license=(GPL2)
makedepends=(python)
source=(https://www.puimula.org/voikko-sources/libvoikko/$pkgname-$pkgver.tar.gz)
sha512sums=('d510a9344501f86b2f644c1237faf8709f02b5d17bca76f7934c8422495aeee307f12c60dde47df15a39c24c3311253d3dea2d0648050fc3a056a22497de695c')

build() {
  cd $pkgname-$pkgver

# Workaround encoding error
  export LANG=en_US.UTF-8
  ./configure --prefix=/usr --enable-hfst=false --with-dictionary-path=/usr/share/voikko
  make
}

package() {
  cd $pkgname-$pkgver
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/lib/"python${python_version}"/site-packages
  cp python/libvoikko.py "$pkgdir"/usr/lib/"python${python_version}"/site-packages/libvoikko.py
}
