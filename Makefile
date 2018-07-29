all: examples/test-a examples/test-so

examples/test-a: target/release/libdnscat2.a
	gcc -o examples/test-a examples/test.c target/release/libdnscat2.a -lpthread -ldl

examples/test-so: target/release/libdnscat2.so
	gcc -o examples/test-so examples/test.c target/release/libdnscat2.so

target/release/libdnscat2.so: target/release/libdnscat2.a

target/release/libdnscat2.a:
	cargo build --release

clean:
	rm -f example/test-a example/test-so
	rm -rf target/
