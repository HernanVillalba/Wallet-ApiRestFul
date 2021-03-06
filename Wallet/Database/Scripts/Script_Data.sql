USE [WALLET]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [First_Name], [Last_Name], [Email], [Password]) VALUES (1, N'string', N'string', N'user@example.com', N'NRURXZN+WNYi02/weohzOcJJDb+D/JugdqOd/DMtEr8=:/RplfBcBaQsRGQt4gAATyg==')
INSERT [dbo].[Users] ([Id], [First_Name], [Last_Name], [Email], [Password]) VALUES (2, N'Bob', N'Test', N'bob-alkemy@yopmail.com', N'ch7RJX+NZnBXDJFIg7Zw1jnWGgEzGg7wFIPbDCwW86o=:IUFb8q8tmAM+idzYeCbYmA==')


SET IDENTITY_INSERT [dbo].[Users] OFF

GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (1, N'USD', 1)
INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (2, N'ARS', 1)
INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (3, N'USD', 2)
INSERT [dbo].[Accounts] ([Id], [Currency], [User_Id]) VALUES (4, N'ARS', 2)

SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Type], [Editable]) VALUES (1, N'Regular', 1)
INSERT [dbo].[Categories] ([Id], [Type], [Editable]) VALUES (2, N'Buy currency', 0)
INSERT [dbo].[Categories] ([Id], [Type], [Editable]) VALUES (3, N'Fixed term deposit', 0)
INSERT [dbo].[Categories] ([Id], [Type], [Editable]) VALUES (4, N'Transfer', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (1, 1000, N'carga inicial', CAST(N'2021-04-01T02:51:24.153' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (2, 100, N'Plazo Fijo (Apertura)', CAST(N'2021-04-01T02:52:09.240' AS DateTime), N'Payment', 2, 3)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (3, 100, N'carga 2', CAST(N'2021-04-08T02:55:50.987' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (4, 100, N'carga 3', CAST(N'2021-04-08T02:55:55.987' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (5, 100, N'carga 4', CAST(N'2021-04-08T02:55:58.660' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (6, 100, N'carga 5', CAST(N'2021-04-08T02:56:01.223' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (7, 100, N'carga 6', CAST(N'2021-04-08T02:56:05.103' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (8, 100, N'carga 7', CAST(N'2021-04-08T02:56:07.123' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (9, 100, N'carga 8', CAST(N'2021-04-08T02:56:09.810' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (10, 100, N'carga numero 9', CAST(N'2021-04-08T02:56:13.100' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (11, 100, N'carga numero 10', CAST(N'2021-04-08T02:56:16.800' AS DateTime), N'topup', 2, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (12, 10, N'Compra de divisas', CAST(N'2021-04-08T02:59:40.033' AS DateTime), N'Topup', 1, 2)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (13, 921.3, N'Compra de divisas', CAST(N'2021-04-08T02:59:40.033' AS DateTime), N'Payment', 2, 2)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (14, 1000, N'carga inicial', CAST(N'2021-04-10T02:51:24.153' AS DateTime), N'topup', 4, 1)
INSERT [dbo].[Transactions] ([Id], [Amount], [Concept], [Date], [Type], [Account_Id], [Category_Id]) VALUES (15, 100, N'Plazo Fijo (Apertura)', CAST(N'2021-04-10T02:52:09.240' AS DateTime), N'Payment', 4, 3)

SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[FixedTermDeposits] ON 

INSERT [dbo].[FixedTermDeposits] ([Id], [Amount], [Creation_Date], [Closing_Date], [Account_Id]) VALUES (1, 100, CAST(N'2021-04-01T02:52:09.230' AS DateTime), NULL, 2)
INSERT [dbo].[FixedTermDeposits] ([Id], [Amount], [Creation_Date], [Closing_Date], [Account_Id]) VALUES (2, 100, CAST(N'2021-04-10T02:52:09.230' AS DateTime), NULL, 4)

SET IDENTITY_INSERT [dbo].[FixedTermDeposits] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionLog] ON 

INSERT [dbo].[TransactionLog] ([Id], [Transaction_Id], [New_Value], [Modification_Date]) VALUES (1, 10, N'carga numero 10', CAST(N'2021-04-08T02:58:11.593' AS DateTime))
INSERT [dbo].[TransactionLog] ([Id], [Transaction_Id], [New_Value], [Modification_Date]) VALUES (2, 10, N'carga numero 9', CAST(N'2021-04-08T02:58:32.197' AS DateTime))
INSERT [dbo].[TransactionLog] ([Id], [Transaction_Id], [New_Value], [Modification_Date]) VALUES (3, 11, N'carga numero 10', CAST(N'2021-04-08T02:58:47.553' AS DateTime))
SET IDENTITY_INSERT [dbo].[TransactionLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Rates] ON 

INSERT [dbo].[Rates] ([Id], [Date], [Selling_price], [Buying_price]) VALUES (1, CAST(N'2021-04-08T02:59:40.027' AS DateTime), 98.13, 92.13)
SET IDENTITY_INSERT [dbo].[Rates] OFF
GO
