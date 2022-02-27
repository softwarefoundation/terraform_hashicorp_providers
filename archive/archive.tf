terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
      version = "2.2.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

resource "random_string" "random" {
  length = 5
  special = false
}

data "archive_file" "zipar_arquivo" {
  source_file = "arquivos/info.txt"
  type        = "zip"
  output_path = "arquivo.zip"
}

data "archive_file" "zipar_diretorio" {
  source_dir = "arquivos"
  output_path = "diretorio.zip"
  type        = "zip"
}

output "random_string" {
  value = random_string.random.result
}

output "zipar_arquivo" {
  value = format("Arquivo zipado. Tamanho: %s", data.archive_file.zipar_arquivo.output_size)
}

output "zipar_diretorio" {
  value = format("Diretorio zipado. Tamanho: %s", data.archive_file.zipar_diretorio.output_size)
}