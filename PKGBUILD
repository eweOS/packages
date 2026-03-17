# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=hdf5
pkgver=2.1.0
pkgrel=1
pkgdesc='HDF5 scientific data model implementation'
url='https://www.hdfgroup.org/solutions/hdf5/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl)
makedepends=(cmake perl flang)
provides=(libhdf5.so libhdf5_hl_f90cstub.so libhdf5_f90cstub.so
	  libhdf5_hl_fortran.so libhdf5_fortran.so libhdf5_tools.so)
source=("https://github.com/HDFGroup/hdf5/releases/download/$pkgver/hdf5.tar.gz")
sha256sums=('ce7f5515a95d588b8606c3fb50643f8b88ac52ffbbde9c63bb1edca6a256e964')

build() {
	# TODO: Enable OpenMPI
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DHDF5_BUILD_FORTRAN=ON			\
		-DHDF5_ONLY_SHARED_LIBS=ON		\
		-DBUILD_TESTING=ON			\

	cmake --build build
}

check() {
	ctest --test-dir build -j "$JOBS"
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
