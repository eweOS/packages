# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.74.1
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('97275362aab8b89eaff61f0b6a91020d4d30c4300b531d719e2f72f6c156e094')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
