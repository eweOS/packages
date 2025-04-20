# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=repo
pkgver=2.53
pkgrel=1
pkgdesc='A tool built on top of Git to manage many repositories'
url='https://android.googlesource.com/tools/repo'
arch=(any)
license=(Apache-2.0)
depends=(python git)
source=("git+https://android.googlesource.com/tools/repo#tag=v$pkgver")
sha256sums=('120343e8b99b824f1dec4f71e271ee0c55d6ff71ee04fd4f9a9a0aded8ccdaf0')

package() {
	cd "$pkgname"
	install -Dm755 repo "$pkgdir"/usr/bin/repo
	_install_license_ LICENSE
}
