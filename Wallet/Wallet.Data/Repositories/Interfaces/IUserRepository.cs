﻿using System.Threading.Tasks;
using Wallet.Data.ModelsAPI;

namespace Wallet.Data.Repositories.Interfaces
{
    public interface IUserRepository : IGenericRepository<Users>
    {
        bool FindEmail(string email);
        Task<Users> FindUser(string email);
        Task AddAccounts(Users user);
    }
}
