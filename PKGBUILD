# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tinyramfs
pkgver=0.1.0
pkgrel=6
pkgdesc="Tiny initramfs generator written in POSIX shell"
arch=('any')
url="https://github.com/illiliti/tinyramfs"
license=('GPL3')
depends=('sh')
source=(
  "$url/archive/refs/tags/${pkgver}.tar.gz"
  "config"
  "add-live.patch"
)
sha512sums=('4f8eeb445cd277d1a535424b5f33c71670e46dfc1edd0cece08913db31f2f5f021d632e14fc43c5764d2ae331d7d8a3390b5064bbf28314a84fe13e1f4682bfc'
  'd0f0afe7b8f2f32ff6b6a49d11ef58dc4976b609748781799d0209cea9ef43c423267007252c16168eeb8f295a99caa287519348348597885891d47da8f2a946'
  'b9ec43f8299492dad57e84b482d050b7120522c86fb8cda30cb4ffcaf46bfb739618422c5f2fb852d9e11030e38e181b6bd56673e3dbeb1432d40be37d998f1d')

prepare()
{
  cd $pkgname-$pkgver
  # https://github.com/illiliti/tinyramfs/pull/17
  patch -p1 < ../add-live.patch
}

check()
{
  cd $pkgname-$pkgver
  # need all component presents
  #make check
}

package()
{
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -d $pkgdir/etc/$pkgname
  install -D $srcdir/config $pkgdir/etc/$pkgname/config
}
