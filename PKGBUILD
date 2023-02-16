pkgname=btop
pkgver=1.2.13
pkgrel=1
pkgdesc='A monitor of system resources, bpytop ported to C++'
arch=(x86_64 aarch64)
url="https://github.com/aristocratos/$pkgname"
license=(Apache)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz" "fix-llvm15-build.patch")
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd $pkgname-$pkgver
	patch -p1 < $srcdir/fix-llvm15-build.patch
}

build() {
	make -C $pkgname-$pkgver CXXFLAGS+="-fexperimental-library" OPTFLAGS= all
}

package() {
	make -C $pkgname-$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
