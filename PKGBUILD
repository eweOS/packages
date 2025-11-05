# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.59
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('68ec540125e79788b3225afb2716bf6813d95f33072e4c0cf509fb44577a00af')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
