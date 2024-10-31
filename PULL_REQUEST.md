# Checklist

Confira o checklist de desenvolvimento, a listagem do que foi desenvolvimento no aplicativo:

Framework: Flutter  
Linguagem: Dart

[x] Cache de imagem e carregamento offline.  
`Além disso, o cached_network_image é um pacote utilizado para carregar e armazenar em cache imagens da internet. Isso significa que, ao usar esse pacote, as imagens baixadas da web são salvas localmente no dispositivo, o que melhora o desempenho e a experiência do usuário, especialmente em situações de baixa conectividade ou ao visualizar a mesma imagem várias vezes. Fazendo parte da otimização de desempenho na aplicação.`  
[x] Imagem de exemplo usando o cached_network_image que originada de uma CDN.  
[x] Uso do Shimmer para carregamento em forma de esqueleto configurado pra um design de acordo.  
[x] Flutter modular.  
`Sendo uma biblioteca que facilita a organização e modularização do código em projetos Flutter, especialmente quando o projeto começa a crescer em complexidade. Ele é baseado em uma arquitetura modular e orientada a injeção de dependências, ajudando a manter o código mais limpo, organizado e fácil de escalar.`  
[x] Armazenamento das buscas criando um histórico.  
[x] Formatação de preço pro formato brasileiro e calculados dinamicamente.  
[x] Uso de componentes com possibilidade de reaproveitamento e customização como barra de busca.  
[x] Projeto segue mockup disponibilizado e foi analisado para verificar se está de acordo.  
[x] Execução de Lintian ([Dart Analyze](https://dart.dev/tools/dart-analyze)) pra remoção de warns.  
[x] Snackbar para mensagens informativas e de erro.  
[x] Debouncer.  
`Sendo uma técnica usada para limitar a quantidade de vezes que uma função é executada dentro de um período de tempo. Isso é útil em situações onde você quer evitar que uma função seja chamada excessivamente, como em um campo de busca onde o usuário digita rapidamente, ou em chamadas para APIs durante digitação.`  
[x] Mocked Data para dados fictícios com produtos para dentistas, sendo utilizado tanto para listagem para amostra e para funcionalidade de busca (para buscas terem resultados).  
[x] Uso de Dartz.  
`Uma biblioteca popular em Dart que oferece uma coleção de tipos funcionais, inspirados em linguagens como Haskell e Scala, para ajudar a escrever código mais robusto e seguro. Ela é particularmente útil ao trabalhar com operações que podem falhar, como chamadas de API, manipulação de erros e processamento de dados opcionais ou nulos. Mais uma decisão com foco na otimização de desempenho com melhor código possível.`  
[x] Definido opcionalmente cor do plano de fundo da aplicação (branco) para barra de navegação (esta alteração segue em conformidade com o mockup que esta parte é branca) para se diferenciar de projetos que utilizam do padrão (o que é comum de deixarem em preto).  
`Agora, a barra de navegação do sistema fica como parte da barra de navegação do aplicativo.`

## Para execução

- Rode `flutter pub get` para instalar dependências,
- Rode `flutter run` para executar o projeto.
Necessário um dispositivo conectado via USB como modo de depuração ativado ou AVD instalado pelo Android Studio.

[Maiores informações sobre uso de pacotes no Flutter, acesse este link](https://docs.flutter.dev/packages-and-plugins/using-packages)
