.PHONY: default
.DEFAULT_GOAL := default

default:
	nix-shell -p nodePackages.node2nix --command "node2nix -16 -i ./node-packages.json -o node-packages.nix"
