USE [WALLET]

GO

SET IDENTITY_INSERT [dbo].[EmailTemplates] ON 

INSERT [dbo].[EmailTemplates] ([Id], [Title], [Body]) 
VALUES (1, N'Plazo fijo cerrado correctamente!', 
N'<h1>El plazo fijo #{0} se ha cerrado correctamente!</h1><br><p>Monto inicial: ${1}<br>Monto rescatado: ${2}<br>Intereses generados: ${3}</p>')

GO

INSERT [dbo].[EmailTemplates] ([Id], [Title], [Body]) 
VALUES (2, N'Solicitud de reembolso cancelada', 
N'<h1>Han cancelado la solicitud de reembolso #{0}</h1><br><p>El usuario ''{1}'' ha cancelado su solicitud de reembolso por la transaccion de id {2}</p>')

GO

INSERT [dbo].[EmailTemplates] ([Id], [Title], [Body]) 
VALUES (3, N'Solicitud de reembolso', 
N'<h1>Solicitud de reembolso</h1><br><p>El usuario ID {0} {1}, te ha solicitado que le reembolses ${2} por la transacción de ID {3}</p>')

INSERT [dbo].[EmailTemplates] ([Id], [Title], [Body]) 
VALUES (4, N'Solicitud de reembolso modificada',
N'<p>El usuario {0} {1}, Id {2} ha {3} la solicitud de reembolso por la transacción {4}</p>')

SET IDENTITY_INSERT [dbo].[EmailTemplates] OFF 
