# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-msgpack
pkgver=1.1.0
pkgrel=1
pkgdesc='MessagePack serializer implementation for Python'
url='https://github.com/msgpack/msgpack-python'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0')
depends=('python')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=(msgpack-python-$pkgver.tar.gz::https://github.com/msgpack/msgpack-python/archive/v$pkgver.tar.gz)
sha512sums=('d3ab6d91804ef55f744d8df5017e41eb84149c2379c0de7a8ed31353c112ca9511ed091ce5e1919b260ba60fc307832096dc5a0fae49a18cb30215bc35d89198')

prepare() {
  sed -i 's/~=/>=/' msgpack-python-$pkgver/pyproject.toml
}

build() {
  cd msgpack-python-$pkgver
  make cython
  python -m build --wheel --no-isolation
}

check() {
  cd msgpack-python-$pkgver
  PYTHONDONTWRITEBYTECODE=1 PYTHONPATH=$(printf '%s\n' $PWD/build/* | paste -sd:) py.test test
}

package() {
  cd msgpack-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
