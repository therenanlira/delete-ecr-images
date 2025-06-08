# delete_ecr_images

Função Bash para deletar todas as imagens de um ou mais repositórios do Amazon ECR em uma região específica.

## Como usar

Adicione a função abaixo ao seu script Bash ou ao seu arquivo `.bashrc`.

### Parâmetros

- `<region>`: Região AWS onde os repositórios estão localizados (ex: `us-east-1`)
- `<repositories separated by space>`: Lista de nomes dos repositórios ECR separados por espaço (ex: `"repo1 repo2 repo3"`)

### Exemplo de uso

```bash
delete_ecr_images "us-east-1" "meu-repo outro-repo"
```

## Pré-requisitos

- AWS CLI configurado com permissões para listar e deletar imagens do ECR.
- [jq](https://stedolan.github.io/jq/) instalado para manipulação de JSON.

## Observações

- **Atenção:** Todas as imagens dos repositórios informados serão removidas.
- Ideal para limpeza de ambientes de desenvolvimento ou automação de pipelines.

---
