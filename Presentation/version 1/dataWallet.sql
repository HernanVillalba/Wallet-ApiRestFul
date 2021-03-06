USE [WALLET]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [First_Name], [Last_Name], [Email], [Password]) VALUES (1, N'alice', N'test', N'alice@test.com', N'czKuJ4EhDSLnhXfomATQ1131wS72POLg62/S/Ob8TZI=:8PKkrV1PZzi/992yKGzLTg==')
INSERT [dbo].[Users] ([Id], [First_Name], [Last_Name], [Email], [Password]) VALUES (2, N'bob', N'test', N'bob@test1.com', N'41m0gNleFY9PvHrlhHwTyRKgUaIaaIdv89Zg4jjWb7o=:T8NSsF+LdBFVrtPr0PUgnA==')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (1, N'USD', 1)
INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (2, N'ARS', 1)
INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (3, N'USD', 2)
INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (4, N'ARS', 2)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (1, 100, N'carga inicial', CAST(N'2021-03-20T11:35:34.933' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (2, 100, N'carga 2', CAST(N'2021-03-29T11:36:04.877' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (3, 100, N'carga 3', CAST(N'2021-03-29T11:36:07.920' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (4, 100, N'carga 4', CAST(N'2021-03-29T11:36:11.007' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (5, 100, N'carga 5', CAST(N'2021-03-29T11:36:14.147' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (6, 100, N'carga 6', CAST(N'2021-03-29T11:36:17.040' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (7, 100, N'carga 7', CAST(N'2021-03-29T11:36:20.100' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (8, 100, N'carga 8', CAST(N'2021-03-29T11:36:23.210' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (9, 100, N'carga 9', CAST(N'2021-03-29T11:36:26.410' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (10, 100, N'carga 10', CAST(N'2021-03-29T11:36:30.493' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (11, 100, N'carga 11', CAST(N'2021-03-29T11:36:33.587' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (12, 100, N'carga 12', CAST(N'2021-03-29T11:36:36.783' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (13, 100, N'carga 13', CAST(N'2021-03-29T11:36:40.260' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Editable]) VALUES (14, 100, N'Plazo Fijo (Apertura)', CAST(N'2021-03-26T11:48:13.800' AS DateTime), N'Payment', 2, 0)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[FixedTermDeposits] ON 

INSERT [dbo].[FixedTermDeposits] ([Id], [Amount], [Creation_Date], [Closing_Date], [Account_Id]) VALUES (1, 100, CAST(N'2021-03-26T11:48:13.757' AS DateTime), NULL, 2)
SET IDENTITY_INSERT [dbo].[FixedTermDeposits] OFF
GO
