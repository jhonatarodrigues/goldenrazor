import 'dart:convert';

import './collaborator.dart';
import './serviceModel.dart';

class ServiceCollaboratorModel {
  int id;
  int idService;
  int idCollaborator;
  bool status;
  CollaboratorModel collaborator;
  ServiceModel service;

  ServiceCollaboratorModel({
    required this.id,
    required this.idService,
    required this.idCollaborator,
    required this.status,
    required this.collaborator,
    required this.service,
  });

  ServiceCollaboratorModel copyWith({
    int? id,
    int? idService,
    int? idCollaborator,
    bool? status,
    CollaboratorModel? collaborator,
    ServiceModel? service,
  }) {
    return ServiceCollaboratorModel(
      id: id ?? this.id,
      idService: idService ?? this.idService,
      idCollaborator: idCollaborator ?? this.idCollaborator,
      status: status ?? this.status,
      collaborator: collaborator ?? this.collaborator,
      service: service ?? this.service,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idService': idService,
      'idCollaborator': idCollaborator,
      'status': status,
      'collaborator': collaborator.toMap(),
      'service': service.toMap(),
    };
  }

  factory ServiceCollaboratorModel.fromMap(Map<String, dynamic> map) {
    return ServiceCollaboratorModel(
      id: map['id']?.toInt() ?? 0,
      idService: map['idService']?.toInt() ?? 0,
      idCollaborator: map['idCollaborator']?.toInt() ?? 0,
      status: map['status'] ?? false,
      collaborator: CollaboratorModel.fromMap(map['collaborator']),
      service: ServiceModel.fromMap(map['service']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceCollaboratorModel.fromJson(source) =>
      ServiceCollaboratorModel.fromMap(source);

  @override
  String toString() {
    return 'ServiceCollaboratorModel(id: $id, idService: $idService, idCollaborator: $idCollaborator, status: $status, collaborator: $collaborator, service: $service)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ServiceCollaboratorModel &&
        other.id == id &&
        other.idService == idService &&
        other.idCollaborator == idCollaborator &&
        other.status == status &&
        other.collaborator == collaborator &&
        other.service == service;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idService.hashCode ^
        idCollaborator.hashCode ^
        status.hashCode ^
        collaborator.hashCode ^
        service.hashCode;
  }
}
