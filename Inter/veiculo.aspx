<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="veiculo.aspx.cs" Inherits="Inter.veiculo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="conteudo p-3">   
        <div class="row">
            <div class="col-2">
                <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalveiculo">Novo Veiculo</button></div>
                <div><asp:Button id="btnExcluir" cssclass="btn btn-primary w-100 m-1" runat="server" Text="Excluir Veículo" /></div>
                <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEditar">Editar Colaborador</button></div>
            </div>
            <div class="col"  class="col-8"  style=" OVERFLOW: auto; HEIGHT:60vh; padding:1px;" class="col-8"  style=" OVERFLOW: auto; HEIGHT:60vh; border:1px solid white; padding:1px;">
                <asp:GridView runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="blue" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" DataKeyNames=",KM_COMPRA,KM_ATUAL">
                    <Columns>
                        <asp:CommandField HeaderText="Selecionar" ShowSelectButton="True"></asp:CommandField>
                        <asp:BoundField DataField="ID" HeaderText="Cód." Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="PREFIXO" HeaderText="Prefixo"></asp:BoundField>
                        <asp:BoundField DataField="PLACA" HeaderText="Placa"></asp:BoundField>
                        <asp:BoundField DataField="KM_ATUAL" HeaderText="km atual"></asp:BoundField>
                        <asp:BoundField DataField="KM_COMPRA" HeaderText="km inicio" Visible="False"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <sortedascendingcellstyle backcolor="#F1F1F1" />
                    <sortedascendingheaderstyle backcolor="#594B9C" />
                    <sorteddescendingcellstyle backcolor="#CAC9C9" />
                    <sorteddescendingheaderstyle backcolor="#33276A" />
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>
