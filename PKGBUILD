# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=maturin
pkgname=(maturin python-maturin)
pkgver=1.14.1
pkgrel=1
pkgdesc='Tool for building and publishing Rust crates as Python packages'
url='https://www.maturin.rs/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('Apache-2.0 OR MIT')
makedepends=(python-build python-installer python-setuptools python-wheel
	     python-setuptools-rust
	     rust
	     xz)
source=("https://github.com/PyO3/maturin/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('435f8d5b267e52588fe699cab97a8234e3d98977a9f9e6efe873e04f7f85f92c')

prepare() {
	cd "$pkgbase-$pkgver"
	cargo fetch --locked --target "$RUSTHOST"
}

build() {
	cd "$pkgbase-$pkgver"

	check_option lto y && export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-flto"

	MATURIN_SETUP_ARGS="--frozen --all-features" \
		python -m build --wheel --no-isolation

	python -m installer --destdir "$srcdir"/fakeinstall dist/*.whl

	cd "$srcdir"/fakeinstall
	# Program
	_pick_ maturin usr/bin/maturin
	# Python binding
	_pick_ python-maturin usr/lib/python*/site-packages

	cd "$srcdir"
	# Make sure all files are picked
	find fakeinstall -depth -print0 | xargs -0 rmdir
}

package_maturin() {
	depends=(musl llvm-libs openssl rust xz)
	mv "$srcdir"/pkgs/$pkgname/* "$pkgdir"

	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
		"$srcdir/$pkgbase-$pkgver"/license-{apache,mit}
}

package_python-maturin() {
	pkgdesc+=" (Python binding)"
	depends=(python "maturin=$pkgver-$pkgrel" python-tomli)
	arch=(any)

	mv "$srcdir"/pkgs/$pkgname/* "$pkgdir"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
		"$srcdir/$pkgbase-$pkgver"/license-{apache,mit}
}
