# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=2048-cpp
_pkgname=2048.cpp
pkgver=374
pkgrel=1
license=('MIT')
arch=('x86_64')
url="https://github.com/plibither8/2048.cpp"
depends=('llvm-libs')
makedepends=('cmake')
git_commit='30597b11aa4b3b68862173b46cf57e0eda20204d'
source=("https://github.com/plibither8/2048.cpp/archive/${git_commit}.zip")
sha512sums=('SKIP')

build() {
	cd $_pkgname-$git_commit
	cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr
	cmake --build .
}

check() {
	cd $_pkgname-$git_commit
	ctest .
}

package() {
	cd $_pkgname-$git_commit
	make DESTDIR=$pkgdir install
	rm -r $pkgdir/usr/data
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
