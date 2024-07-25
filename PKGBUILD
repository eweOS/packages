# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-py-cpuinfo
pkgver=9.0.0
pkgrel=1
arch=('any')
pkgdesc='Get CPU info with pure Python'
url='https://github.com/workhorsy/py-cpuinfo'
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/workhorsy/py-cpuinfo/archive/v$pkgver.tar.gz")
sha512sums=('169ab080f10184d9067c041801f1d7c506532371cd5aaaeb05b6d10d3a9b079e011b6a992f4f8e8c6c47cfe8c0e0e6b62e147469544f0bf052aa9927813584c3')

build() {
  cd py-cpuinfo-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd py-cpuinfo-$pkgver
  pytest
}

package_python-py-cpuinfo() {
  cd py-cpuinfo-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
