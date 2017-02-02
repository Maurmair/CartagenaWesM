using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using User.BU;

namespace User.CC
{
    public class CCSendInvite
    {
        private FriendList myFriendList = new FriendList();
        private Account myUserAccount = new Account();

        public List<string> GetFriendList(short accountId)
        {
            List<short> FriendListA = myFriendList.RequestFriendList(accountId);
            List<string> FriendListB = new List<string>();

            foreach (short i in FriendListA)
            {
                string name = this.myUserAccount.TranslateUserId(i);
                FriendListB.Add(name);
            }
            return FriendListB;
        }
    }
}