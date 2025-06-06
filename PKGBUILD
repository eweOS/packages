# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=25.1.1
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
sha256sums=('6121b044c48ef11a49a699af9d8ed086f961e62ce17dc8d140dd3da5fdc00780')

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
