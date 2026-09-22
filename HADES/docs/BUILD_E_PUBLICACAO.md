# Build e publicação oficial do HADES

A distribuição do HADES usa o repositório **tullilind/Atlas-Hub** apenas como central pública de releases, manifestos e documentação. O código-fonte completo do HADES não precisa ficar público para que a atualização automática funcione.

## Fonte única de versão

A versão do aplicativo é definida no pacote-fonte por:

`HADES_VERSION.json`

Os scripts de build leem esse arquivo. Não mantenha números de versão duplicados em CMD, SH ou instalador.

## Windows x64

No pacote-fonte:

```bat
build_release_windows.cmd
```

O processo valida a fonte, cria um ambiente Python isolado, executa os validadores, gera `HADES.exe` com PyInstaller em modo gráfico, localiza/instala Inno Setup 6, cria o instalador e gera o SHA-256.

Saída:

```
dist-release/windows/HADES-Setup-X.Y.Z-windows-x64.exe
dist-release/windows/HADES-Setup-X.Y.Z-windows-x64.exe.sha256
```

Para enviar o resultado à release draft:

```bat
build_release_windows.cmd --upload-draft
```

## Debian / Ubuntu amd64

No pacote-fonte:

```bash
chmod +x build_release_debian.sh
./build_release_debian.sh
```

Saída:

```
dist-release/debian/HADES-X.Y.Z-debian-amd64.deb
dist-release/debian/HADES-X.Y.Z-debian-amd64.deb.sha256
```

Para enviar à mesma release draft:

```bash
./build_release_debian.sh --upload-draft
```

## Release draft

Os dois builds usam a mesma tag:

`hades-vX.Y.Z`

A release permanece em modo **draft** enquanto os pacotes Windows e Debian são produzidos em máquinas diferentes.

Quatro arquivos são obrigatórios:

1. `HADES-Setup-X.Y.Z-windows-x64.exe`
2. `HADES-Setup-X.Y.Z-windows-x64.exe.sha256`
3. `HADES-X.Y.Z-debian-amd64.deb`
4. `HADES-X.Y.Z-debian-amd64.deb.sha256`

## Finalização

No pacote-fonte, com GitHub CLI autenticado:

```bat
publish_release.cmd
```

ou:

```bash
./publish_release.sh
```

O comando baixa os quatro arquivos da draft, recalcula os hashes e só publica se tudo estiver íntegro.

Também existe o workflow manual **HADES - Finalizar release draft** no GitHub Actions. Ele executa a mesma conferência antes de publicar.

## Manifesto estável

Quando a release é publicada, o workflow **HADES - Publicar manifesto estável**:

1. baixa os quatro artefatos;
2. recalcula SHA-256;
3. compara com os sidecars publicados;
4. gera `HADES/manifests/stable.json`;
5. atualiza `HADES/version.json`;
6. registra `HADES/releases/X.Y.Z.json`;
7. anexa o manifesto da versão à própria Release;
8. commita o canal estável.

O HADES só vê a nova versão depois dessa etapa. Uma release incompleta ou com hash incorreto não atualiza o canal estável.

## GitHub CLI

Para envio/publicação local:

```
gh auth login
```

O build local funciona sem `gh`; a CLI só é exigida quando `--upload-draft` ou a publicação local são usados.


## Diagnóstico da etapa 4 no Windows

Se o build parar em `[4/8] Executando validadores do HADES`, use o arquivo do pacote-fonte:

```bat
diagnosticar_etapa4_windows.cmd
```

Ele testa separadamente:

- Python e arquitetura;
- ambiente virtual;
- dependências essenciais;
- `compileall`;
- `validar_hades.py`;
- `tools\\validar_atualizador.py`.

O CMD permanece aberto em erro e grava `diagnostico_etapa4_windows.log`. O build principal também não fecha mais silenciosamente: mostra a subetapa que falhou e as últimas linhas do diagnóstico. Para automação/CI, use `--no-pause`.
