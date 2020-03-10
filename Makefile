MYDIR = ./sops/dev
list: $(MYDIR)/secrets*.yaml
	for file in $^ ; do \
			echo $${file} ; \
			NAME= $(dirname ${file}) ;
			echo $$(basename $${file}) ; \
	done