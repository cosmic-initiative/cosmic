FROM rust

RUN cargo install mdbook

RUN mkdir -p /docs/src
RUN mkdir -p /docs/target

COPY docs /docs/src

WORKDIR /docs/src

RUN mdbook build . 


FROM nginx
RUN mkdir -p /usr/share/nginx/html/docs
COPY html/ /usr/share/nginx/html
COPY --from=0 /docs/target /usr/share/nginx/html/docs
