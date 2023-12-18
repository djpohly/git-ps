MANS = git-ps.1

.PHONY: doc clean

doc: $(MANS)

clean:
	$(RM) $(MANS)

git-ps.1: README.rst
	rst2man $< > $@
