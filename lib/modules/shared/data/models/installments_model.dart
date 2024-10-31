import 'package:corelab_app_challenge/modules/shared/domain/entities/installments_entity.dart';

class InstallmentsModel extends InstallmentsEntity {
  InstallmentsModel({
    required super.precoParcela,
    required super.quantidade,
  });

  factory InstallmentsModel.fromJson(Map<String, dynamic> json) =>
      InstallmentsModel(
          quantidade: json['quantidade'] ?? 0,
          precoParcela: json['preco_parcela'] ?? " ");

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quantidade'] = quantidade;
    data['preco_parcela'] = precoParcela;
    return data;
  }
}
