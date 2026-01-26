# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.61
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('a8b7431895de3c2417a30252a27a0342be8e90f2403d93bb28d51f232c5a738a')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
