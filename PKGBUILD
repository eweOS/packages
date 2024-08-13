# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tinyramfs
_pkgver=0.1.0
pkgver=0.1.0
pkgrel=15
pkgdesc="Tiny initramfs generator written in POSIX shell"
arch=('any')
url="https://github.com/illiliti/tinyramfs"
_url="https://github.com/eweOS/tinyramfs"
license=('GPL3')
depends=('sh')
makedepends=('git')
_refcommit="de2d6aea4dfe1b284ed0d485f0acd16303ff253b"
_commit="894fcb5fe0a4d6658e20b3ecd80227ecb1cb2d43"
source=(
  "git+$_url.git#commit=$_commit"
  "config"
)
backup=("etc/$pkgname/config")
sha512sums=('0f14e12feeb420d188c7fcd0fcf3d5fce5353169f99cc3c748e3882a1306fdf6b69b91f9f8cce0e4110708404a739ee2efdc2e5db9daf8f6130857ee9809f327'
            'd0f0afe7b8f2f32ff6b6a49d11ef58dc4976b609748781799d0209cea9ef43c423267007252c16168eeb8f295a99caa287519348348597885891d47da8f2a946')

pkgver()
{
  cd $pkgname
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count $_refcommit..HEAD)" "$(git rev-parse --short HEAD)"
}

check()
{
  cd $pkgname
  # need all component presents
  #make check
}

package()
{
  cd $pkgname
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -d $pkgdir/etc/$pkgname
  install -D $srcdir/config $pkgdir/etc/$pkgname/config
}
