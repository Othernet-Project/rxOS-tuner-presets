.PHONY: all clean update

VERSION = 2.0a1
OVERLAY_NAME = presets
OVERLAY_FILE = overlay-$(OVERLAY_NAME)-$(VERSION).sqfs
INPUT := overlay
LIBRARIAN_REPO = https://github.com/Outernet-Project/librarian.git
LIBRARIAN_BRANCH = develop

all: $(OVERLAY_FILE)

clean:
	-rm *.sqfs

$(OVERLAY_FILE): $(INPUT)
	mksquashfs $< $@ -root-owned -comp lz4

update: $(INPUT) librarian
	cd librarian; git fetch; git checkout $(LIBRARIAN_BRANCH); git pull
	install -Dm755 librarian/librarian/data/tuner_presets.py \
		$</usr/lib/python2.7/site-packages/librarian/data/tuner_presets.py

librarian:
	git clone -b $(LIBRARIAN_BRANCH) $(LIBRARIAN_REPO)
