VERSION=1.1
USER=alpental
REPO=builder16

TOOLS=../../../tools/docker_shell ../../../tools/container-id

build:
	cp ${TOOLS} .
	docker build -t $(USER)/$(REPO):$(VERSION) .

run:
	docker run -it $(IMAGE_NAME)

commit:
	docker commit $(USER)/$(REPO):$(VERSION) $(IMAGE_NAME)

push:
	docker push $(USER)/$(REPO):$(VERSION)
