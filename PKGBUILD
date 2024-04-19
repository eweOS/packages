# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=ranger
pkgver=1.9.3
pkgrel=5
pkgdesc='Simple, vim-like file manager'
arch=('any')
url='https://ranger.github.io'
license=('GPL')
depends=('python')
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
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
checkdepends=('python-pytest')
source=(https://ranger.github.io/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5cd7bea714a6542d0a5445f5f0cf929b2df4377df3ef710f3786c6c46dd58b017a8060cde3969076637bfaac03c13297d3020fd82f4574dc49546ca223c0e8d3')

check() {
  cd ${pkgname}-${pkgver}
  make test_pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
