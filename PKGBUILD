# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=24.1.2
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
#url='https://catt.rs'
url='https://github.com/python-attrs/cattrs'
license=(MIT)
depends=(python
         python-attrs)
makedepends=(python-build
             python-installer
             python-wheel
             python-hatch-vcs
             python-hatchling)
_archive="$_pipname"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('04d511cba794dce499c6122f2d7414ef858d1dcdf435cae563ab6966b48de08f')

prepare() {
	cd "$_archive"
	# Upstream test suite uses addopts to run benchmarks, drop them
	sed -i -e '/^addopts/d' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
