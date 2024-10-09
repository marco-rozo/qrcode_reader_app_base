# O que é o Fastlane?
O Fastlane é uma ferramenta de automação para desenvolvimento mobile, que simplifica processos como criação de builds, execução de testes e distribuição de aplicativos. Ele integra-se com várias plataformas, permitindo automatizar tarefas complexas e melhorar a eficiência do fluxo de trabalho.


# Setup Inicial do Fastlane no Flutter

## Passo 1: Instalar Fastlane

1. **Instalar Ruby e RubyGems**: Certifique-se de ter Ruby e RubyGems instalados. 
No Ubuntu, você pode usar:

    ```bash
    sudo apt-get install ruby-full
    ```

No Windows:
[https://rubyinstaller.org/downloads/](https://rubyinstaller.org/downloads/)


2. **Instalar Fastlane**: Instale Fastlane globalmente usando RubyGems:

    ```bash
    sudo gem install fastlane -NV
    ```

## Passo 2: Configurar Fastlane para o Projeto Flutter

1. **Navegar para a Pasta Android**:

    ```bash
    cd android
    ```

2. **Inicializar Fastlane**: Dentro da pasta `android`, inicialize o Fastlane. Isso criará os arquivos e pastas necessários para a configuração.

    ```bash
    fastlane init
    ```

   Escolha a opção para configurar o Fastlane para o Android.

## Passo 3: Configurar o `Fastfile`

1. **Editar o `Fastfile`**: O `Fastfile` gerado estará na pasta `android/fastlane/`. Edite-o para adicionar lanes para tarefas como build e deploy. 

Ver: [fastfile](https://github.com/marco-rozo/qrcode_reader_app_base/blob/main/android/fastlane/Fastfile)

## Passo 4: Adicionar Plugins e Dependências

1. **Adicionar Plugins**: Se precisar de plugins adicionais para Fastlane, adicione-os ao seu `Gemfile` e execute:

    ```bash
    bundle install
    ```

2. **Instalar Plugins do Fastlane**:

    ```bash
    fastlane install_plugins
    ```

3. No nosso caso, estamos usando o plugin [fastlane-plugin-google_drive](https://github.com/bskim45/fastlane-plugin-google_drive). Pode ser adicionado usando: 

    ```bash
    fastlane add_plugin google_drive
    ```


## Passo 5: Testar a Configuração

1. **Executar uma Lane**: Teste a configuração executando uma das lanes:

    ```bash
    fastlane android build
    ```

Isso configurará o Fastlane para seu projeto Flutter e permitirá que você automatize o build e o deploy do seu aplicativo.



# Configuração do GitHub Actions para Flutter

O workflow inclui etapas para configurar o ambiente, instalar dependências, executar testes e realizar build e upload do APK para o Google Drive.

## Estrutura do Workflow

### Eventos que Disparam o Workflow

- **push**: O workflow é executado quando há um push para a branch `main`.
- **pull_request**: O workflow é executado quando um pull request é criado para a branch `main`.

### Jobs

O job é definido como `flutter_job` e rodando no ambiente `ubuntu-latest`.

#### Passos do Job

1. **Clonar o Repositório**
   - Usa a ação `actions/checkout@v4` para clonar o repositório na máquina virtual.

2. **Configurar o Flutter**
   - Usa a ação `subosito/flutter-action@v2` para instalar o Flutter e suas dependências. É possível especificar a versão do Flutter se necessário.

3. **Instalar Dependências**
   - Executa `flutter pub get` para instalar as dependências do projeto.

4. **Executar Testes Unitários**
   - Executa `flutter test` para rodar os testes unitários do projeto.

5. **Decodificar Credenciais do Google Drive (Somente para Push)**
   - Decodifica as credenciais do Google Drive armazenadas como um segredo no GitHub. O comando `base64 -d` decodifica a chave e a salva em um arquivo JSON na máquina virtual.

6. **Criar APK (Somente para Push)**
   - Executa `flutter build apk --release` para criar o APK do aplicativo.

7. **Instalar Fastlane (Somente para Push)**
   - Instala o Fastlane usando o comando `sudo gem install fastlane -NV`.

8. **Instalar Bundler e Configurar o Ambiente Ruby**
   - Navega para o diretório `./android` e instala o Bundler. Configura o ambiente Ruby para evitar problemas de dependências e instala as gems necessárias.

9. **Instalar Plugins do Fastlane (Somente para Push)**
   - Usa `bundle exec fastlane install_plugins` para instalar os plugins do Fastlane definidos no `Gemfile`.

10. **Upload para Google Drive (Somente para Push)**
    - Realiza o upload do APK para o Google Drive usando o Fastlane. Utiliza as credenciais e o ID da pasta do Google Drive armazenados como segredos.

## Personalização

- **Secrets do GitHub**: As credenciais do Google Drive e o ID da pasta foram configurados como segredos no repositório GitHub (`SERVICE_ACCOUNT_GOOGLE_CREDENTIALS` e `GOOGLE_DRIVE_FOLDER_ID`).

- **Variáveis de Ambiente**: Certifique-se de que as variáveis de ambiente no Fastfile correspondam às configuradas no GitHub Actions.

## Arquivo YAML

Ver [arquivo](https://github.com/marco-rozo/qrcode_reader_app_base/blob/main/.github/workflows/main.yml)
