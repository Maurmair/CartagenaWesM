<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UISendInvite.aspx.cs" Inherits="UI.Views.User.UISendInvite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    <h1>Vriend uitnodigen voor spel</h1>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Vriendenlijst tonen" />
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" Visible="False">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Vriend uitnodigen" Visible="False" />
        <br />
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
        <asp:HyperLink ID="HyperLink1" runat="server" Visible="False">[HyperLink1]</asp:HyperLink>
        <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
    </div>

</asp:Content>
