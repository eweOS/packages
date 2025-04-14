# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=24.1.3
pkgrel=1
pkgdesc='Complex custom class converters for attrs'
arch=(any)
#url='https://catt.rs'
url='https://github.com/python-attrs/cattrs'
license=(MIT)
depends=(python
         python-attrs)
makedepends=(git
	     python-build
             python-installer
             python-wheel
             python-hatch-vcs
             python-hatchling)
_archive="$_pipname"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('3fa057aebe40824d1491ad79d75b494da65d817548d3a1e01c0e994b0411ab40')

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
