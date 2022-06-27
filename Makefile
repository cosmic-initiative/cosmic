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
	mv $(PWD)/starlane/rust/starlane                    rust || true
	mv $(PWD)/starlane/rust/starlane-core               rust || true
	mv $(PWD)/mesh-portal/rust/mesh-portal              rust || true
	mv $(PWD)/mesh-portal/rust/mesh-portal-versions     rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-macros            rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-macros-primitive  rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-nom               rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-portal-cli        rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-lanes             rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-lanes-quic        rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-locality          rust || true
	mv $(PWD)/mesh-portal/rust/mesh-artifact-api        rust || true
	mv $(PWD)/mesh-portal/rust/cosmic-core              rust || true
	mv $(PWD)/wasm-membrane/rust/wasm-membrane-host     rust || true
	mv $(PWD)/mechtron/rust/mechtron-common             rust || true

scatter:
	mv rust/starlane                        starlane/rust || true
	mv rust/starlane-core                   starlane/rust    || true
	mv rust/mesh-portal                     mesh-portal/rust || true
	mv rust/mesh-portal-versions            mesh-portal/rust || true
	mv rust/cosmic-nom                      mesh-portal/rust || true
	mv rust/cosmic-macros                   mesh-portal/rust || true
	mv rust/cosmic-macros-primitive         mesh-portal/rust || true
	mv rust/cosmic-portal-cli               mesh-portal/rust || true
	mv rust/cosmic-lanes                    mesh-portal/rust || true
	mv rust/cosmic-core                     mesh-portal/rust || true
	mv rust/cosmic-lanes-quic               mesh-portal/rust || true
	mv rust/cosmic-locality                 mesh-portal/rust || true
	mv rust/mesh-artifact-api               mesh-portal/rust || true
	mv rust/wasm-membrane-host              wasm-membrane/rust || true
	mv rust/mechtron-common                 mechtron/rust    || true





