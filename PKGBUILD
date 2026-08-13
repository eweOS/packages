# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=yosys
pkgver=0.68
_symfpu_commit=5d5e50867437
pkgrel=1
pkgdesc='An open framework for RTL synthesis tools'
url='https://yosyshq.net/yosys/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(ISC)
depends=(musl llvm-libs abc tcl readline slang zlib-ng)
makedepends=(cmake cxxopts git googletest python)
checkdepends=(iverilog)
# 0001: Downstream, use system cxxopts to avoid fetching a submodule
source=("git+https://github.com/YosysHQ/yosys.git#tag=v$pkgver"
	"git+https://github.com/YosysHQ/symfpu.git#commit=$_symfpu_commit"
	"0001-Use-system-cxxopts.patch")
sha256sums=('a5ac2cf10265bcb13dc177537a1a943312cac1a7d3d24ae881207d7a8e1c47fe'
            '028744806529ba94a76509979f1bd1781e36881c1abe3550f9358d743cf1b700'
            '6491ba9eb99eedc601af3236308ae239488fd25f1416e85a6ab51d88098a7937')

prepare() {
	_patch_ yosys

	cd yosys
	git config submodule.symfpu.url "$srcdir"/symfpu
	git -c protocol.file.allow=always submodule update --init libs/symfpu
}

build() {
	# TODO:
	#  - Enable Python integration, which requires Pybind11
	#  - Devendor and enable Slang
	#  - Devendor and enable symfpu, yosys uses their fork
	cmake -S yosys -B build \
		-DCMAKE_BUILD_TYPE=Release		\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DBUILD_SHARED_LIBS=ON			\
		-DYOSYS_USE_BUNDLED_LIBS=OFF		\
		-DYOSYS_ABC_EXECUTABLE="/usr/bin/abc"	\
		-DYOSYS_ENABLE_FUNCTIONAL_TESTS=ON	\
		-DYOSYS_COMPONENTS="everything"		\
		-DYOSYS_DISABLE_THREADS=OFF		\
		-DYOSYS_WITHOUT_ABC=OFF			\
		-DYOSYS_WITHOUT_ZLIB=OFF		\
		-DYOSYS_WITHOUT_LIBFFI=OFF		\
		-DYOSYS_WITHOUT_READLINE=OFF		\
		-DYOSYS_WITHOUT_EDITLINE=ON		\
		-DYOSYS_WITHOUT_SLANG=ON		\
		-DYOSYS_WITHOUT_TCL=OFF			\
		-DYOSYS_WITH_PYTHON=OFF			\
		-DYOSYS_INSTALL_DRIVER=ON		\
		-DYOSYS_INSTALL_LIBRARY=ON

	cmake --build build
}

# Multiple tests fail.
check() {
	ctest --test-dir build -j"$JOBS"
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
