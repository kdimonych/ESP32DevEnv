FROM espressif/idf

WORKDIR /project

ENV HOME=/tmp

RUN apt update && \
  apt install -y cmake g++ libgtest-dev && \
  cd /usr/src/gtest && \
  cmake . && \
  make && \
  cp lib/*.a /usr/lib && \
  apt update && apt install -y libgmock-dev gdb telnet

RUN echo 'source $IDF_PATH/export.sh' > /etc/profile.d/esp-idf.sh
