all: gem push

gem:
	@echo "Building gem..."
	@gem build rubicons.gemspec
	@echo "Run 'gem install $(shell ls -l rubicons-*.gem | awk '{print $$NF}' | tail -n 1)' to install the latest gem"
	@gem install $(shell ls -l rubicons-*.gem | awk '{print $$NF}' | tail -n 1)
	@echo "Installed $(shell ls -l rubicons-*.gem | awk '{print $$NF}' | tail -n 1)"

push:
	@echo "Pushing $(shell ls -l rubicons-*.gem | awk '{print $$NF}' | tail -n 1) to rubygems.org"
	@gem push $(shell ls -l rubicons-*.gem | awk '{print $$NF}' | tail -n 1)
	@echo "Pushed $(shell ls -l rubicons-*.gem | awk '{print $$NF}' | tail -n 1) to rubygems.org"

count_icons:
	@find icons -mindepth 1 -maxdepth 1 -type d | xargs -I{} bash -c 'echo -n "{}: "; find {} -type f -name "*.svg" | wc -l'

sample_icons:
	@find icons -type d -mindepth 1 -maxdepth 1 | sort | while read dir; do \
		echo "$$(basename $$dir):"; \
		ls "$$dir" | sort | head -5; \
		echo; \
	done