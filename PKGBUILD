# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-autocommand
pkgver=2.2.2
pkgrel=1
pkgdesc="A library to create a command-line program from a function"
url="https://github.com/Lucretiel/autocommand"
license=('LGPL')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/Lucretiel/autocommand/archive/$pkgver/$pkgname-$pkgver.tar.gz" license.patch)
sha512sums=('5ed109db16a0e309ed5107b26db0b70ed8669d73817e82eb5a219650d29f53785aa1f9471b2ac71d21dbffc9f0a13ea0fdf69e63ab534fd84407a1d6741cf5b5'
            '2a31e24bafeab219b9ba836c34efa08664ddc323592cbff6cf7853631c982ebac2f263077999cd8c7aa05a2e588f64c8a1bcc4819436b8aba7068b1a26f21019')

prepare() {
  _patch_ autocommand-$pkgver
}

build() {
  cd autocommand-$pkgver
  python setup.py build
}

check() {
  cd autocommand-$pkgver
  PYTHONPATH="$PWD"/build/lib python -m pytest
}

package() {
  cd autocommand-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
