# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=opencv
pkgname=(opencv
         opencv-samples
         python-opencv)
pkgver=4.12.0
pkgrel=1
pkgdesc='Open Source Computer Vision Library'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0)
url='https://opencv.org/'
depends=(abseil-cpp
         cblas
         ffmpeg
         freetype2
         glib2
         gst-plugins-base
         gstreamer
         harfbuzz
         lapack
         libglvnd
         libjpeg-turbo
         libpng
         libtiff
         libwebp
         openexr
         openjpeg2
         protobuf
         zlib)
makedepends=(cmake
             eigen
             fmt
             git
             gstreamer-devel
             lapacke
	     linux-headers
             mesa
             nlohmann-json
             pugixml
             python-numpy
             python-setuptools
             qt6-5compat)
optdepends=('opencv-samples: samples'
            'vtk: for the viz module'
            'glew: for the viz module'
            'qt6-base: for the HighGUI module'
            'hdf5: for the HDF5 module'
            'opencl-icd-loader: For coding with OpenCL'
            'java-runtime: Java interface')
# 0001: Backport, https://github.com/opencv/opencv/pull/27192
#	fix CMake 4.0 compatibility
# 0002: Workaround, fix compatibility with Qt 6.9
#	https://github.com/opencv/opencv/issues/27223#issuecomment-2797750952
#	https://bugreports.qt.io/browse/QTBUG-134774
source=(opencv.tar.gz::https://github.com/opencv/opencv/archive/refs/tags/$pkgver.tar.gz
        opencv_contrib.tar.gz::https://github.com/opencv/opencv_contrib/archive/refs/tags/$pkgver.tar.gz
	0001-Fix-configuring-with-CMake-4.patch
	0002-workaround-qt-6-9-compatibility-prblem.patch)
sha256sums=('44c106d5bb47efec04e531fd93008b3fcd1d27138985c5baf4eafac0e1ec9e9d'
            '4197722b4c5ed42b476d42e29beb29a52b6b25c34ec7b4d589c3ae5145fee98e'
            'c9ac48cbcde10146af6fd9ca22d05091d5a3a35943a723bdcf4d30d51bfbf4a4'
            '6dfa9c685fe73587ec20c2c47740ad5df9184c7102b959da9d229269a09b2dee')
options=(!lto) # https://gitlab.archlinux.org/archlinux/packaging/packages/kdenlive/-/issues/8

prepare() {
  _patch_ $pkgname-$pkgver
}

build() {
  # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
  _opts="-DBUILD_SHARED_LIBS=ON \
         -DWITH_OPENCL=ON \
         -DWITH_OPENGL=ON \
         -DOpenGL_GL_PREFERENCE=LEGACY \
         -DCMAKE_CXX_STANDARD=17 \
         -DWITH_TBB=OFF \
         -DWITH_OPENJPEG=ON \
         -DWITH_VULKAN=ON \
         -DWITH_QT=ON \
         -DWITH_ZLIB_NG=OFF \
         -DWITH_JASPER=OFF \
         -DWITH_VTK=OFF \
         -DBUILD_TESTS=OFF \
         -DBUILD_PERF_TESTS=OFF \
         -DBUILD_EXAMPLES=ON \
         -DBUILD_PROTOBUF=OFF \
         -DBUILD_ZLIB=OFF \
         -DBUILD_JASPER=OFF \
         -DPROTOBUF_UPDATE_FILES=ON \
         -DINSTALL_C_EXAMPLES=ON \
         -DINSTALL_PYTHON_EXAMPLES=ON \
         -DCMAKE_INSTALL_PREFIX=/usr \
         -DCPU_BASELINE_DISABLE=SSE3 \
         -DOPENCV_EXTRA_MODULES_PATH=$srcdir/opencv_contrib-$pkgver/modules \
         -DOPENCV_SKIP_PYTHON_LOADER=ON \
         -DLAPACK_LIBRARIES=/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so \
         -DLAPACK_CBLAS_H=/usr/include/cblas.h \
         -DLAPACK_LAPACKE_H=/usr/include/lapacke.h \
         -DOPENCV_GENERATE_PKGCONFIG=ON \
         -DOPENCV_ENABLE_NONFREE=OFF \
         -DOPENCV_JNI_INSTALL_PATH=lib \
         -DOPENCV_GENERATE_SETUPVARS=OFF \
         -Dprotobuf_MODULE_COMPATIBLE=ON"
 
  cmake -B build -S $pkgname-$pkgver $_opts \
    -DBUILD_WITH_DEBUG_INFO=ON
  cmake --build build
}

package_opencv() {
  DESTDIR="$pkgdir" cmake --install build

  # separate samples package
  mv "$pkgdir"/usr/share/opencv4/samples "$srcdir"
  
  # Split Python bindings
  rm -r "$pkgdir"/usr/lib/python3*
}

package_opencv-samples() {
  pkgdesc+=' (samples)'
  depends=(opencv)
  unset optdepends

  mkdir -p "$pkgdir"/usr/share/opencv4
  mv samples "$pkgdir"/usr/share/opencv4
}

package_python-opencv() {
  pkgdesc='Python bindings for OpenCV'
  depends=(fmt
           jsoncpp
           opencv
           pugixml
           python-numpy
           qt6-base)

  unset optdepends
  DESTDIR="$pkgdir" cmake --install build/modules/python3
}
