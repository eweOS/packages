# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=file
pkgver=5.45
pkgrel=1
pkgdesc='File type identification utility'
arch=(x86_64 aarch64 riscv64)
license=('custom')
groups=('base-devel')
depends=('musl' 'zlib' 'xz' 'libbz2')
options=('!emptydirs')
source=("https://astron.com/pub/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82')

prepare()
{
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build()
{
  cd $pkgname-$pkgver
  CFLAGS+=" -pthread"
  ./configure \
    --prefix=/usr \
    --datadir=/usr/share/file
  make
}

check()
{
  cd $pkgname-$pkgver
  make check
}

package()
{
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
