# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=atool
pkgver=0.39.0
pkgrel=11
pkgdesc='A script for managing file archives of various types'
arch=(any)
url="https://www.nongnu.org/$pkgname"
license=(GPL-2.0-or-later)
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
source=("http://download-mirror.savannah.gnu.org/releases/atool/$_archive.tar.gz")
sha256sums=('aaf60095884abb872e25f8e919a8a63d0dabaeca46faeba87d12812d6efc703b')

build() {
  cd "$_archive"
  ./configure --prefix=/usr
}

package() {
  cd "$_archive"
  make DESTDIR="$pkgdir" install
}
