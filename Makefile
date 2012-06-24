BINPATH="/usr/local/bin/belief-maching/"

all: clean create-db

install:
	mkdir -p                               $(BINPATH)
	cp ./bin/*.py                          $(BINPATH)
	cp ./bin/*.sqlite                      $(BINPATH)
	mkdir                                  $(BINPATH)static/
	cp ./bin/static/home.css               $(BINPATH)static/
	cp ./bin/static/01_create_account.png  $(BINPATH)static/
	cp ./bin/static/02_fork_project.png    $(BINPATH)static/
	cp ./bin/static/04_edit_file.png       $(BINPATH)static/
	cp ./bin/static/05_pull_request.png    $(BINPATH)static/
	cp ./bin/static/favicon.ico            $(BINPATH)static/
	cp ./bin/static/favicon.ico            $(BINPATH)
	cp ./bin/static/favicon.ppm            $(BINPATH)static/
	cp ./bin/static/*.css                  $(BINPATH)static/
	cp ./templates/belief-matching    /etc/init.d/belief-matching
	chmod a+x /etc/init.d/belief-matching

create-db:
	cat ./sql/create-sqlite-de.sql                  | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/evangelikale_gemeinden.konfession.sql | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/evangelisch-lutherisch.konfession.sql | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/kirche_jesu_christi_der_heiligen_der_letzten_tage.konfession.sql \
                                                        | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/konservative_quaker.konfession.sql    | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/liberale_quaker.konfession.sql        | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/mennoniten.konfession.sql             | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/orthodoxe_kirche.konfession.sql       | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/reformierte_kirche.konfession.sql     | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/roemisch-katholische.konfession.sql   | sqlite3 ./bin/belief-matching.sqlite
	cat ./sql/zeugen_jehovas.konfession.sql         | sqlite3 ./bin/belief-matching.sqlite


uninstall:
	$(RM) -R $(BINPATH)
	$(RM) /etc/init.d/belief-matching

clean:
	$(RM) ./bin/*~
	$(RM) ./bin/*.pyc
	$(RM) ./bin/*.sqlite

update: 
	make clean
	make create-db
	git log -n 1 --date=short | grep Date | cut -d :  -f 2
	/etc/init.d/belief-matching stop
	make uninstall
	make install
	/etc/init.d/belief-matching start
	echo "...update process is ready now."
