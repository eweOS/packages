# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: leif_thande <leif.thande@gmail.com>
# Contributor: tranquility <trankas@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=atool
pkgver=0.39.0
pkgrel=8
pkgdesc='A script for managing file archives of various types'
arch=(any)
url="https://www.nongnu.org/$pkgname"
license=(GPL3)
depends=(file
         perl)
optdepends=('bzip2: support bzip2 compression'
            'cpio: support cpio archives'
            'gzip: support gzip compression'
            'lha: support lha, lharc, and similar archives'
            'xz: support lzma compressed archives'
            'lzop: support lzop compressed archives'
            'p7zip: support 7z cpmressed archives'
            'tar: support tar archives'
            'unace: support ace archives'
            'unrar: support rar archives'
            'zip: support creating zip archives'
            'unzip: support extracting zip archives')
_archive="$pkgname-$pkgver"
source=("https://savannah.nongnu.org/download/$pkgname/$_archive.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$_archive"
  ./configure --prefix=/usr
}

package() {
  cd "$_archive"
  make DESTDIR="$pkgdir" install
}
