# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-calver
pkgver=2025.10.20
pkgrel=2
pkgdesc="Setuptools extension for CalVer package versions"
url="https://github.com/di/calver"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/di/calver/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('248add922c0dbbb13928dd5568494715a515fe0815057115751d668c77f55aa7e0a258018ac2c2af853b363a0d0ea59652f636f6f72f8665d0ca6ac036311ba3')

prepare() {
  cd calver-$pkgver
  echo "Version: $pkgver" > PKG-INFO
}

build() {
  cd calver-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd calver-$pkgver

  # Allowing calver to read version from PKG-INFO may break the test
  mv PKG-INFO PKG-INFO.bak

  PYTHONPATH="$PWD"/build/lib pytest -vv

  mv PKG-INFO.bak PKG-INFO
}

package() {
  cd calver-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE
}
