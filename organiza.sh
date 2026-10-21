#!/bin/bash

saida="pastas feitas:"
for arquivo in *; do
	[ -f "$arquivo" ] || continue

	letra=${arquivo:0:1}
	letra=${letra^^}

	mkdir -p "arquivos $letra" || exit 1
	mv -- "$arquivo" "arquivos $letra" || exit 1
	
	if [[ "$saida" != *"$letra"* ]]; then
		saida="$saida $letra"
	fi
done

echo "$saida"
