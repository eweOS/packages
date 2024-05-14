# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-beautifulsoup4
_pkgname="${pkgname#python-}"
pkgver=4.12.3
pkgrel=1
pkgdesc='A Python HTML/XML parser designed for quick turnaround projects like screen-scraping'
arch=('any')
url='https://www.crummy.com/software/BeautifulSoup/'
license=('MIT')
depends=(
  'python'
  'python-soupsieve'
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
sha256sums=('74e3d1928edc070d21748185c46e3fb33490f22f52a3addee9aee0f4f7781051')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest -v
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
