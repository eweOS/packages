# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-babel
pkgver=2.16.0
# See the number here
# https://github.com/python-babel/babel/blob/master/scripts/download_import_cldr.py#L13
_core=45
pkgrel=1
pkgdesc="A collection of tools for internationalizing Python applications"
url="http://babel.pocoo.org/"
license=("BSD")
arch=('any')
depends=('python' 'python-pytz')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-freezegun')
noextract=("cldr-core-$_core.zip")
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-babel/babel/archive/v$pkgver.tar.gz"
        "cldr-core-$_core.zip::http://unicode.org/Public/cldr/$_core/core.zip"
        "cldr-common-$_core.0.zip::http://unicode.org/Public/cldr/$_core/cldr-common-$_core.0.zip")
sha256sums=('8468baea3e88539548a71973a33522cfded775fd0677f1a74b4a9373b4a1ddde'
            '03b6782ec5fc623f85eb54aa7e12555667a015a3b96a6e8f973418c0a894a21f'
            '03b6782ec5fc623f85eb54aa7e12555667a015a3b96a6e8f973418c0a894a21f')

prepare() {
  cp "$srcdir"/cldr-core-$_core.zip babel-$pkgver/cldr/cldr-core-$_core.zip
  cp "$srcdir"/cldr-common-$_core.0.zip babel-$pkgver/cldr/cldr-common-$_core.0.zip
}

build(){
  cd "babel-$pkgver"
  python setup.py import_cldr
  python setup.py build
}

check(){
  cd "babel-$pkgver"
  # the tests fail if running in the wrong timezone:
  # https://github.com/python-babel/babel/issues/757
  TZ=UTC pytest -k 'not test_setuptools_commands'
}

package_python-babel() {
  cd "babel-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m0644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
