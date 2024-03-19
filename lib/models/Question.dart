/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Question type in your schema. */
class Question extends amplify_core.Model {
  static const classType = const _QuestionModelType();
  final String id;
  final String? _questionLabel;
  final String? _questionDescription;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  QuestionModelIdentifier get modelIdentifier {
      return QuestionModelIdentifier(
        id: id
      );
  }
  
  String? get questionLabel {
    return _questionLabel;
  }
  
  String? get questionDescription {
    return _questionDescription;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Question._internal({required this.id, questionLabel, questionDescription, createdAt, updatedAt}): _questionLabel = questionLabel, _questionDescription = questionDescription, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Question({String? id, String? questionLabel, String? questionDescription}) {
    return Question._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      questionLabel: questionLabel,
      questionDescription: questionDescription);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Question &&
      id == other.id &&
      _questionLabel == other._questionLabel &&
      _questionDescription == other._questionDescription;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Question {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("questionLabel=" + "$_questionLabel" + ", ");
    buffer.write("questionDescription=" + "$_questionDescription" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Question copyWith({String? questionLabel, String? questionDescription}) {
    return Question._internal(
      id: id,
      questionLabel: questionLabel ?? this.questionLabel,
      questionDescription: questionDescription ?? this.questionDescription);
  }
  
  Question copyWithModelFieldValues({
    ModelFieldValue<String?>? questionLabel,
    ModelFieldValue<String?>? questionDescription
  }) {
    return Question._internal(
      id: id,
      questionLabel: questionLabel == null ? this.questionLabel : questionLabel.value,
      questionDescription: questionDescription == null ? this.questionDescription : questionDescription.value
    );
  }
  
  Question.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _questionLabel = json['questionLabel'],
      _questionDescription = json['questionDescription'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'questionLabel': _questionLabel, 'questionDescription': _questionDescription, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'questionLabel': _questionLabel,
    'questionDescription': _questionDescription,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<QuestionModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<QuestionModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final QUESTIONLABEL = amplify_core.QueryField(fieldName: "questionLabel");
  static final QUESTIONDESCRIPTION = amplify_core.QueryField(fieldName: "questionDescription");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Question";
    modelSchemaDefinition.pluralName = "Questions";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.QUESTIONLABEL,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.QUESTIONDESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _QuestionModelType extends amplify_core.ModelType<Question> {
  const _QuestionModelType();
  
  @override
  Question fromJson(Map<String, dynamic> jsonData) {
    return Question.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Question';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Question] in your schema.
 */
class QuestionModelIdentifier implements amplify_core.ModelIdentifier<Question> {
  final String id;

  /** Create an instance of QuestionModelIdentifier using [id] the primary key. */
  const QuestionModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'QuestionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is QuestionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}