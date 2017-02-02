using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace User.BU
{
    public partial class FriendList
    {
        public List<short> RequestFriendList(short accountId)
        {
            using (UserModelContainer context = new UserModelContainer())
            {
                IQueryable<FriendList> myFriendList = context.FriendListSet;
                List<short> mySecondFriendList = (
                    from g in myFriendList
                    where g.AccountIdOne == accountId
                    select g.AccountIdTwo).ToList();
                return mySecondFriendList;
            }
        }
    }
}