.PHONY: commit

build-docker:
	docker build . --tag starlane/starlane:latest
	docker push starlane/starlane:latest
  
clone:
	git clone git@github.com:mechtronium/starlane.git
	git clone git@github.com:mechtronium/mesh-portal.git
	git clone git@github.com:mechtronium/wasm-membrane.git
	git clone git@github.com:mechtronium/mechtron.git

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








