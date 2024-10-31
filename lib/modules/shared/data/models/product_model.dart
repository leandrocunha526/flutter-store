import 'package:corelab_app_challenge/modules/shared/data/models/installments_model.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.categoria,
    required super.dataAnuncio,
    required super.precoAntigo,
    required super.preco,
    required super.novo,
    required super.parcelas,
    required super.imagem,
    required super.titulo,
    required super.desconto,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      categoria: json['categoria'],
      dataAnuncio: json['data_anuncio'],
      titulo: json['titulo'],
      desconto: json['desconto'],
      precoAntigo: json['preco_antigo'],
      preco: json['preco'],
      novo: json['novo'],
      parcelas: InstallmentsModel.fromJson(json['parcelas']),
      imagem: json['imagem']);
}
