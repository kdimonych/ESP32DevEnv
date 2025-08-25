FROM espressif/idf

WORKDIR /project

ENV HOME=/tmp

RUN apt update && \
  apt install -y cmake g++ libgtest-dev libgmock-dev && \
  cd /usr/src/gtest && \
  cmake . && \
  make && \
  cp lib/*.a /usr/lib && \
  cp -r include/gtest /usr/include/gtest && \
  apt update && apt install -y gdb telnet expect clang-format

RUN echo 'source $IDF_PATH/export.sh' > /etc/profile.d/esp-idf.sh
