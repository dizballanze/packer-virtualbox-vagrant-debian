#!/bin/bash
packer build -only=virtualbox-iso -var-file=debian9.json debian.json
