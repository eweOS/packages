# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.74
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('7d8269fb4558659a7d86475b0f4ba54425fc9ed24be50a8024efdbea8df86a2e')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
