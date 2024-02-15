FROM ocaml/opam:debian-ocaml-4.12

RUN git clone https://github.com/WebAssembly/gc.git

RUN opam install dune menhir

RUN eval $(opam env) && \
    cd gc/interpreter && \
    make && \
    make install

ENV PATH $PATH:$HOME/gc/interpreter
