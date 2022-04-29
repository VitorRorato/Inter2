<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="Inter.principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="container-fluid">
            <div class="container">
                <div class="row p-5">
                    <div class="col-5 borda p-5">
                        <div class="row">
                            <span><asp:Label Text="Combustivel disponivel para abastecimento:" runat="server" /><asp:Label Id="lblcombustivel" Text="a" runat="server" ></asp:Label></span> 
                        </div>
                        <div class="row">
                            <span><asp:Label Text="Ultimo abastecimento: " runat="server" /><asp:Label Id="lblabastecimento" Text="a" runat="server" ></asp:Label></span>
                        </div>
                    </div>
                    <div class="offset-2 col-5 borda p-5">
                        <div class="row">
                            <span><asp:Label Text="Total de Veiculos: " runat="server" /><asp:Label Id="lblVeiculo" Text="a" runat="server" /></span>
                        </div>
                        <div>
                            <span><asp:Label Text="Ultima manutenção realizada: " runat="server" /><asp:Label Id="lblManutencao" Text="a" runat="server" /></span>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
    </section>
</asp:Content>
