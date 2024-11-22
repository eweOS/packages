# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=binfmt-manager
_commit=e9712d901ca32aa6668fcce7f463b35b01882efc
pkgver=20240915.${_commit:0:7}
pkgrel=3
pkgdesc='A script to manage binfmt entries'
url='https://github.com/eweOS/binfmt-manager'
arch=(any)
license=(MIT)
depends=(bash)
makedepends=(git)
source=("git+https://github.com/eweOS/binfmt-manager#commit=$_commit"
	binfmt.service)
sha256sums=('a1c363636efcd0ce22cc56dd2f4f740fba45028763669ab8ba09a79c0dc71e01'
            'd1dba84f732dfd34f1823877c951e6d64e6d20eddd7aeb938a8d6fdebea832d1')

package() {
	_dinit_install_services_ binfmt.service

	cd "$pkgname"

	install -Dm755 binfmt-manager.sh "$pkgdir"/usr/bin/binfmt-manager
	_install_license_ LICENSE
}
