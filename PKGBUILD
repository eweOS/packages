# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-msgpack
pkgver=1.1.1
pkgrel=1
pkgdesc='MessagePack serializer implementation for Python'
url='https://github.com/msgpack/msgpack-python'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0')
depends=('python')
makedepends=('cython' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=(msgpack-python-$pkgver.tar.gz::https://github.com/msgpack/msgpack-python/archive/v$pkgver.tar.gz)
sha512sums=('0cd5569b0e70d568557d58d5fdf0dbaceaa2dd94a1242ef4dbc079a513fd51eb35ecab85708b09a7958c81c5cb49664622be5eba602296547faa11713e8edc06')

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
