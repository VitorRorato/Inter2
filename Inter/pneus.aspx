<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="pneus.aspx.cs" Inherits="Inter.pneus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal fade" id="modalPneu" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Cadastrar Pneu</h5>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col text-center">
                            <div><asp:textbox cssClass="m-1 p-1 w-100 text-center" placeholder="Fabricante" runat="server" /></div>
                            <div><asp:textbox cssClass="m-1 p-1 w-100 text-center" placeholder="Medidas" runat="server" /></div>
                            <div><asp:textbox cssClass="m-1 p-1 w-100 text-center" placeholder="DOT" runat="server" /></div>
                            <div><asp:textbox cssClass="m-1 p-1 w-100 text-center" placeholder="Fabricante" runat="server" /></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:button Id="btnSalvarPneu" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" runat="server" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="">Voltar</button>
                </div>
            </div>
        </div>
    </div>





    <section class="conteudo">
        <div class="container-fluid">
            <div class="row">
                <div class="col-2 p-2 m-2">
                    <div> <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalPneu">Novo Pneu</button></div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
