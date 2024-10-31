import 'package:corelab_app_challenge/modules/home/data/datasources/data_source_home.dart';
import 'package:corelab_app_challenge/modules/shared/data/models/product_model.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';

class HomeDataSourceImpl implements DataSourceHome {
  @override
  Future<List<ProductEntity>> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return dataMock
        .map<ProductEntity>((json) => ProductModel.fromJson(json))
        .toList();
  }
}

final dataMock = [
  {
    "categoria": "Anestésicos e Agulhas Gengivais",
    "data_anuncio": "Hoje",
    "titulo": "Anestésico Local 20ml",
    "desconto": null,
    "preco_antigo": null,
    "preco": 79.90,
    "novo": true,
    "parcelas": {"quantidade": 4, "preco_parcela": 19.98},
    "imagem": ""
  },
  {
    "categoria": "Biosegurança",
    "data_anuncio": "Hoje",
    "titulo": "Avental Cirúrgico Descartável",
    "desconto": "8%",
    "preco_antigo": 50.0,
    "preco": 46.00,
    "novo": true,
    "parcelas": {"quantidade": 3, "preco_parcela": 15.33},
    "imagem": ""
  },
  {
    "categoria": "Anestésicos e Agulhas Gengivais",
    "data_anuncio": "Ontem",
    "titulo": "Anestésico Dentário de Ação Rápida (10ml)",
    "desconto": "10%",
    "preco_antigo": 15.0,
    "preco": 13.50,
    "novo": true,
    "parcelas": {"quantidade": 1, "preco_parcela": 13.50},
    "imagem": ""
  },
  {
    "categoria": "Biosegurança",
    "data_anuncio": "Hoje",
    "titulo": "Protetor Facial para Procedimentos Odontológicos",
    "desconto": "12%",
    "preco_antigo": 40.0,
    "preco": 35.20,
    "novo": true,
    "parcelas": {"quantidade": 2, "preco_parcela": 17.60},
    "imagem": ""
  },
  {
    "categoria": "Dentística e Estética",
    "data_anuncio": "Hoje",
    "titulo": "Gel Clareador Dental com Sabor Hortelã",
    "desconto": "15%",
    "preco_antigo": 60.0,
    "preco": 51.00,
    "novo": true,
    "parcelas": {"quantidade": 3, "preco_parcela": 17.00},
    "imagem": ""
  },
  {
    "categoria": "Periféricos e Peças de Mão",
    "data_anuncio": "Hoje",
    "titulo": "Contra-Ângulo para Endodontia",
    "desconto": "10%",
    "preco_antigo": 150.0,
    "preco": 135.00,
    "novo": true,
    "parcelas": {"quantidade": 4, "preco_parcela": 33.75},
    "imagem": ""
  },
  {
    "categoria": "Endodontia",
    "data_anuncio": "Hoje",
    "titulo": "Irrigador Endodôntico Avançado",
    "desconto": "18%",
    "preco_antigo": 45.0,
    "preco": 36.90,
    "novo": true,
    "parcelas": {"quantidade": 2, "preco_parcela": 18.45},
    "imagem": ""
  },
  {
    "categoria": "Ortodontia",
    "data_anuncio": "Hoje",
    "titulo": "Fios de Retenção Ortodôntica (Pacote com 20)",
    "desconto": "12%",
    "preco_antigo": 30.0,
    "preco": 26.40,
    "novo": true,
    "parcelas": {"quantidade": 1, "preco_parcela": 26.40},
    "imagem": ""
  },
  {
    "categoria": "Descartáveis",
    "data_anuncio": "Hoje",
    "titulo": "Protetores de Seringa Descartáveis (Pacote com 200)",
    "desconto": "15%",
    "preco_antigo": 20.0,
    "preco": 17.00,
    "novo": true,
    "parcelas": {"quantidade": 1, "preco_parcela": 17.00},
    "imagem": ""
  }
];
