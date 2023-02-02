INSERT [dbo].[Roles] ([Id], [RoleName], [RoleDescription]) VALUES (N'e66693a9-f822-4aa9-b061-d7c5656b8142', N'admin', N'Main administrator role.')
GO
INSERT [dbo].[Accounts] ([Username], [EmailAddress], [PasswordHash], [RoleId]) VALUES (N'test', N'test@test.test', 0x9D7624149040E53C867B720D23589AE2F3BDF7E19DABB23206158FBB293F2C491A543EB4, N'e66693a9-f822-4aa9-b061-d7c5656b8142')
GO

-- HR management system entities definition

INSERT [gba].[Entities] ([EntityId], [ControllerName], [TableName], [ObjectName], [SoftDeleteColumn]) VALUES (N'f6b6a7ca-8ecc-4aa9-9c50-095fe467e971', N'employee-absence', N'EmployeeAbsence', NULL, NULL)
GO
INSERT [gba].[Entities] ([EntityId], [ControllerName], [TableName], [ObjectName], [SoftDeleteColumn]) VALUES (N'202f74da-7cb1-4685-b403-1d8e86cb9702', N'department', N'Department', NULL, NULL)
GO
INSERT [gba].[Entities] ([EntityId], [ControllerName], [TableName], [ObjectName], [SoftDeleteColumn]) VALUES (N'e896731e-c7ba-4046-861f-329980dbebae', NULL, N'Employee', N'Manager', NULL)
GO
INSERT [gba].[Entities] ([EntityId], [ControllerName], [TableName], [ObjectName], [SoftDeleteColumn]) VALUES (N'70764ca2-f297-4559-b443-35a3a683a945', N'employee', N'Employee', NULL, NULL)
GO
INSERT [gba].[Entities] ([EntityId], [ControllerName], [TableName], [ObjectName], [SoftDeleteColumn]) VALUES (N'70b094c9-6b42-4b56-ac16-4c6c01c2e238', N'job', N'Job', NULL, NULL)
GO
INSERT [gba].[Entities] ([EntityId], [ControllerName], [TableName], [ObjectName], [SoftDeleteColumn]) VALUES (N'e9b86f01-5754-4efe-b6d8-5bda2709de9c', NULL, N'Employee', N'EmployeeBasicData', NULL)
GO
INSERT [gba].[Entities] ([EntityId], [ControllerName], [TableName], [ObjectName], [SoftDeleteColumn]) VALUES (N'7faab2cb-8157-4689-980b-865b3e9850c9', N'absence-category', N'AbsenceCategory', NULL, NULL)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'69046c32-89b6-469d-9352-003b4fe7dafa', N'AbsenceCategoryId', N'f6b6a7ca-8ecc-4aa9-9c50-095fe467e971', N'7faab2cb-8157-4689-980b-865b3e9850c9', 0, 1, NULL, 0, N'AbsenceCategory', 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'f9ad5f4a-e797-4a52-8760-1d4c230b7c36', N'DateTo', N'f6b6a7ca-8ecc-4aa9-9c50-095fe467e971', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'fe99b6c6-19b2-4579-ba21-23119d05a043', N'LastName', N'e9b86f01-5754-4efe-b6d8-5bda2709de9c', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'6725ac0f-c48e-4a35-8638-2415d0de9c53', N'Name', N'202f74da-7cb1-4685-b403-1d8e86cb9702', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'f812297a-5375-4576-87eb-2e87222ab26b', N'EmployeeAbsenceId', N'f6b6a7ca-8ecc-4aa9-9c50-095fe467e971', NULL, 1, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'e28737c1-9f62-46ac-94ef-2f73ff4edde9', N'DepartmentId', N'70764ca2-f297-4559-b443-35a3a683a945', N'202f74da-7cb1-4685-b403-1d8e86cb9702', 0, 1, NULL, 0, N'Department', 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'd4837fef-65e9-4426-98d3-3b5f6683717d', N'EmployeeId', N'e9b86f01-5754-4efe-b6d8-5bda2709de9c', NULL, 1, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'a4e38ea6-6b3c-4ab6-8fe0-3d45c39007f9', N'LastName', N'e896731e-c7ba-4046-861f-329980dbebae', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'c006fae6-f5dc-451b-bf47-41601640477e', N'EmployeeId', N'e896731e-c7ba-4046-861f-329980dbebae', NULL, 1, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'b7de3bae-6511-4dc7-afa4-4183603f64ae', N'Description', N'7faab2cb-8157-4689-980b-865b3e9850c9', NULL, 0, 0, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'c7bea45b-814f-4d77-a71e-4282b449de1a', N'LastName', N'70764ca2-f297-4559-b443-35a3a683a945', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'9d19d6ce-72c9-45c9-ae51-454beb9fa22e', N'JobId', N'70764ca2-f297-4559-b443-35a3a683a945', N'70b094c9-6b42-4b56-ac16-4c6c01c2e238', 0, 0, NULL, 0, N'Job', 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'ee332ff8-0b05-476e-a1fd-460c24bf25fb', N'SuperiorId', N'70764ca2-f297-4559-b443-35a3a683a945', N'e896731e-c7ba-4046-861f-329980dbebae', 0, 1, N'Subordinates', 0, N'Manager', 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'e580f17d-f6ce-438f-8549-4cc942755481', N'LastName', N'e9b86f01-5754-4efe-b6d8-5bda2709de9c', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'9022da02-c43f-4aa1-9f3d-4de34da04e37', N'Name', N'70b094c9-6b42-4b56-ac16-4c6c01c2e238', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'a5a1d9a7-3197-4c47-a92c-57c3aa92ffb0', N'FirstName', N'e896731e-c7ba-4046-861f-329980dbebae', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'a3788ae3-e139-4f79-a449-5c9c0f162006', N'DepartmentId', N'202f74da-7cb1-4685-b403-1d8e86cb9702', NULL, 1, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'241c6b66-9cc0-40c8-b00d-6aafacf4f6dc', N'MiddleName', N'70764ca2-f297-4559-b443-35a3a683a945', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'a61d2a36-f855-44a7-a7cf-8478005f5432', N'Description', N'202f74da-7cb1-4685-b403-1d8e86cb9702', NULL, 0, 0, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'075c15d0-52be-4353-b146-907bcd6c6dec', N'SalaryFactor', N'7faab2cb-8157-4689-980b-865b3e9850c9', NULL, 0, 0, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'af55e83b-2e1e-486f-a7c7-9ca861db9155', N'AbsenceCategoryId', N'7faab2cb-8157-4689-980b-865b3e9850c9', NULL, 1, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'beec5e1b-ea6d-4927-9b4a-9e1cb5af4c67', N'DateFrom', N'f6b6a7ca-8ecc-4aa9-9c50-095fe467e971', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'acbc7663-ad01-44c0-ad64-a93ed11b4962', N'MiddleName', N'e896731e-c7ba-4046-861f-329980dbebae', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'd1f7456d-2e78-4be6-8935-aaffceb21db2', N'AbsenceStatus', N'f6b6a7ca-8ecc-4aa9-9c50-095fe467e971', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'779d3774-a6a7-49df-aabb-b610dcba492e', N'EmployeeId', N'70764ca2-f297-4559-b443-35a3a683a945', NULL, 1, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'2ccd9131-d20b-4612-8277-bb385483befc', N'EmployeeId', N'f6b6a7ca-8ecc-4aa9-9c50-095fe467e971', N'e9b86f01-5754-4efe-b6d8-5bda2709de9c', 0, 1, NULL, 0, N'Employee', 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'b28f3ca4-f1fd-492c-aef6-c8c3e52a44c5', N'Name', N'7faab2cb-8157-4689-980b-865b3e9850c9', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'9d75fc8b-6eca-4e55-88a2-cea9600664a1', N'JobId', N'70b094c9-6b42-4b56-ac16-4c6c01c2e238', NULL, 1, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'115903d2-c86b-4581-a077-d3fdef570ee6', N'EmployedFrom', N'70764ca2-f297-4559-b443-35a3a683a945', NULL, 0, 0, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'677ca234-1abf-4e7f-833f-d6a3468e0a8f', N'EmployeeType', N'70764ca2-f297-4559-b443-35a3a683a945', NULL, 0, 1, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'748e6882-eb51-4cf7-b417-de5255d2e5c7', N'VacationDays', N'70764ca2-f297-4559-b443-35a3a683a945', NULL, 0, 0, NULL, 0, NULL, 0)
GO
INSERT [gba].[Properties] ([PropertyId], [PropertyName], [EntityId], [ReferencingEntityId], [IsKey], [UseInBaseModel], [RelatedModelPropertyName], [DisplayInRelatedEntityBaseModel], [ModelPropertyName], [IsReadOnly]) VALUES (N'4d95c205-0769-4b39-87d2-e076158f56c1', N'FirstName', N'70764ca2-f297-4559-b443-35a3a683a945', NULL, 0, 1, NULL, 0, NULL, 0)
GO
