// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'telescope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TelescopeImpl _$$TelescopeImplFromJson(Map<String, dynamic> json) =>
    _$TelescopeImpl(
      id: json['id'] as String?,
      model: json['model'] as String,
      brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
      type: json['type'] as String,
      dimension: json['dimension'] as String,
      weightInPound: json['weightInPound'] as num,
      focustype: json['focustype'] as String,
      lensDiameterInMM: json['lensDiameterInMM'] as num,
      mountDescription: json['mountDescription'] as String,
      price: json['price'] as num,
      stock: json['stock'] as num,
      avgRating: json['avgRating'] as num,
      discount: json['discount'] as num,
      thumbnail: ImageModel.fromJson(json['thumbnail'] as Map<String, dynamic>),
      additionalImage: (json['additionalImage'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$TelescopeImplToJson(_$TelescopeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'model': instance.model,
      'brand': instance.brand,
      'type': instance.type,
      'dimension': instance.dimension,
      'weightInPound': instance.weightInPound,
      'focustype': instance.focustype,
      'lensDiameterInMM': instance.lensDiameterInMM,
      'mountDescription': instance.mountDescription,
      'price': instance.price,
      'stock': instance.stock,
      'avgRating': instance.avgRating,
      'discount': instance.discount,
      'thumbnail': instance.thumbnail,
      'additionalImage': instance.additionalImage,
      'description': instance.description,
    };
