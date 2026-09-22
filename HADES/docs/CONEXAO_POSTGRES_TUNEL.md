# Conexão PostgreSQL, IP e túneis no HADES

O HADES separa **portal HTTPS** de **endpoint TCP PostgreSQL**.

## 1. PostgreSQL direto

Exemplos válidos:

- `192.168.1.14` + porta `5432`
- `db.exemplo.com` + porta `5432`
- `db.exemplo.com:5432`

Não use `http://` ou `https://` como host do PostgreSQL.

## 2. Túnel TCP local

Quando SSH, VPN ou cloudflared já abre uma porta local, o HADES conecta normalmente em:

- host: `127.0.0.1`
- porta: a porta local escolhida

O programa do túnel encaminha essa conexão TCP ao PostgreSQL remoto.

## 3. Cloudflare Access TCP

O domínio público fica no campo **Portal HTTPS**, por exemplo:

`https://hades10.exemplo.com`

O HADES não envia esse endereço ao driver PostgreSQL. Ele usa o listener TCP local, normalmente `127.0.0.1`.

Exemplo:

```bash
cloudflared access tcp --hostname hades10.exemplo.com --url 127.0.0.1:5432
```

Depois, no HADES:

- Portal HTTPS: `https://hades10.exemplo.com`
- Host local: `127.0.0.1`
- Porta local: `5432`

A rota Cloudflare precisa estar configurada para TCP/Access ao PostgreSQL. Uma rota HTTP/HTTPS comum de site não transporta o protocolo PostgreSQL.

## Migração de configurações antigas

Se uma versão antiga tiver salvo `https://...` no campo de host PostgreSQL, a tela de Configurações atualizada reconhece a URL, move-a para o campo Portal Cloudflare e troca o destino efetivo do banco para o endpoint TCP local.
