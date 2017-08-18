FILES= \
ch01/01/ \
ch01/02/ \
ch01/03/ \
ch01/04/ \
ch01/05/ \
ch01/06/ \
ch01/07/ \
ch01/08/test.go \
ch01/09/


.PHONY: $(FILES)

initialize: $(FILES)

$(FILES):
	go run ./bin/initialize.go -- $@