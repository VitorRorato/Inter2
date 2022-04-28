<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="combustivel.aspx.cs" Inherits="Inter.combustivel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="row p-3">
            <div class="col-2">
                <div class="container">
                    <asp:Button CssClass="btn btn-success m-1 botao1" ID="Button1" runat="server" Text="Cadastrar Tanque" />
                    <asp:Button CssClass="btn btn-success m-1 botao1" ID="Button2" runat="server" Text="Adicionar Combustivel" />
                </div>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <asp:Label Text="Tanque" runat="server" />
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:Label Text="Quantidade (Lts)" runat="server" />
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <asp:Label Text="Data" runat="server" />
                        </div>
                        <div class="col">
                            <asp:TextBox runat="server" />
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-6">
                <asp:GridView Id="gridAbastecimento" runat="server"></asp:GridView>
            </div>
            <div class="col-4">
                <asp:GridView Id="gridCombustivel" runat="server"></asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>
