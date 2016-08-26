PYTHON ?= python

build:
	$(PYTHON) setup.py build

clean:
	$(PYTHON) setup.py clean
	rm -rf build

pypi: clean
	# files generated by swig
	rm -f smartcard/scard/scard.py
	rm -f smartcard/scard/scard_wrap.c
	# files generated by sphinx
	rm -rf smartcard/doc/_build
	$(PYTHON) setup.py sdist upload

test: build
	$(PYTHON) setup.py test

ChangeLog.git:
	git log --stat --decorate=short > $@

.PHONY: clean build pypi test