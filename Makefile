clone_build:
	git clone --recurse-submodules https://github.com/tanner-andrulis/accelergy-timeloop-infrastructure.git
	# accelergy  accelergy-aladdin-plug-in  accelergy-cacti-plug-in  accelergy-table-based-plug-ins
	# Add https://github.com/tanner-andrulis/accelergy.git as a submodule
	cd accelergy-timeloop-infrastructure/src && rm -rf ../.git/modules/accelergy && rm -rf accelergy                      && git rm --cached accelergy                      && git submodule add --name accelergy https://github.com/tanner-andrulis/accelergy.git
	rm accelergy-timeloop-infrastructure/src/README/README.md
	touch accelergy-timeloop-infrastructure/src/README/README.md
	cd accelergy-timeloop-infrastructure/src/accelergy && git submodule update --init --recursive
	cd accelergy-timeloop-infrastructure/src && rm -rf ../.git/modules/accelergy-aladdin-plug-in && rm -rf accelergy-aladdin-plug-in           && git rm --cached accelergy-aladdin-plug-in      && git submodule add --name accelergy-aladdin-plug-in https://github.com/tanner-andrulis/accelergy-aladdin-plug-in.git
	cd accelergy-timeloop-infrastructure/src && rm -rf ../.git/modules/accelergy-cacti-plug-in && rm -rf accelergy-cacti-plug-in               && git rm --cached accelergy-cacti-plug-in        && git submodule add --name accelergy-cacti-plug-in https://github.com/tanner-andrulis/accelergy-cacti-plug-in.git
	cd accelergy-timeloop-infrastructure/src && rm -rf ../.git/modules/accelergy-table-based-plug-ins && rm -rf accelergy-table-based-plug-ins && git rm --cached accelergy-table-based-plug-ins && git submodule add --name accelergy-table-based-plug-ins https://github.com/tanner-andrulis/accelergy-table-based-plug-ins.git
	cd accelergy-timeloop-infrastructure/src && rm -rf ../.git/modules/timeloop && rm -rf timeloop                                             && git rm --cached timeloop                       && git submodule add --name timeloop https://github.com/tanner-andrulis/timeloop.git
	cp Makefile-infrastructure accelergy-timeloop-infrastructure/Makefile
	make build

clone_build_check_backwards_compatibility:
	git clone --recurse-submodules https://github.com/tanner-andrulis/accelergy-timeloop-infrastructure.git
	# accelergy  accelergy-aladdin-plug-in  accelergy-cacti-plug-in  accelergy-table-based-plug-ins
	# Add https://github.com/tanner-andrulis/accelergy.git as a submodule
	cd accelergy-timeloop-infrastructure/src && rm -rf accelergy                      && git rm --cached accelergy                      && git submodule add --name accelergy https://github.com/tanner-andrulis/accelergy.git
	cd accelergy-timeloop-infrastructure/src/accelergy && git submodule update --init --recursive
	rm accelergy-timeloop-infrastructure/src/README/README.md
	touch accelergy-timeloop-infrastructure/src/README/README.md
	cp Makefile-infrastructure accelergy-timeloop-infrastructure/Makefile
	make build

clean:
	rm -rf accelergy-timeloop-infrastructure

clean_docker_images:
	docker rmi -f $(docker images -f "dangling=true" -q)
	docker volume rm $(docker volume ls -q)
	docker rm -f $(docker ps -a -q)

build:
	cd accelergy-timeloop-infrastructure && make build
