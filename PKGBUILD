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
  "$pkgname.hook"
  "$pkgname-gen"
  "add-live.patch"
)
sha512sums=('4f8eeb445cd277d1a535424b5f33c71670e46dfc1edd0cece08913db31f2f5f021d632e14fc43c5764d2ae331d7d8a3390b5064bbf28314a84fe13e1f4682bfc'
            'd0f0afe7b8f2f32ff6b6a49d11ef58dc4976b609748781799d0209cea9ef43c423267007252c16168eeb8f295a99caa287519348348597885891d47da8f2a946'
            '21db3bf659810bb5ab8e1dd62716cb298b09fb5021e47c1b0158c1eb7c40e2bf61b4dd508f42016015db9f073aa613bef0c1c1db2926e31c46135a3d8b5b9f27'
            '74df3a9e7fca35dcc6bc292e28c9069d0bf14df670f11e4561cbb94fc792c4c67bf927f77b4bcaf2c379afd8e2281936bad59ea834350482b8eb42201817777f'
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

  install -Dm 644 $srcdir/$pkgname.hook "$pkgdir/usr/share/libalpm/hooks/99-$pkgname.hook"
  install -Dm 755 $srcdir/$pkgname-gen "$pkgdir/usr/share/libalpm/scripts/$pkgname-gen"
}
