# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgbase=opencv
pkgname=(opencv
         opencv-samples
         python-opencv)
pkgver=4.10.0
pkgrel=1
pkgdesc='Open Source Computer Vision Library'
arch=(x86_64 aarch64 riscv64)
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
sha256sums=('b2171af5be6b26f7a06b1229948bbb2bdaa74fcf5cd097e0af6378fce50a6eb9'
            '65597f8fb8dc2b876c1b45b928bbcc5f772ddbaf97539bf1b737623d0604cba1')
options=(!lto) # https://gitlab.archlinux.org/archlinux/packaging/packages/kdenlive/-/issues/8

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
