import 'package:ecommerce/features/home/domain/repository/service_repository.dart';

import '../entities/service_entity.dart';

class GetAllServices {
  final ServiceRepository repository;

  GetAllServices(this.repository);

  Future<List<ServiceEntity>> call() async {
    return await repository.getAllServices();
  }
}
