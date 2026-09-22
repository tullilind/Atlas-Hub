#!/usr/bin/env bash
set -euo pipefail

# Arquivo de referência pública da distribuição Debian do HADES.
# O script executável completo fica no pacote-fonte do HADES e produz:
#   HADES-X.Y.Z-debian-amd64.deb
#   HADES-X.Y.Z-debian-amd64.deb.sha256
#
# Estrutura instalada:
#   /opt/atlas/hades/HADES
#   /opt/atlas/hades/HADES_VERSION.json
#   /usr/bin/hades
#   /usr/share/applications/hades.desktop
#   /usr/share/icons/hicolor/256x256/apps/hades.png
#   /usr/share/doc/hades-atlas/TERMOS_INSTALACAO_HADES.txt
#
# O pacote oficial é gerado somente em Debian/Ubuntu amd64,
# validado com SHA-256 e enviado primeiro para uma GitHub Release draft.

echo "Use build_release_debian.sh do pacote-fonte oficial do HADES."
