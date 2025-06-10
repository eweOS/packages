# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-pystemmer
pkgver=3.0.0
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
sha512sums=('8bcb839df2c3964d410bddaa56599e5498152a81ff121b56490e5b4e42a4e52c74c9fc822a30283325e73f19219ac117ae3ac1a8e738b5a9c72ff0342b4991cf')

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
