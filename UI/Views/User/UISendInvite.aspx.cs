using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using User.CC;
namespace UI.Views.User
{
    public partial class UISendInvite : System.Web.UI.Page
    {
        StringBuilder sB = new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["AccountId"] = 1;
            Session["GameId"] = 254;
        }

        /// <summary>
        /// Button 1
        /// ATTENTION: USING '1' AS ACCOUNT FOR TESTING REASONS -> THIS SHOULD BE CHANGED TO SESSION["accountId"]
        /// Create an instance of CCSendInvite Class
        /// Get Friend List
        /// Bind List to DDL
        /// Show DDL
        /// Show Button 2
        /// </summary>
        /// <param name="sender"> Standard parameter</param>
        /// <param name="e"> Standard par</param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            short AccountId = Convert.ToInt16(Session["AccountId"]);
            CCSendInvite myCC = new CCSendInvite();
            DropDownList1.DataSource = myCC.GetFriendList(AccountId);
            DropDownList1.DataBind();
            DropDownList1.Visible = true;
            Button2.Visible = true;
        }

        /// <summary>
        /// Button 2
        /// Get value of DDL
        /// Show Label 1
        /// Update Label1 text
        /// Label2 simulates chat message to new player
        /// </summary>
        /// <param name="sender"> Standard parameter</param>
        /// <param name="e"> Standard par</param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            string selectedFriend = DropDownList1.SelectedValue;
            sB.Append("http://localhost:62286/Views/User/UIAcceptInvite.aspx?");
            sB.Append("&Username=" + selectedFriend);
            sB.Append("&GameId=" + Session["GameId"]);
            sB.ToString();

            Session["SelectedFriend"] = selectedFriend;
            Label1.Visible = true;
            Label1.Text = selectedFriend + " is uitgenodigd voor het spel";
            Label2.Visible = true;
            Label2.Text = "Klik op deze ";
            HyperLink1.Visible = true;
            HyperLink1.NavigateUrl = sB.ToString();
            HyperLink1.Text = "link";
            Label3.Visible = true;
            Label3.Text = "om het spel te joinen";
        }
    }
}