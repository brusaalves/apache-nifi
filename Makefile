# docker events
ps:
	cd docker && docker-compose ps
build:
	cd docker && docker-compose build
logs:
	cd docker && docker-compose logs -f
up:
	cd docker && docker-compose up -d
down:
	cd docker && docker-compose down
restart:
	cd docker && docker-compose restart
bash:
	cd docker && docker-compose exec $(srv) bash

# nars
# link-nars:
# 	ln -s $(ls $(nars_locations) -d -1 "$PWD/"**/* | grep "\.nar") ./app/src/package/custom
# unlink-nars:
# 	rm $(find ./app/src/package/custom -type l)
