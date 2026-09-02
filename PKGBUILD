# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glaze
pkgver=8.3.0
pkgrel=1
pkgdesc='An Extremely fast, In-Memory JSON and Interface Library for Modern C++'
arch=(any)
url="https://github.com/stephenberry/$pkgname"
license=(MIT)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('6a8f97f5cdb8df5c87f1b32710679585f3f1a577b67bb66150f2516072e00317')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_TESTING=OFF \
		-D CMAKE_BUILD_TYPE=Release \
        -D glaze_ENABLE_FUZZING=OFF
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
