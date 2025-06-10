# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-immutables
_pyname=${pkgname#*-}
pkgver=0.21
pkgrel=1
pkgdesc='An implementation of immutable mapping type for Python'
url='https://github.com/MagicStack/immutables'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel
	     cython)
# Missing check dependencies: flake8 pycodestyle mypy
# checkdepends=(python-pytest)
source=("https://github.com/MagicStack/immutables/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('62976c052532f97625fb57ff71551737f49825e53b3374a6d9a7d5bf5d2a6066')

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
#	cd "$_pyname-$pkgver"
#	pytest -v
# }

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
	_install_license_ LICENSE LICENSE-APACHE
}
