gem:
	@gem build rubicons.gemspec
	@gem install rubicons-*.gem

count_icons:
	@find icons -mindepth 1 -maxdepth 1 -type d | xargs -I{} bash -c 'echo -n "{}: "; find {} -type f -name "*.svg" | wc -l'

sample_icons:
	@find icons -type d -mindepth 1 -maxdepth 1 | sort | while read dir; do \
		echo "$$(basename $$dir):"; \
		ls "$$dir" | sort | head -5; \
		echo; \
	done