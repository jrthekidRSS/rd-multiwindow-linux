FROM registry.gitlab.steamos.cloud/steamrt/sniper/sdk:latest

RUN apt-get update && apt-get install libxcb1-dev libglew-dev -y

WORKDIR /tmp
RUN wget "https://download.qt.io/official_releases/qt/6.10/6.10.1/submodules/qtbase-everywhere-src-6.10.1.tar.xz"
RUN tar xf qtbase-everywhere-src-6.10.1.tar.xz
RUN rm -f qtbase-everywhere-src-6.10.1.tar.xz
RUN mkdir -p /qt

WORKDIR /qt
RUN /tmp/qtbase-everywhere-src-6.10.1/configure -qt-zlib -no-libjpeg -no-libpng -no-freetype -system-pcre -no-harfbuzz -no-glib -no-ssl -no-openssl -no-cups -no-gtk -no-opengl -no-gif -no-ico -no-accessibility -no-feature-icu -no-feature-printer -no-feature-sql -no-feature-xml -no-feature-network -no-feature-cups -no-feature-http -no-feature-printsupport -no-feature-printpreviewdialog -no-feature-printpreviewwidget -no-feature-itemmodeltester -no-feature-batch_test_support -no-feature-private_tests -no-feature-concurrent
RUN cmake --build . --parallel
RUN cmake --install .
RUN rm -rf /tmp/qtbase-everywhere-src-6.10.1
RUN rm -rf /qt

USER 1000:1000

CMD [ "/bin/bash" ]
