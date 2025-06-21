# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libvoikko
pkgver=4.3.3
pkgrel=1
pkgdesc="A spelling and grammar checker, hyphenator and collection of related linguistic data for Finnish language"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="http://voikko.sourceforge.net"
license=('GPL-2.0-or-later OR MPL-1.1 OR LGPL-2.1-or-later')
# TODO: Split the python binding
depends=(musl llvm-libs python)
provides=(libvoikko.so)
source=(https://www.puimula.org/voikko-sources/libvoikko/$pkgname-$pkgver.tar.gz)
sha512sums=('8b6a8d52a43414c5acbc4582dbee4ba4687c204fdf59f097b202f80138bbe079d1feedcc9e13819078b7366de9a629d81c491e782435b64634e5ff38701038f5')

build() {
  cd $pkgname-$pkgver

# Workaround encoding error
  export LANG=en_US.UTF-8
  ./configure --prefix=/usr --enable-hfst=false --with-dictionary-path=/usr/share/voikko
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir"/usr/lib/"python${python_version}"/site-packages
  cp python/libvoikko.py "$pkgdir"/usr/lib/"python${python_version}"/site-packages/libvoikko.py
  _install_license_ LICENSE.CORE LICENSE.CORE
  _install_license_ COPYING COPYING
}
