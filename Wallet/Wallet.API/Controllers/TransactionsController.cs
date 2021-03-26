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

namespace Wallet.API.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class TransactionsController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly TransactionBusiness tb;
        public TransactionsController(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            tb = new TransactionBusiness(_unitOfWork, mapper);
        }

        [HttpGet("{page}")]
        public async Task<IActionResult> GetAll(int? page)
        {
            try
            {
                //TransactionBusiness tb = new TransactionBusiness(_unitOfWork);
                var transactionsPagined = await tb.GetAll(page);
                if (transactionsPagined != null) { return Ok(transactionsPagined); }
                else { return BadRequest("No hya transacciones para mostrar"); }
            }
            catch (Exception ex) { return BadRequest(ex.Message); }
        }

        [HttpPost("Create")]
        public async Task<IActionResult> Create([FromBody] TransactionCreateModel NewTransaction)
        {
            //por ahora solo se realalizan transacciones en ARS
            if (ModelState.IsValid)
            {
                try
                {
                    var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                    int ARS_account_id = _unitOfWork.Accounts.GetAccountId(user_id, "ARS");
                    NewTransaction.AccountId = ARS_account_id;
                    await tb.Create(NewTransaction);
                    return Ok();
                }
                catch (Exception ex) { return BadRequest(ex.Message); }
            }
            else { return BadRequest(); }
        }

        [HttpPatch("Edit/{id}")]
        public async Task<IActionResult> Edit(int? id, [FromBody] TransactionEditModel NewTransaction)
        {

            if (ModelState.IsValid)
            {
                try
                {
                    if (id == null || id <= 0) { return BadRequest(); }
                    var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);

                    if (await tb.EditTransaction(id, NewTransaction, user_id)) { return Ok(); }
                    else { return BadRequest("No se encontró la transacción"); }
                }
                catch (Exception ex) { return BadRequest(ex.Message); }
            }
            else { return BadRequest(); }
        }

        [HttpGet("Details/{id}")]
        public IActionResult Details(int? id)
        {
            try
            {
                if (id == null || id <= 0) { return BadRequest("Id no válido"); }

                var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                var transaction = tb.GetDetails(id, user_id);

                if (transaction != null) { return Ok(transaction); }
                else { return BadRequest("No se encontró la transacción"); }

            }
            catch (Exception ex) { return BadRequest(ex.Message); }
        }

        [HttpPost("Filter")]
        public IActionResult Filter([FromBody] TransactionFilterModel transaction)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);

                    IEnumerable<Transactions> List = tb.Filter(transaction, user_id);

                    if (List != null) { return Ok(List); }
                    else { return BadRequest("No se encontró la transacción"); }
                }
                catch (Exception ex) { return BadRequest(ex.Message); }
            }
            else { return BadRequest(); }
        }

        [HttpGet("BuyCurrency")]
        public IActionResult BuyCurrencyAsync()
        {
            if (ModelState.IsValid)
            {
                try
                {
                    TransactionBuyCurrency tbc = new TransactionBuyCurrency();
                    var user_id = int.Parse(User.Claims.First(i => i.Type == "UserId").Value);
                    var dollar = tb.BuyCurrency();
                    return Ok(dollar);
                    
                }
                catch (Exception ex) { return BadRequest(ex.Message); }
            }
            else { return BadRequest(); }
        }
    }
}
