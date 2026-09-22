# HADES

Central oficial de distribuição, atualização e identidade de versão do **HADES**, software proprietário da **ATLAS TECNOLOGIA**.

## Estrutura

- `version.json`: identidade da versão estável publicada.
- `manifests/stable.json`: manifesto consumido automaticamente pelo HADES.
- `windows/`: referência do instalador Windows/Inno Setup.
- `debian/`: referência da distribuição Debian/Linux.
- `releases/`: registros das versões publicadas.
- `docs/`: termos, atualização, build e publicação.
- `.github/workflows/hades-finalizar-release.yml`: valida e publica a release draft.
- `.github/workflows/hades-release-manifest.yml`: valida os artefatos publicados e atualiza o canal estável.

## Segurança do atualizador

O HADES valida produto, versão, sistema operacional, arquitetura, formato, tamanho e SHA-256 antes de aceitar um pacote. A atualização só é confirmada quando a nova versão realmente inicia.

## Plataformas oficiais

- Windows x64: instalador Inno Setup.
- Debian/Ubuntu amd64: pacote `.deb`.

## Fluxo de publicação

Os builds Windows e Debian sobem primeiro para uma **GitHub Release draft**. A versão só é publicada quando os dois instaladores e seus hashes existem e passam pela verificação. Depois da publicação, o GitHub Actions atualiza o manifesto estável consumido pelos clientes.

Consulte `docs/BUILD_E_PUBLICACAO.md` para o procedimento completo.

Os dados persistentes do HADES permanecem fora da pasta de instalação para sobreviver a reinstalações e atualizações.

Copyright © ATLAS TECNOLOGIA. Componentes de terceiros permanecem sujeitos às licenças de seus respectivos titulares.
