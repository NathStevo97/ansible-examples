.ONESHELL: # Applies to every targets in the file!

cluster-up:
	cd ./setup
	@docker-compose -f docker-compose.yaml up -d --build
	@/bin/bash ./setup.sh
	cd ..

cluster-down:
	cd ./setup
	@docker-compose -f docker-compose.yaml down
	cd ..