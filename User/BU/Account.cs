using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace User.BU
{
    public partial class Account
    {
        public string TranslateUserId(short accountId)
        {
            using (UserModelContainer context = new UserModelContainer())
            {
                IQueryable<Account> userAccounts = context.AccountSet;
                string username = (
                    from g in userAccounts
                    where g.Id == accountId
                    select g.Username).FirstOrDefault();
                return username;
            }
        }
    }
}