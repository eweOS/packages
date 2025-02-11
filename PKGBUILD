# Maintainer: Alif Nurcahyo <alifnc@proton.me>
pkgname='light'
pkgver='1.2.2'
pkgrel='1'
_commit='2a54078cbe3814105ee4f565f451b1b5947fbde0'
pkgdesc='A program to control backlights (and other hardware lights)'
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://gitlab.com/dpeukert/$pkgname"
license=('GPL-3.0-only')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz"
	'0001-fix-global-var.patch'
	'0002-update-manpage.patch'
)
sha512sums=('343bffdf7d007066fb82b4305fe961b70b74c206e0f8c1fb3d2d184a09fee9f02491a3fbe01515663a90ec40c20cf2a3dccb8a252597b907ab8ad0b6e33b5238'
            'e020deaca76f65a032f6f694f07b43af6318d46f52e0e16554a883d54c43c5519c7bbb3ecbc6e8f39d2828fbebe73d37aa82d4051b2cc652a1775286188b6ded' 
            '36cad74b303c206035dd6941269209278c0661358820444ce97b6ef383761e258ccf56d12c80590278972db0e1be98fae3632269cbababc49690726a61fc1708')

_sourcedirectory="$pkgname-$_commit"

prepare() {
	_patch_ "$_sourcedirectory"
}

build() {
	cd "$srcdir/$_sourcedirectory/"
	./autogen.sh
	./configure --prefix='/usr'
	make
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	make install DESTDIR="$pkgdir" PREFIX='/usr'
}
