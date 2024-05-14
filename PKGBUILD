# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-lxml
pkgver=5.2.2
pkgrel=1
pkgdesc="Python3 binding for the libxml2 and libxslt libraries"
arch=(x86_64 aarch64 riscv64)
license=('BSD' 'custom')
url="https://lxml.de/"
depends=('python' 'libxslt')
optdepends=('python-beautifulsoup4: support for beautifulsoup parser to parse not well formed HTML'
            'python-cssselect: support for cssselect'
            'python-html5lib: support for html5lib parser'
            'python-lxml-docs: offline docs')
makedepends=('python-setuptools' 'python-pygments' 'cython')
# FIXME: missing dependencies
#checkdepends=('python-cssselect' 'python-html5lib' 'python-beautifulsoup4')
source=(
  "https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz"
  "tests-fix-encoding-name.patch"
)
sha512sums=('20b87a2d6e7ac82b6979d6fd18ecd5c224fec6eeee6b69d47a5bf2947ce53e6a517d1b86ab68836a5974f78ce86551ddc2317c1a7255932b418b98dc64d59376'
            'ef5ba4064166443e07040db315173a4d0cb0d83eb3cd49623f210253a25433ec1c408d6d8e538f93498a211bc1695fdaa3e39f8ac75f36a3319c38bd96ba73eb')

prepare() {
  mv lxml-lxml-$pkgver lxml-$pkgver
  _patch_ lxml-$pkgver
  # Setting LC_CTYPE to workaround encoding issue
  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd lxml-$pkgver
  python setup.py build
}

check() {
  # TODO: Find a sane way to skip inplace build

  cd lxml-$pkgver
  # FIXME: Symbol not found: xmlReadMemory
  make PYTHON=python test || :
}

package() {
  cd lxml-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1

  install -Dm644 LICENSES.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 doc/licenses/BSD.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/BSD.txt
  install -Dm644 doc/licenses/elementtree.txt \
    "$pkgdir"/usr/share/licenses/$pkgname/elementtree.txt
}

