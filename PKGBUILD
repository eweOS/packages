# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tinyramfs
pkgver=0.1.0
pkgrel=11
pkgdesc="Tiny initramfs generator written in POSIX shell"
arch=('any')
url="https://github.com/illiliti/tinyramfs"
_url="https://github.com/eweOS/tinyramfs"
license=('GPL3')
depends=('sh')
makedepends=('git')
_refcommit="de2d6aea4dfe1b284ed0d485f0acd16303ff253b"
_commit="5a9e947178a321daa6e89e3b54329e353bc49b47"
source=(
  "git+$_url.git#commit=$_commit"
  "config"
)
backup=("etc/$pkgname/config")
sha512sums=('SKIP'
            'd0f0afe7b8f2f32ff6b6a49d11ef58dc4976b609748781799d0209cea9ef43c423267007252c16168eeb8f295a99caa287519348348597885891d47da8f2a946')

pkgver()
{
  cd $pkgname
  printf "$pkgver.r%s.%s" "$(git rev-list --count $_refcommit..HEAD)" "$(git rev-parse --short HEAD)"
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
