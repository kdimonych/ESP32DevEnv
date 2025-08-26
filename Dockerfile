FROM espressif/idf

WORKDIR /project

ENV HOME=/tmp

RUN apt update && \
  apt install -y cmake g++ && \
  apt update && apt install -y gdb telnet expect clang-format

RUN echo 'source $IDF_PATH/export.sh' > /etc/profile.d/esp-idf.sh
