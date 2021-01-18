.PHONY: proto

proto:
	@for f in shared/proto/*/*.proto; do \
		protoc --go-grpc_out=. --go_out=. $$f; \
		echo compiled: $$f; \
	done
