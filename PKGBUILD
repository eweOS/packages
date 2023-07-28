# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Manan Singh <mananapr@gmail.com>

pkgname=cfiles
pkgver=1.8
pkgrel=2
pkgdesc="A ncurses file manager written in C"
arch=(x86_64 aarch64 riscv64)
url="https://github.com/mananapr/cfiles/"
license=('MIT')
depends=('ncurses' 'fzf')
optdepends=('mediainfo: to see media info'
  'atool: for archive previews'
  'python-ueberzug-git: for image previews'
  'poppler: for pdf previews'
  'w3m: for image previews')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/cfiles/archive/v${pkgver}.tar.gz")
sha512sums=('14880c71bcc6dc0b6433be722bdd75d30859556fae30754c668a9dacf8a1b8e4758cca3572de034a1e8fb4e947d38739351969139fe72f59a7af3dcb158aaa86')

build()
{
  cd "${pkgname}-${pkgver}"
  make CC=cc
}

package()
{
  cd "$pkgname-${pkgver}"
  make CC=cc DESTDIR=$pkgdir install
}
