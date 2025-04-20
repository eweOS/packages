# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=python-rpds-py
_pyname=rpds
pkgver=0.24.0
pkgrel=1
pkgdesc='Python bindings to the Rust rpds crate for persistent data structures'
url='https://rpds.readthedocs.io/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl llvm-libs python)
makedepends=(python-build python-installer python-setuptools
	     python-maturin)
checkdepends=(python-pytest)
source=("https://github.com/crate-py/rpds/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b925b62d9779a4ec71659a12344469033c353fe9da00ca3fb44f197839de5656')

prepare() {
	cd "$_pyname-$pkgver"
	# Remove --target argument temporarily
	# https://github.com/PyO3/maturin/issues/2561
	cargo fetch --locked # --target "$RUSTHOST"
}

build() {
	cd "$_pyname-$pkgver"
	python -m build --wheel --no-isolation \
		-C"build-args=--frozen --profile=release --all-features --target $RUSTHOST"
}

check() {
	cd "$_pyname-$pkgver"

	python -m venv testenv --system-site-packages
	testenv/bin/python -m installer dist/*.whl
	testenv/bin/python -m pytest -vv
}

package() {
	cd "$_pyname-$pkgver"
	python -m installer --destdir "$pkgdir" target/wheels/*.whl
	_install_license_ LICENSE
}
