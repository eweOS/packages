# Maintainer: Yukari Chiba <i@0x7f.cc>
# Contributor: Aleksana QwQ <me@aleksana.moe>

pkgname=ranger
pkgver=1.9.4
pkgrel=2
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
sha512sums=('18cd1d66838a5f85176e6b7502521a7e449aaa0b12e97d62142d39f980c529c5b97a50f6fb8a65adb64612fa80450b1e13047327f7bcc005a494af4ab321e4d4')

check() {
  cd ${pkgname}-${pkgver}
  make test_pytest
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
}
