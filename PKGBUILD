# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

pkgname=cracklib
pkgver=2.10.2
pkgrel=1
pkgdesc="Password Checking Library"
arch=(x86_64 aarch64 riscv64)
license=('GPL')
url="https://github.com/cracklib/cracklib"
depends=('musl' 'zlib')
source=(https://github.com/cracklib/cracklib/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('2689cd4a3a8df2bbe033aba56bedd1becfa82235505109ca45b4d2a5f652aef6')

build()
{
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin
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

  # symlink cracklib-small #34778
  mkdir -p "$pkgdir"/usr/share/dict
  ln -sf /usr/share/cracklib/cracklib-small "$pkgdir"/usr/share/dict/cracklib-small

  sh ./util/cracklib-format dicts/cracklib-small \
    | sh ./util/cracklib-packer "$pkgdir"/usr/share/cracklib/pw_dict
}
