FROM ocaml/opam:debian-ocaml-4.14

RUN git clone https://github.com/WebAssembly/spec.git -b 'wasm-3.0'

RUN opam install dune menhir

RUN eval $(opam env) && \
    cd spec/interpreter && \
    make && \
    make install

ENV PATH $PATH:$HOME/spec/interpreter
