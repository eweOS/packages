# Maintainer: Aleksana QwQ <me@aleksana.moe>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Roman Zimbelmann <romanz@lavabit.com>

pkgname=ranger
pkgver=1.9.3
pkgrel=4
pkgdesc='Simple, vim-like file manager'
arch=('any')
url='https://ranger.github.io'
license=('GPL')
depends=('python')
optdepends=(
    'atool: for previews of archives'
    'elinks: for previews of html pages'
    'ffmpegthumbnailer: for video previews'
    'highlight: for syntax highlighting of code'
    'libcaca: for ASCII-art image previews'
    'lynx: for previews of html pages'
    'mediainfo: for viewing information about media files'
    'odt2txt: for OpenDocument texts'
    'perl-image-exiftool: for viewing information about media files'
    'poppler: for pdf previews'
    'python-chardet: in case of encoding detection problems'
    'sudo: to use the "run as root"-feature'
    'transmission-cli: for viewing bittorrent information'
    'ueberzug: for previews of images'
    'w3m: for previews of images and html pages')
#checkdepends=('python-pytest') # python packages isn't ready
source=(https://ranger.github.io/${pkgname}-${pkgver}.tar.gz)
sha512sums=('SKIP')

check() {
  cd ${pkgname}-${pkgver}
#  make test_pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
