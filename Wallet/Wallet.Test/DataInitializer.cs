﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Wallet.Data.Models;

namespace Wallet.Test
{
    public static class DataInitializer
    {
        public static readonly List<object> lista = new()
        {
            new Users
            {                
                FirstName = "Juanpi",
                LastName = "Taladro",
                Email = "jt11@mail.com",
                Password = "Pass1234!"
            },
            new Accounts
            {
                Id = 1,
                Currency = "USD",
                UserId = 1
            },
            new Accounts
            {
                Id = 2,
                Currency = "ARS",
                UserId = 1
            },
        };              
        public static void Initialize(WALLETContext _context)
        {
            _context.AddRange(lista);
            _context.SaveChanges();
        }
    }
}