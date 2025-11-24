# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-lxml
pkgver=6.0.2
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
sha512sums=('164dc5e38e394f4396faf0b06729039f6807a227e1a2755a6991e6dce569cc64244d5edfd2cf2af0d4e845d7155a76f6e391e32f3d5aac21dff3c07cbbe06460')

prepare() {
  mv lxml-lxml-$pkgver lxml-$pkgver
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

