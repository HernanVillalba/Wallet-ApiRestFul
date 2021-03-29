﻿using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using Wallet.Entities;
using Wallet.Data.Repositories.Interfaces;
using Wallet.Data.Models;
using System;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using X.PagedList;
using Wallet.Business.Logic;
using System.Net.Http;
using Wallet.Business.Operations;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using Wallet.Business;

namespace Wallet.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionsController : ControllerBase
    {

        ////////////////////////////////////////////////////////////////////////////falta pasar el business como interfaz////////////////////////////////////////////////////////////////////////////

        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly TransactionBusiness tb;
        public TransactionsController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            tb = new TransactionBusiness(_unitOfWork, mapper);
        }

        /// <summary>
        /// Listar todas las transacciones ordenadas por fecha descendente y paginadas de a 10
        /// </summary>
        /// <param name="page">Página</param>
        [HttpGet("{page}")]
        public async Task<IActionResult> GetAll(int? page)
        {
            try
            {
                if (page == null || page <= 0) { page = 1; } //asigna la primer página
                int pageNumber = (int)page, pageSize = 10; //10 registros por página

                var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                var ListDB = await tb.GetAll(user_id);
                return Ok(await ListDB.ToPagedList(pageNumber, pageSize).ToListAsync());
            }
            catch { throw; }
        }


        /// <summary>
        /// Crear una transacción en pesos
        /// </summary>
        [HttpPost("Create")]
        public async Task<IActionResult> Create([FromBody] TransactionCreateModel newT)
        {
            //por ahora solo se realalizan transacciones en ARS
            try
            {
                var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                int ARS_account_id = _unitOfWork.Accounts.GetAccountId(user_id, "ARS");
                newT.AccountId = ARS_account_id;
                await tb.Create(newT);
                return Ok();
            }
            catch (Exception) { throw new CustomException(404, "No se pudo crear la transacción"); }

        }

        /// <summary>
        /// Editar una transacción
        /// </summary>
        /// <param name="id">Id de la transacción</param>
        /// <param name="NewTransaction">Transacción</param>
        /// <returns></returns>
        [HttpPatch("Edit/{id}")]
        public async Task<IActionResult> Edit(int? id, [FromBody] TransactionEditModel NewTransaction)
        {
            try
            {
                if (id == null || id <= 0) { return BadRequest(); }
                var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                await tb.Edit(id, NewTransaction, user_id);
                return Ok("Transacción actualizada con éxito");
            }
            catch { throw; }
        }

        /// <summary>
        /// Mostrar los detalles de una transacción en específico por Id
        /// </summary>
        /// <param name="id">Id de la transacción</param>
        /// <returns></returns>
        [HttpGet("Details/{id}")]
        public IActionResult Details(int? id)
        {
            try
            {
                if (id == null || id <= 0) { throw new CustomException(400, "Id de la transacción no válido"); }
                var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                var transaction = tb.Details(id, user_id);
                return Ok(transaction);
            }
            catch { throw; }
        }

        /// <summary>
        /// Filtrar transacción por campos
        /// </summary>
        /// <param name="transaction">Transacción</param>
        /// <returns></returns>
        [HttpPost("Filter")]
        public IActionResult Filter([FromBody] TransactionFilterModel transaction)
        {
            try
            {
                var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                return Ok(tb.Filter(transaction, user_id));
            }
            catch { throw; }
        }

        /// <summary>
        /// Comprar divisas
        /// </summary>
        /// <param name="tbc">Transacción</param>
        /// <returns></returns>
        /// <remarks>Ingrese si va a comprar o vender, el tipo de divisa y el monto</remarks>
        [HttpPost("BuyCurrency")]
        public async Task<IActionResult> BuyCurrencyAsync([FromBody] TransactionBuyCurrency tbc)
        {
            try
            {
                var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                await tb.BuyCurrency(tbc, user_id);
                return Ok("Transacción realizada con éxito");
            }
            catch { throw; }
        }


        /// <summary>
        /// Transferir dinero de una cuenta propia a otra cuenta existente de la misma moneda
        /// </summary>
        /// <remarks>Ingrese la cuenta de origen, el monto y por último la cuenta de destino</remarks>
        [HttpPost("Transfer")]
        public async Task<IActionResult> Transfer([FromBody] TransferModel newTransfer)
        {
            try
            {
                var userId = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                await tb.Transfer(newTransfer, userId);
                return Ok("Transferencia realizada");
            }
            catch { throw; }
        }
    }
}

