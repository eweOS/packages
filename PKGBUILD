# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.65
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('be6382e1dc1a4c3fbf4da61bb3c7b423a1aed3c1d2047f5162498097eb43fe26')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
