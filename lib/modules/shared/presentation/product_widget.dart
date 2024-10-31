import 'package:corelab_app_challenge/core/ui/app_theme/app_colors.dart';
import 'package:corelab_app_challenge/core/ui/app_theme/app_text_styles.dart';
import 'package:corelab_app_challenge/core/ui/components/height.dart';
import 'package:corelab_app_challenge/core/ui/components/snack_bar.dart';
import 'package:corelab_app_challenge/core/ui/components/width.dart';
import 'package:corelab_app_challenge/modules/shared/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
          onTap: () => showSnackBar(
              context: context,
              message: "Está indisponível no momento, verifique mais tarde."),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border.symmetric(),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(children: [
                CachedNetworkImage(
                  width: 100,
                  height: 100,
                  fit: BoxFit.fitHeight,
                  imageUrl:
                      "https://cdn.dentalcremer.com.br/produtos/550/condicionador-acido-fosforico-37-allprime-859980-01-dental-cremer.jpg",
                ),
                const Width(16),
                SizedBox(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (productEntity.precoAntigo != null) ...[
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.defaultCyan,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            child: Text(
                              "10% OFF",
                              style: AppTextStyles(color: Colors.white).tiny,
                            ),
                          ),
                        ),
                        const Height(6),
                      ],
                      Text(
                        productEntity.titulo,
                        style: AppTextStyles(
                          weight: FontWeight.w400,
                        ).medium,
                      ),
                      const Height(6),
                      if (productEntity.precoAntigo != null) ...[
                        Text(
                          formatCurrency(productEntity.precoAntigo!),
                          style: AppTextStyles(color: AppColors.tertiaryCyan)
                              .small
                              .copyWith(
                                decoration: TextDecoration.lineThrough,
                              ),
                        )
                      ],
                      Text(
                        formatCurrency(productEntity.preco),
                        style: AppTextStyles().larger,
                      ),
                      Text(
                        "Em até ${productEntity.parcelas.quantidade}x de ${formatCurrency(productEntity.parcelas.precoParcela)}",
                        style: AppTextStyles(
                                color: AppColors.defaultCyan,
                                weight: FontWeight.w400)
                            .small,
                      ),
                      const Height(6),
                      Text("Novo",
                          style: AppTextStyles(color: AppColors.tertiaryCyan)
                              .smaller),
                    ],
                  ),
                )
              ]),
            ),
          )),
    );
  }
}

String formatCurrency(double value) {
  // Converte o valor para uma string com duas casas decimais
  String formattedValue = value.toStringAsFixed(2);

  // Substitui o ponto por vírgula, que é o separador decimal no Brasil
  formattedValue = formattedValue.replaceAll('.', ',');

  // Retorna o valor formatado com o símbolo de Real na frente
  return 'R\$ $formattedValue';
}
