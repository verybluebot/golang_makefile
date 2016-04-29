BUILDPATH=$(CURDIR)
GO=$(shell which go)
GOINSTALL=$(GO) install
GOCLEAN=$(GO) clean
GOGET=$(GO) get

EXENAME=main

export GOPATH=$(CURDIR)

myname:
	@echo "I am a makefile"

makedir:
	@echo "start building tree..."
	@if [ ! -d $(BUILDPATH)/bin ] ; then mkdir -p $(BUILDPATH)/bin ; fi
	@if [ ! -d $(BUILDPATH)/pkg ] ; then mkdir -p $(BUILDPATH)/pkg ; fi

get:
	@$(GOGET) github.com/gorilla/mux
	@$(GOGET) github.com/go-sql-driver/mysql
	@$(GOGET) github.com/Sirupsen/logrus

build:
	@echo "start building..."
	$(GOINSTALL) $(EXENAME)
	@echo "Yay! all DONE!"

clean:
	@echo "cleanning"
	@rm -rf $(BUILDPATH)/bin/$(EXENAME)
	@rm -rf $(BUILDPATH)/pkg
	@rm -rf $(BUILDPATH)/src/github.com

all: makedir get build
