FROM ubuntu:16.04
MAINTAINER Jake Mitchell <jmitchell@member.fsf.org>
ENV USER root
ENV HOME /root
ENV RUST_VERSION 1.10.0
ENV RUST_SRC_PATH /usr/local/src/rustc-${RUST_VERSION}/src

RUN apt-get update
RUN apt-get install -y curl \
                       file \
                       git \
                       emacs \
                       gcc \
                       g++

# Install Rust (stable) and Cargo
RUN curl -sSf https://static.rust-lang.org/rustup.sh -o /tmp/rustup.sh
RUN sh /tmp/rustup.sh --revision=${RUST_VERSION} --disable-sudo -y
RUN echo "export PATH=$HOME/.cargo/bin:$PATH" >> ${HOME}/.bashrc

# Download corresponding Rust source
WORKDIR /usr/local/src
RUN curl -sSf https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.gz -o rust-src.tar.gz
RUN tar xzf rust-src.tar.gz
RUN bash -c "if [[ ! -d $RUST_SRC_PATH ]]; then \
               echo '$RUST_SRC_PATH missing!'; \
               false; \
             fi"
WORKDIR ${HOME}

# Install Racer for Rust autocompletion
RUN cargo install racer

# Install rustfmt to reformat Rust code
RUN cargo install rustfmt

# Install emacs configuration
COPY emacs.d ${HOME}/.emacs.d
RUN emacs --batch -l ${HOME}/.emacs.d/init.el

# Install gitconfig
COPY gitconfig ${HOME}/.gitconfig

# Enable 256 ANSI colors for Emacs
ENV TERM xterm-256color
