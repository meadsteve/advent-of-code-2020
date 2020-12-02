.PHONY: test test_spec test_ameba test_formatting format

test_spec:
	crystal spec

test_ameba:
	crystal bin/ameba.cr

test_formatting:
	crystal tool format --check

test: test_spec test_ameba test_formatting

format:
	crystal tool format
