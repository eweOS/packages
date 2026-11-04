# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.72
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('a729097593b26cd82368e43bacad46b2e6bb86266613a2ec9e8c605190ac2f51')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
