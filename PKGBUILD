# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-cattrs
_pipname=${pkgname#python-}
pkgver=25.3.0
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
sha256sums=('96da693caf59a1153f84079ec9eec5f918e2fedfc77365abd63e84242bbd9667')

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
