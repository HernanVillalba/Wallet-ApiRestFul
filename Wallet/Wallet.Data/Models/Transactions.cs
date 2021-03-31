﻿using System;
using System.Collections.Generic;
using Newtonsoft.Json;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace Wallet.Data.Models
{
    public partial class Transactions
    {
        public Transactions()
        {
            TransactionLog = new HashSet<TransactionLog>();
        }

        public int Id { get; set; }
        public double Amount { get; set; }
        public string Concept { get; set; }
        public DateTime Date { get; set; }
        public string Type { get; set; }
        public int AccountId { get; set; }
        public bool? Editable { get; set; }

        [JsonIgnore]
        public virtual Accounts Account { get; set; }
        [JsonIgnore]
        public virtual ICollection<TransactionLog> TransactionLog { get; set; }
    }
}
