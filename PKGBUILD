# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-psutil
_pyname=${pkgname#*-}
pkgver=6.0.0
pkgrel=1
pkgdesc='Cross-platform lib for process and system monitoring in Python'
url='https://github.com/giampaolo/psutil'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel
	     linux-headers)
checkdepends=(python-pytest)
source=("https://github.com/giampaolo/psutil/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('187588c10ff4804b91e0c947d6b1a4006dbb633261c0f869865de518603c5d5e')

build () {
	cd $_pyname-release-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_pyname-release-$pkgver
	python -m installer --destdir $pkgdir dist/*.whl
}
