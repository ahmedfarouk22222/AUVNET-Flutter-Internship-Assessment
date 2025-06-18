import 'package:ecommerce/features/home/data/datasources/home_data_source.dart';

import 'package:ecommerce/features/home/data/models/service_model.dart';
import 'package:ecommerce/features/home/domain/entities/service_entity.dart';

import 'package:ecommerce/features/home/domain/repository/service_repository.dart';


class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource remoteDataSource;

  ServiceRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ServiceEntity>> getAllServices() async {
    final List<ServiceModel> data = await remoteDataSource.getServices();
    return data;
  }
  
}
