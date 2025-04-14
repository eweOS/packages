# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-lxml
pkgver=5.3.2
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
# 0001: Backport, fix compatibility with newer Cython
#	Reference: https://github.com/cython/cython/issues/6561
source=("https://github.com/lxml/lxml/archive/lxml-$pkgver.tar.gz"
	"0001-Avoid-custom-tp_new-call.patch::https://github.com/lxml/lxml/commit/6d5d6aed2e38e1abc625f29c0b3e97fc8c60ae3b.patch")
sha512sums=('d128f7d6dd2a08286f8478508cb2693c7749c5f3822acfcd10877b92bec24e82c3da624b3a1872f95f72d310247083c84f76a42eadfc910b8180749d85b32d8b'
            'b129f5b78ecfd21264dd5b03c7d9cffb130f3cb19ee131d48e87118e68a17e890686716e83915688b9b9de42b1533bda20002af7565607e63aa5b60936a3b16a')

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

