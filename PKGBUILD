# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=vtk
pkgver=9.6.0
pkgrel=1
pkgdesc='Software for maniplutating and displaying scientific data'
url='https://vtk.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl llvm-libs python expat fmt freetype2 libjpeg jsoncpp lz4 xz
	 libogg openmp libpng proj pugixml onetbb libtheora libtiff libxml2 zlib-ng
	 verdict)
makedepends=(cmake fast_float nlohmann-json utf8cpp eigen linux-headers)
source=("https://vtk.org/files/release/9.6/VTK-$pkgver.tar.gz")
sha256sums=('d77d180694faafdc816578b9a53651f6790e799615811bfbb91018661a3bb8f2')

build() {
	# TODO:
	#	Devendoring libraries
	#	Build all modules
	#
	# HDF5 isn't devendered because VTK requires its parallelization to
	# be enabled.
	cmake -S VTK-"$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo		\
		-DCMAKE_INSTALL_PREFIX=/usr			\
		-DBUILD_SHARED_LIBS=ON				\
		-DVTK_RELOCATBLE_INSTALL=OFF			\
		-DVTK_ENABLE_REMOTE_MODULES=ON			\
		-DVTK_WRAP_JAVA=OFF				\
		-DVTK_WRAP_PYTHON=ON				\
		-DVTK_LEGACY_REMOVE=ON				\
		-DVTK_SMP_ENABLE_OPENMP=ON			\
		-DVTK_SMP_IMPLEMENTATION_TYPE=TBB		\
		-DVTK_QT_VERSION=6				\
		-DVTK_USE_X=OFF					\
		-DVTK_USE_MPI=OFF				\
		-DVTK_USE_TK=OFF				\
		-DVTK_VERSIONED_INSTALL=OFF			\
		-DVTK_USE_EXTERNAL=ON				\
		-DVTK_MODULE_USE_EXTERNAL_VTK_scn=OFF		\
		-DVTK_MODULE_USE_EXTERNAL_VTK_token=OFF		\
		-DVTK_MODULE_USE_EXTERNAL_VTK_exprtk=OFF	\
		-DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF		\
		-DVTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF		\
		-DVTK_MODULE_USE_EXTERNAL_VTK_vtkviskores=OFF	\
		-DVTK_MODULE_USE_EXTERNAL_VTK_cli11=OFF		\
		-DVTK_MODULE_USE_EXTERNAL_VTK_netcdf=OFF	\
		-DVTK_MODULE_USE_EXTERNAL_VTK_cgns=OFF		\
		-DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF	\
		-DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF		\
		-DVTK_MODULE_USE_EXTERNAL_VTK_hdf5=OFF

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# We'll have a libvtkx11.so installed, which is a stub when building
	# with -DVTK_USE_X=OFF.
	DESTDIR="$pkgdir" cmake --install build
}
