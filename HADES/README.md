# HADES

Central oficial de distribuição, atualização e identidade de versão do **HADES**, software proprietário da **ATLAS TECNOLOGIA**.

## Estrutura

- `version.json`: identidade da versão estável publicada.
- `manifests/stable.json`: manifesto consumido automaticamente pelo HADES.
- `windows/`: reservado para metadados da distribuição Windows.
- `debian/`: reservado para metadados da distribuição Debian/Linux.
- `releases/`: notas e registros das versões publicadas.
- `docs/`: termos, arquitetura de atualização e documentação de publicação.

## Segurança do atualizador

O HADES não aceita um pacote apenas porque a URL respondeu. Antes da instalação ele valida:

1. produto;
2. versão;
3. sistema operacional;
4. arquitetura;
5. formato do pacote;
6. tamanho, quando publicado;
7. SHA-256.

A atualização fica em estado **pendente** até que a nova versão realmente inicialize. Isso evita registrar uma instalação como concluída enquanto a máquina continua executando um binário antigo.

## Plataformas

- Windows x64: instalador oficial Inno Setup.
- Debian/Ubuntu x64: pacote `.deb`.

## Publicação

As GitHub Releases usam tags no padrão `hades-vX.Y.Z`. O workflow `.github/workflows/hades-release-manifest.yml` recalcula os hashes dos artefatos publicados e atualiza o manifesto estável.

Os dados persistentes do HADES devem permanecer fora da pasta de instalação para sobreviver a reinstalações e atualizações.

Copyright © ATLAS TECNOLOGIA. Componentes de terceiros permanecem sujeitos às licenças de seus respectivos titulares.
