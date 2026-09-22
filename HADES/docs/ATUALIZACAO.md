# Atualização oficial do HADES

O HADES consulta o manifesto estável em:

`https://raw.githubusercontent.com/tullilind/Atlas-Hub/main/HADES/manifests/stable.json`

## Regras

1. O aplicativo compara a versão instalada com `latest`.
2. Detecta sistema operacional, distribuição e arquitetura.
3. Seleciona somente um asset compatível.
4. Exige SHA-256 válido antes de aceitar o pacote.
5. O pacote é baixado para a área persistente de atualizações do HADES.
6. O instalador é iniciado fora do processo principal.
7. A atualização fica como pendente até que a nova versão do HADES realmente inicie.
8. Se a máquina continuar abrindo a versão antiga, o histórico registra a atualização como não confirmada.

## Windows

Pacote esperado: instalador Inno Setup `.exe`, x64, com AppId estável e diretório canônico em `Program Files\\Atlas Tecnologia\\HADES`.

## Debian / Ubuntu

Pacote esperado: `.deb`, arquitetura amd64, aplicativo em `/opt/atlas/hades` e comando `/usr/bin/hades`.

## Publicação

As Releases devem seguir a tag `hades-vX.Y.Z`. O workflow do repositório atualiza o manifesto ao detectar os artefatos oficiais.
