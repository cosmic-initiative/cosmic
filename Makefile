.PHONY: commit

build-docker:
	docker build . --tag starlane/starlane:latest
	docker push starlane/starlane:latest
  
clone:
	git clone git@github.com:mechtronium/starlane.git
	git clone git@github.com:mechtronium/mesh-portal.git
	git clone git@github.com:mechtronium/wasm-membrane.git
	git clone git@github.com:mechtronium/mechtron.git

status:
	cd starlane      && git status
	cd mesh-portal   && git status
	cd wasm-membrane && git status
	cd mechtron      && git status
	git status

pull:
	cd starlane && git pull
	cd mesh-portal && git pull
	cd wasm-membrane && git pull
	cd mechtron && git pull
	git pull

add:
	cd starlane          && git add .
	cd mesh-portal       && git add .
	cd wasm-membrane     && git add .
	cd mechtron          && git add .
	git add .

commit:
	cd starlane          && git commit -a -m "$(m)" || true
	cd mesh-portal       && git commit -a -m "$(m)" || true
	cd wasm-membrane     && git commit -a -m "$(m)" || true
	cd mechtron          && git commit -a -m "$(m)" || true
	git commit -a -m "$(m)" || true

push:
	cd starlane          && git push
	cd mesh-portal       && git push
	cd wasm-membrane     && git push
	cd mechtron          && git push
	git push

gather:
	mv $(PWD)/starlane/rust/starlane                 rust
	mv $(PWD)/starlane/rust/starlane-core            rust
	mv $(PWD)/mesh-portal/rust/mesh-portal           rust
	mv $(PWD)/mesh-portal/rust/mesh-portal-versions   rust
	mv $(PWD)/mesh-portal/rust/mesh-portal-api-client rust
	mv $(PWD)/mesh-portal/rust/mesh-portal-api-server rust
	mv $(PWD)/mesh-portal/rust/mesh-portal-tcp-common rust
	mv $(PWD)/mesh-portal/rust/mesh-portal-tcp-client rust
	mv $(PWD)/mesh-portal/rust/mesh-portal-tcp-server rust
	mv $(PWD)/mesh-portal/rust/cosmic-macros         rust
	mv $(PWD)/mesh-portal/rust/cosmic-nom            rust
	mv $(PWD)/mesh-portal/rust/cosmic-portal-cli     rust
	mv $(PWD)/mesh-portal/rust/mesh-artifact-api     rust
	mv $(PWD)/mesh-portal/rust/cosmic-portal-cli-exe rust
	mv $(PWD)/wasm-membrane/rust/wasm-membrane-host  rust
	mv $(PWD)/mechtron/rust/mechtron-common          rust

scatter:
	mv rust/starlane              starlane/rust
	mv rust/starlane-core         starlane/rust   
	mv rust/mesh-portal           mesh-portal/rust
	mv rust/mesh-portal-versions   mesh-portal/rust
	mv rust/mesh-portal-api-client mesh-portal/rust
	mv rust/mesh-portal-api-server mesh-portal/rust
	mv rust/mesh-portal-tcp-common mesh-portal/rust
	mv rust/mesh-portal-tcp-client mesh-portal/rust
	mv rust/mesh-portal-tcp-server mesh-portal/rust
	mv rust/cosmic-nom            mesh-portal/rust
	mv rust/cosmic-macros         mesh-portal/rust
	mv rust/cosmic-portal-cli     mesh-portal/rust
	mv rust/mesh-artifact-api     mesh-portal/rust
	mv rust/cosmic-portal-cli-exe mesh-portal/rust
	mv rust/wasm-membrane-host  wasm-membrane/rust
	mv rust/mechtron-common          mechtron/rust




create-links:
	ln -s $(PWD)/starlane/rust/starlane                 rust/starlane                  || true
	ln -s $(PWD)/starlane/rust/starlane-core            rust/starlane-core             || true
	ln -s $(PWD)/mesh-portal/rust/mesh-portal           rust/mesh-portal               || true
	ln -s $(PWD)/mesh-portal/rust/mesh-portal-versions   rust/mesh-portal-versions      || true
	ln -s $(PWD)/mesh-portal/rust/mesh-portal-api-client rust/mesh-portal-api-client   || true
	ln -s $(PWD)/mesh-portal/rust/mesh-portal-api-server rust/mesh-portal-api-server || true
	ln -s $(PWD)/mesh-portal/rust/mesh-portal-tcp-common rust/mesh-portal-tcp-common || true
	ln -s $(PWD)/mesh-portal/rust/mesh-portal-tcp-client rust/mesh-portal-tcp-client || true
	ln -s $(PWD)/mesh-portal/rust/mesh-portal-tcp-server rust/mesh-portal-tcp-server || true
	ln -s $(PWD)/mesh-portal/rust/cosmic-nom            rust/cosmic-nom                || true
	ln -s $(PWD)/mesh-portal/rust/cosmic-portal-cli     rust/cosmic-portal-cli         || true
	ln -s $(PWD)/mesh-portal/rust/mesh-artifact-api     rust/mesh-artifact-api         || true
	ln -s $(PWD)/mesh-portal/rust/cosmic-portal-cli-exe rust/cosmic-portal-cli-exe     || true
	ln -s $(PWD)/wasm-membrane/rust/wasm-membrane-host  rust/wasm-membrane-host        || true
	ln -s $(PWD)/mechtron/rust/mechtron-common          rust/mechtron-common           || true


rm-links:
	find mesh-portal -type l -exec rm {} \;
	find mechtron -type l -exec rm {} \;
	find starlane -type l -exec rm {} \;
	find wasm-membrane -type l -exec rm {} \;
	find . -type l -exec rm {} \;

links: rm-links create-links







