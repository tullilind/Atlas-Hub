#!/usr/bin/env bash
set -euo pipefail
VERSION="${HADES_VERSION:-0.9.1}"
ARCH="${HADES_DEB_ARCH:-amd64}"

echo "Gerar o binário HADES Linux com PyInstaller antes desta etapa."
echo "Estrutura final esperada:"
echo "  /opt/atlas/hades/HADES"
echo "  /usr/bin/hades -> /opt/atlas/hades/HADES"
echo "  /usr/share/applications/hades.desktop"
echo "Pacote: HADES-${VERSION}-debian-${ARCH}.deb"
