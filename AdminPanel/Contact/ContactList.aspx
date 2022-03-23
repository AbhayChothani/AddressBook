<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Addressbook.master" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="AdminPanel_Contact_ContactList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
    <style>
        .gridview {
            overflow: scroll;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContnet" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h2>Contact List</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label runat="server" ID="lblMessage" EnableViewState="False" />
        </div>
    </div>
    <div class="row">
        <div class="text-right">
            <asp:HyperLink runat="server" ID="hlAddContact" Text="Add New Contact" CssClass="btn btn-default mb-4" NavigateUrl="/AdminPanel/Contact/Add" BackColor="Black" Font-Size="Medium" ForeColor="White" />

        </div>
        <div class="col-md-12 gridview">

            <%-- <asp:GridView ID="gvContact" CssClass="table table-hover"  runat="server" OnRowCommand="gvContact_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">

                <Columns>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactID").ToString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="btnEdit" Text="Edit" NavigateUrl='<%# "~/AdminPanel/Contact/ContactAddEdit.aspx?CityID=" +Eval("ContactID").ToString() %>' CssClass=" btn btn-info" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Photo">
                       <%-- <ItemTemplate>
                            <asp:Image runat="server"  ID="imgContactPhotoPath" ImageUrl='<%# Eval("ContactPhotoPath") %>' Height="50px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>--%>
            <asp:GridView AutoGenerateColumns="false" ID="gvContact" runat="server" CssClass="table table-bordered" OnRowCommand="gvContact_RowCommand">
                <Columns>
                     <asp:TemplateField  HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnDelete" OnClientClick="return confirm('Are you sure you want to delete this Contact?')" CssClass="btn btn-danger btn-sm" Text="Delete" CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="hlEdit" CssClass="btn btn-info" Text="Edit" NavigateUrl='<%# "/AdminPanel/Contact/Edit/"+ Eval("ContactID").ToString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ContactID" HeaderText="ContactID" />
                    <asp:BoundField DataField="ContactName" HeaderText="ContactName" />
                    <asp:TemplateField HeaderText="Photo">
                        <ItemTemplate>
                            <asp:Image runat="server" ID="imgPhoto" ImageUrl='<%# Eval("ContactPhotoPath") %>' Height="50" />
                        </ItemTemplate>
                    </asp:TemplateField>
                   
                    <asp:BoundField DataField="ContactCategoryName" HeaderText="ContactCategoryName" />
                    <asp:BoundField DataField="ContactNo" HeaderText="ContactNo " />
                    <asp:BoundField DataField="StateName" HeaderText="State" />
                    <asp:BoundField DataField="WhatsAppNo" HeaderText="WhatsAppNo" />
                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Age" HeaderText="Age" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="CityName" HeaderText="CityName" />
                    <asp:BoundField DataField="StateName" HeaderText="StateName" />
                    <asp:BoundField DataField="CountryName" HeaderText="CountryName" />
                    <asp:BoundField DataField="BloodGroup" HeaderText="BloodGroup" />
                    <asp:BoundField DataField="LinkedlNID" HeaderText="LinkedlNID" />
                    <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" />



                </Columns>

            </asp:GridView>



            <alternatingrowstyle backcolor="White" />
            <editrowstyle backcolor="#2461BF" />
            <footerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
            <headerstyle backcolor="#507CD1" font-bold="True" forecolor="White" />
            <pagerstyle backcolor="#2461BF" forecolor="White" horizontalalign="Center" />
            <rowstyle backcolor="#EFF3FB" />
            <selectedrowstyle backcolor="#D1DDF1" font-bold="True" forecolor="#333333" />
            <sortedascendingcellstyle backcolor="#F5F7FB" />
            <sortedascendingheaderstyle backcolor="#6D95E1" />
            <sorteddescendingcellstyle backcolor="#E9EBEF" />
            <sorteddescendingheaderstyle backcolor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="Data Source=LAPTOP-U7E5M6G1;Initial Catalog=AddressBook;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [ContactID], [ContactPhotoPath], [ContactName], [ContactNo], [WhatsAppNo], [BirthDate], [Email], [Age], [Address], [BloodGroup], [FacebookID], [LinkedlNid], [CreationDate] FROM [Contact]"></asp:SqlDataSource>
        </div>

    </div>
</asp:Content>

