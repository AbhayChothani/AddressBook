<%@ Page Title="" Language="C#" MasterPageFile="~/Content/Addressbook.master" AutoEventWireup="true" CodeFile="StateList.aspx.cs" Inherits="AdminPanel_State_StateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContnet" Runat="Server">
    <div class="row">
        <div class="col-md-12">
            <h2>State List</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
           <asp:Label runat="server" ID="lblMessage" EnableViewState="False" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="text-right">
                <asp:HyperLink runat="server" ID="hlAddState" Text="Add New State" CssClass="btn btn-default mb-4" NavigateUrl="/AdminPanel/State/Add" BackColor="Black" Font-Size="Medium" ForeColor="White" />
            </div>
            <div>
             <asp:GridView ID="gvState" CssClass="table table-hover" runat="server" OnRowCommand="gvState_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button runat="server" ID="btnDelete" Text="Delete" CssClass="btn btn-danger btn-sm" CommandName="DeleteRecord" CommandArgument='<%# Eval("StateID").ToString() %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:HyperLink runat="server" ID="btnEdit" Text="Edit" NavigateUrl='<%# "/AdminPanel/State/Edit/" +Eval("StateID").ToString().Trim() %>' CssClass=" btn btn-info"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            </div>
        </div>
    </div>
</asp:Content>

