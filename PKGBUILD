# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pystemmer
pkgver=3.1.0
pkgrel=1
pkgdesc="Snowball stemming algorithms, for information retrieval"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
license=('BSD-3-Clause' 'MIT')
url="http://snowball.tartarus.org"
depends=('python' 'libstemmer')
makedepends=('cython' 'python-build' 'python-packaging' 'python-wheel'
	     'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/snowballstem/pystemmer/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('34a0dc56a36685890d714d1771b73175c70267e7b50ea3fbd804031874c86416cb5b8dd72110ba8354fd000c1abaad83a58feda938c291130f2b214de6f71958')

export PYSTEMMER_SYSTEM_LIBSTEMMER=1

build() {
  cd pystemmer-$pkgver
  python -m build --no-isolation --wheel
}

check() {
  cd pystemmer-$pkgver

  python -m venv testenv --system-site-packages
  testenv/bin/python -m installer dist/*.whl
  testenv/bin/python -m pytest
}

package() {
  cd pystemmer-$pkgver
  python -m installer --destdir "$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
