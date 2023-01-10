# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Sébastien Luttringer

pkgname=libnftnl
pkgver=1.2.3
pkgrel=1
pkgdesc='Netfilter library providing interface to the nf_tables subsystem'
arch=(x86_64 aarch64)
url='https://netfilter.org/projects/libnftnl/'
license=('GPL2')
depends=('libmnl')
checkdepends=('jansson')
source=("https://netfilter.org/projects/libnftnl/files/libnftnl-$pkgver.tar.bz2")
sha256sums=('SKIP')

prepare()
{
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build()
{
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check()
{
  cd $pkgname-$pkgver/tests
  make check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
