FROM ocaml/opam:debian-ocaml-4.12

RUN git clone https://github.com/WebAssembly/spec.git -b 'wasm-3.0+exn'

RUN opam install dune menhir

RUN eval $(opam env) && \
    cd spec/interpreter && \
    make && \
    make install

ENV PATH $PATH:$HOME/spec/interpreter
