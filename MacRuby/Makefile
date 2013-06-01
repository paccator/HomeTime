dynamic: dist_dir
	macrubyc -o dist/HomeTime.app/Contents/MacOS/HomeTime src/home_time.rb

static: dist_dir
	macrubyc --static -o dist/HomeTime src/home_time.rb

dist_dir:
	mkdir -p dist/HomeTime.app/Contents/MacOS
