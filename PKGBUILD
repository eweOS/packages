# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pytz
pkgver=2024.2
pkgrel=1
arch=('any')
url="https://pypi.python.org/pypi/pytz"
license=("MIT")
pkgdesc="Cross platform time zone library for Python"
depends=('python' 'tzdata')
makedepends=('python' 'python-setuptools')
source=("https://pypi.io/packages/source/p/pytz/pytz-${pkgver}.tar.gz"
        "0001-Use-the-system-zoneinfo-from-the-tzdata-package.patch")
sha512sums=('140a34f51044188420ac3bfbaa5ece91ea0fe4faf7a247c01312265b63b4aa8d2b389219234e173eca0343d0463aef9d6472ee803915ead989594896567c593e'
            '3cbd497313c3049a2ae04298118aefb6dfa9ec4626078c665c95c13a78ae944b33a68813aea0c53b02b0532b64221cca4a0cd2153bd91b3760916bc3c0f6df8f')

prepare() {
    cd pytz-$pkgver
    patch -p2 -i ../0001-Use-the-system-zoneinfo-from-the-tzdata-package.patch

    rm -r pytz/zoneinfo/
}

build(){
    cd pytz-$pkgver
    python setup.py build
}

check(){
    cd pytz-$pkgver/pytz/tests
    python3 test_tzinfo.py
}

package(){
    cd pytz-$pkgver
    python3 setup.py install --root="$pkgdir"/

    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
