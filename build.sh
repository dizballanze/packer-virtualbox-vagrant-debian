#!/bin/bash
packer build -only=virtualbox-iso -var-file=debian8.json debian.json
