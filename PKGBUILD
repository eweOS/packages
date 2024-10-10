# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=python-fonttools
_pyname=${pkgname#python-}
pkgver=4.54.1
pkgrel=1
pkgdesc='A library to manipulate font files from Python'
url="https://github.com/fonttools/$_pyname"
license=(MIT)
arch=(x86_64 aarch64 riscv64)
depends=(python)
makedepends=(cython
             python-build
             python-installer
             python-setuptools
             python-wheel)
checkdepends=(python-brotli
             python-fs
             python-pytest
             python-ufolib2)
optdepends=('python-brotli: to compress/decompress WOFF 2.0 web fonts'
            'python-fs: to read/write UFO source files'
            'python-lxml: faster backend for XML files reading/writing'
            'python-lz4: for graphite type tables in ttLib/tables'
            'python-matplotlib: for visualizing DesignSpaceDocument and resulting VariationModel'
            'python-pyqt5: for drawing glyphs with Qt’s QPainterPath'
            'python-reportlab: to drawing glyphs as PNG images'
            'python-scipy: for finding wrong contour/component order between different masters'
            'python-sympy: for symbolic font statistics analysis'
            'python-uharfbuzz: to use the Harfbuzz Repacker for packing GSUB/GPOS tables'
            'python-unicodedata2: for displaying the Unicode character names when dumping the cmap table with ttx'
            'python-zopfli: faster backend fom WOFF 1.0 web fonts compression')
_archive="$_pyname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('026634b6c2602fe7f826c9f12017b775e9b92ef28035c4ba3e26316186a6c8d3')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	# Disable test that requires python-skia-pathops which to date is AUR only (and binary wheel only)
	PYTHONPATH=Lib pytest --deselect Tests/svgLib/path/path_test
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
