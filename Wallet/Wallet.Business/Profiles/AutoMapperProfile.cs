﻿using AutoMapper;
using Newtonsoft.Json.Linq;
using Wallet.Business.Operations;
using Wallet.Data.Models;
using Wallet.Entities;

namespace Wallet.Business.Profiles
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Users, RegisterModel>().ReverseMap();
            CreateMap<Users, LoginModel>().ReverseMap();
            CreateMap<Users, UserContact>().ReverseMap();
            CreateMap<Transactions, TransactionCreateModel>().ReverseMap();
            CreateMap<FixedTermDeposits, FixedTermDepositCreateModel>().ReverseMap();
            CreateMap<FixedTermDeposits, FixedTermDepositModel>().ReverseMap();
            CreateMap<Transactions, TransactionFilterModel>().ReverseMap();
        }
    }
}
