# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=nextpnr
pkgver=0.8
pkgrel=1
_testcommit=aea0b4bac59e07e0c5088a0966af73abdd8ab217
pkgdesc='Portable FPGA place and route tool'
url='https://github.com/YosysHQ/nextpnr'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(ISC)
depends=(musl llvm-libs prjtrellis python boost-libs tcl)
makedepends=(cmake boost eigen linux-headers)
source=("git+https://github.com/YosysHQ/nextpnr.git#tag=nextpnr-$pkgver"
	"git+https://github.com/YosysHQ/nextpnr-tests#commit=$_testcommit")
sha256sums=('e2d943c025e1dac2d9dbb5bf4eeeb9b6ed47c93940fa4055fe72ccb2b5ab29b0'
            '11cbfbb1add2d88ed386123e203f768a6e935b9195e336a9eb11c7605e1c4783')

prepare() {
	cd "$pkgname"

	git config submodule.tests.path "$srcdir"/nextpnr-tests
	git -c protocol.file.allow=always submodule update --init --recursive tests
}

build() {
	# TODO: Missing TK for GUI
	# TODO: Only ECP5 support with prjtrellis is enabled
	cmake -S "$pkgname" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_GUI=OFF				\
		-DBUILD_PYTHON=ON			\
		-DBUILD_RUST=OFF			\
		-DSTATIC_BUILD=OFF			\
		-DARCH=ecp5

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname"/COPYING
}
