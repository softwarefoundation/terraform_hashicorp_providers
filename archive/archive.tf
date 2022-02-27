terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
      version = "2.2.0"
    }
  }
}

data "archive_file" "zipar_arquivo" {
  source_file = "arquivos/info.txt"
  type        = "zip"
  output_path = "arquivo.zip"
}

output "zipar_arquivo" {
  value = format("Arquivo zipado. Tamanho: %s", data.archive_file.zipar_arquivo.output_size)
}

data "archive_file" "zipar_diretorio" {
  source_dir = "arquivos"
  output_path = "diretorio.zip"
  type        = "zip"
}

output "zipar_diretorio" {
  value = format("Diretorio zipado. Tamanho: %s", data.archive_file.zipar_diretorio.output_size)
}