<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="listacategoria.aspx.cs" Inherits="Inter.listacategoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="row text-center">
            <div>
                <asp:Label ID="lblValidacao" ForeColor="Red" Font-Size="22px" Text="" runat="server" />
            </div>
            <div style="height:30vh; overflow:auto; margin-top:10px;" class="col-12">
                    <asp:GridView align="center" Width="50%" ID="gridCategoria" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="gridCategoria_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
                        <Columns>
                            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                            <asp:BoundField DataField="NOME" HeaderText="Categoria"></asp:BoundField>
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
            </div>
            <div class="row">
               <div class="col text-center">
                    <div><asp:TextBox ID="txtCategoria" CssClass="text-center" PlaceHolder="Categoria" runat="server" /></div>
                    <asp:Button ID="btnSalvar" CssClass="btn btn-primary w-10 m-1" Text="Salvar" runat="server" OnClick="btnSalvar_Click" />
                    <asp:Button ID="btnExcluir" CssClass="btn btn-primary w-10 m-1" Text="Excluir" runat="server" OnClick="btnExcluir_Click" />
                </div>
            </div>
    </section>
</asp:Content>
