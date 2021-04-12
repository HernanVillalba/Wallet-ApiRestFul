USE [WALLET]
GO
SET IDENTITY_INSERT [dbo].[EmailTemplates] ON 

INSERT [dbo].[EmailTemplates] ([Id], [Title], [Body]) 
VALUES (1, N'Plazo fijo cerrado correctamente!', 
N'<h1>El plazo fijo #{0} se ha cerrado correctamente!</h1><br>Monto inicial: ${1}<br>Monto rescatado: ${2}<br>Intereses generados: ${3}')

INSERT [dbo].[EmailTemplates] ([Id], [Title], [Body]) 
VALUES (2, N'Solicitud de reembolso cancelada', 
N'<h1>Han cancelado la solicitud de reembolso #{0}</h1><br>El usuario ''{1}'' ha cancelado su solicitud de reembolso por la transaccion de id {2}')

SET IDENTITY_INSERT [dbo].[EmailTemplates] OFF