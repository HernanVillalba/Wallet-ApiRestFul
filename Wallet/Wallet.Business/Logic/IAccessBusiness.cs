﻿using System.Threading.Tasks;
using Wallet.Data.Models;
using Wallet.Entities;

namespace Wallet.Business.Logic
{
    public interface IAccessBusiness
    {
        Task<bool> RegisterNewUser(RegisterModel newUser);
        Task<object> LoginUser(LoginModel userToMap);
    }
}