﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Wallet.Data.Models;
using Wallet.Entities;

namespace Wallet.Business.Logic
{
    public interface IUserBusiness
    {
        Task<bool> RegisterNewUser(RegisterModel newUser);
        IEnumerable<UserContact> PagedUsers(int page, int pageSize);
        UserContact GetUserDetails(int userId);
    }
}
