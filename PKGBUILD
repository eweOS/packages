# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.71
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('8c45f64a20e820eee8dde2a19ec440d9f857e6ab0170ea291babc39e348f3bbd')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
