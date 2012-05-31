BINPATH="/usr/local/bin/belief-maching/"


instal: clean
	mkdir -p $(BINPATH)
	$(cp) ./bin/*.py $(BINPATH)
	$(cp) ./bin/static/ $(BINPATH)
	cat ./sql/create-sqlite-de.sql | sqlite3 $(BINPATH)belief-matching.sqlite3
	cat ./sql/liberale_quaker.konfession.sqlite | sqlite3 $(BINPATH)belief-matching.sqlite3
	cat ./sql/konservative_quaker.konfession.sql | sqlite3 $(BINPATH)belief-matching.sqlite3
	$(CP) ./bin/templates/belief-matching /etc/init.d/
	chmod a+x /etc/init.d/belief-matching

uninstall:
	$(RM) -R $(BINPATH)
	$(RM) /etc/init.d/belief-matching

clean:
	$(RM) ./bin/*~
	$(RM) ./bin/*.pyc