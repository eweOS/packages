# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=expect
pkgver=5.45.4
pkgrel=1
pkgdesc='A tool for automating interactive applications'
url='https://www.nist.gov/services-resources/software/expect'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(custom)
depends=(musl tcl)
source=("https://sourceforge.net/projects/expect/files/Expect/$pkgver/expect$pkgver.tar.gz"
	"0001-fix-main-prototype-in-configure-in.patch"
	"0002-add-missing-declarations.patch")
sha256sums=('49a7da83b0bdd9f46d04a04deec19c7767bb9a323e40c4781f89caf760b92c34'
            'ad1bc2fcd0bd0ecf06d1ab0639fc12eef42440dbe906bd660e993cad32ea7757'
            'badad3da1c08f828f9132b00324ee24e97c6804d1600226980d47a4aca9aa418')
_dir="$pkgname$pkgver"

prepare() {
	_patch_ "$_dir"
	cd "$_dir"
	autoreconf -fiv
}

build() {
	cd "$_dir"
	./configure --prefix=/usr
	make
}

check() {
	cd "$_dir"
	make test
}

package() {
	cd "$_dir"
	make install DESTDIR="$pkgdir"

	# Path conflicts with busybox
	cd "$pkgdir/usr/bin"
	mv mkpasswd expect-mkpasswd
	cd "$pkgdir/usr/share/man/man1"
	mv mkpasswd.1 expect-mkpasswd
}
