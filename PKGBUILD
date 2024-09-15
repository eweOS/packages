# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=binfmt-manager
_commit=e9712d901ca32aa6668fcce7f463b35b01882efc
pkgver=20240915.${_commit:0:7}
pkgrel=1
pkgdesc='A script to manage binfmt entries'
url='https://github.com/eweOS/binfmt-manager'
arch=(any)
license=(MIT)
depends=(bash)
source=("git+https://github.com/eweOS/binfmt-manager#commit=$_commit")
sha256sums=('a1c363636efcd0ce22cc56dd2f4f740fba45028763669ab8ba09a79c0dc71e01')

package() {
	cd "$pkgname"

	install -Dm755 binfmt-manager.sh "$pkgdir"/usr/bin/binfmt-manager
	_install_license_ LICENSE
}
