# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.58
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('3cabb21636178ecbaf6f89f49b988c3ee4ce9d9c3fe05c0a9a6691c99560a745')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
