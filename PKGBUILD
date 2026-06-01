# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.64
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('b1bc657dcc993007c7079118ca22758cb1e0af0a7a8d100bd5d724e90df606a5')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
