# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.57.2
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('bb4f9f29addb3c6288c4449ad8c6b99d07a0223cd95448fd1eefda5772f08d3f')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
