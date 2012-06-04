BINPATH="/usr/local/bin/belief-maching/"

all: clean create-db install

install:
	mkdir -p $(BINPATH)
	cp ./bin/*.py $(BINPATH)
	cp ./bin/*.sqlite $(BINPATH)
	cp ./bin/static/ $(BINPATH)
	cp ./bin/templates/belief-matching /etc/init.d/
	chmod a+x /etc/init.d/belief-matching

create-db:
	cat ./sql/create-sqlite-de.sql               | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/liberale_quaker.konfession.sql     | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/konservative_quaker.konfession.sql | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/zeugen_jehovas.konfession.sql      | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/mennoniten.konfession.sql          | sqlite3 ./bin/belief-matching.sqlite

uninstall:
	$(RM) -R $(BINPATH)
	$(RM) /etc/init.d/belief-matching

clean:
	$(RM) ./bin/*~
	$(RM) ./bin/*.pyc
	$(RM) ./bin/*.sqlite3