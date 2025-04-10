LATEST_GEM = $(shell ls -l rubicons-*.gem | awk '{print $$NF}' | tail -n 1)

gem:
	@echo "Building gem $(LATEST_GEM)"
	@gem build rubicons.gemspec
	@echo "Run 'gem install $(LATEST_GEM)' to install the latest gem"
	@gem install $(LATEST_GEM)
	@echo "Installed $(LATEST_GEM)"
	@echo "Pushing $(LATEST_GEM) to rubygems.org"
	@gem push $(LATEST_GEM)
	@echo "Pushed $(LATEST_GEM) to rubygems.org"

count_icons:
	@find icons -mindepth 1 -maxdepth 1 -type d | xargs -I{} bash -c 'echo -n "{}: "; find {} -type f -name "*.svg" | wc -l'

sample_icons:
	@find icons -type d -mindepth 1 -maxdepth 1 | sort | while read dir; do \
		echo "$$(basename $$dir):"; \
		ls "$$dir" | sort | head -5; \
		echo; \
	done