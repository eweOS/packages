# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=opencv
pkgname=(opencv
         opencv-samples
         python-opencv)
pkgver=5.0.0
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
source=(opencv.tar.gz::https://github.com/opencv/opencv/archive/refs/tags/$pkgver.tar.gz
        opencv_contrib.tar.gz::https://github.com/opencv/opencv_contrib/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('b0528f5a1d379d59d4701cb28c36e22214cc51cf64594e5b56f2d3e6c0233095'
            'c58f6344170c39abf187c56f3843b59cab1fd3e89cf19ba2ce25dc061659b27f')
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
