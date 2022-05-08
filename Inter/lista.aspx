<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="lista.aspx.cs" Inherits="Inter.lista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="row">
            <div style="height:30vh; overflow:auto; margin-top:10px;" class="col-12">
                <asp:GridView CssClass="text-center m-auto" ID="gridCargo" Width="35%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID,NOME" OnSelectedIndexChanged="gridCargo_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                        <asp:BoundField DataField="NOME" HeaderText="Cargo"></asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57"></EditRowStyle>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>
                    <PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>
                    <RowStyle BackColor="#E3EAEB"></RowStyle>
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                    <SortedAscendingCellStyle BackColor="#F8FAFA"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#246B61"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#D4DFE1"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#15524A"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
            <div class="text-center">
                <asp:Label ID="lblValidacao" Text="" runat="server" ForeColor="Red" />
            </div>
            <div class="text-center">
                <asp:TextBox CssClass="text-center" ID="txtCargo" runat="server" placeholder="CARGO" />
            </div>
            <div style="margin-top:10px;" class="col-12 text-center">
                <span><asp:Button ID="btnSalvar" CssClass="btn btn-primary w-10 m-1" Text="Salvar Edição" runat="server" OnClick="btnSalvar_Click" /></span>
                <span><asp:Button ID="btnVoltar" CssClass="btn btn-primary w-10 m-1" Text="Voltar" runat="server" OnClick="btnVoltar_Click" /></span>
            </div>
        </div>
    </section>
</asp:Content>
