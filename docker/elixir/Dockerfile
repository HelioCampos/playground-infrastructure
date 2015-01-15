FROM centos

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8  

RUN localedef --no-archive -i en_US -f UTF-8 en_US.UTF-8
RUN yum install -y git tar wget gcc glibc-devel make ncurses-devel openssl-devel autoconf
RUN wget https://packages.erlang-solutions.com/erlang/esl-erlang-src/otp_src_17.0.tar.gz --no-check-certificate
RUN tar zxvf otp_src_17.0.tar.gz
RUN cd otp_src_17.0 && ./configure && make && make install
RUN git clone https://github.com/elixir-lang/elixir.git
RUN cd elixir && make clean && make test

EXPOSE 80 443