FILES= \
ch01/01/ \
ch01/02/ \
ch01/03/ \
ch01/04/ \
ch02/01/ \
ch02/02/ \
ch02/03/ \
ch02/04/ \
ch02/05/ \
ch02/06/ \
ch02/07/ \
ch02/08/ \
ch02/09/ \
ch03/01/ \
ch03/02/ \
ch03/03/ \
ch03/04/ \
ch03/05/ \
ch03/06/ \
ch03/07/ \
ch03/08/ \
ch03/09/ \
ch04/01/ \
ch04/02/ \
ch04/03/ \
ch04/04/ \
ch04/05/ \
ch05/01/ \
ch05/02/ \
ch05/03/ \
ch05/04/ \
ch06/01/ \
ch06/02/ \
ch06/03/ \
ch06/04/ \


.PHONY: $(FILES)

initialize: $(FILES)

$(FILES):
	go run ./bin/initialize.go -- $@