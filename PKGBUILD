# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=glaze
pkgver=7.4.0
pkgrel=2
pkgdesc='An Extremely fast, In-Memory JSON and Interface Library for Modern C++'
arch=(any)
url="https://github.com/stephenberry/$pkgname"
license=(MIT)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e7592590187dd56f16558a08b36e90bf349e885330f3a3961048df302cc9dfa1')

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
