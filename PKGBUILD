# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-beautifulsoup4
_pkgname="${pkgname#python-}"
pkgver=4.13.3
pkgrel=1
pkgdesc='A Python HTML/XML parser designed for quick turnaround projects like screen-scraping'
arch=('any')
url='https://www.crummy.com/software/BeautifulSoup/'
license=('MIT')
depends=(
  'python'
  'python-soupsieve'
  'python-typing_extensions'
)
optdepends=(
  'python-cchardet: alternative to autodetect character encodings'
  'python-chardet: to autodetect character encodings'
  'python-lxml: alternative HTML parser'
  'python-html5lib: alternative HTML parser'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://www.crummy.com/software/BeautifulSoup/bs4/download/${pkgver%.*}/$_pkgname-$pkgver.tar.gz")
sha256sums=('1bd32405dacc920b42b83ba01644747ed77456a65760e285fbc47633ceddaf8b')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  # https://bugs.gentoo.org/show_bug.cgi?format=multiple&id=944926
  cd "$_pkgname-$pkgver"
  pytest -v --deselect "bs4/tests/test_css.py::TestCSSSelectors::test_unsupported_pseudoclass"
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
