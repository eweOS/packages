# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-calver
pkgver=2025.04.02
pkgrel=1
pkgdesc="Setuptools extension for CalVer package versions"
url="https://github.com/di/calver"
license=('Apache-2.0')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pretend')
source=("https://github.com/di/calver/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7af7a2f844bcfcdacd1a4e985c508b1901a5194c3e21e1f7b7c0f381778ac905dba1276ef7201db6140b08fb57fef8acaf293b270710160871e353e8315c9a02')

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

  # makepkg sets SOURCE_DATE_EPOCH, which is recognized by calver since
  # e1f9f3aaa5fc8f (Support SOURCE_DATE_EPOCH for reproducible builds (#15)
  # and breaks the test
  env -u SOURCE_DATE_EPOCH PYTHONPATH="$PWD"/build/lib pytest -vv

  mv PKG-INFO.bak PKG-INFO
}

package() {
  cd calver-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  _install_license_ LICENSE
}
