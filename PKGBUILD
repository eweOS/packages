# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-lxml
pkgver=5.4.0
pkgrel=1
pkgdesc="Python3 binding for the libxml2 and libxslt libraries"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz")
sha512sums=('a7f297b94fd88f20de9371bef207f8e95243a060b24e4006ec310c4a94f6147c8bb38fc3cff0f874f0b76282e745bb62e65a5cba2ce6e34ee54be0e3fde66724')

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
  make PYTHON=python test
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

