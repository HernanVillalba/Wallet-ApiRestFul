﻿namespace Wallet.Business
{
    public enum ENUM_EMAIL_TEMPLATES
    {
        FixedTermDepositClosed = 1,
        RefundRequestCanceled,
        /* New items here at the end; otherwise, modify the 
         * Database/Scripts/Script_Email_Templates.sql file to match
         */
    }
}
