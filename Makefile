MANS = git-ps.1

.PHONY: doc clean

doc: $(MANS)

clean:
	$(RM) $(MANS)

%: %.rst
	rst2man $< > $@
