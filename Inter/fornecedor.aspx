<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="fornecedor.aspx.cs" Inherits="Inter.fornecedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="modal fade" id="modalFornecedor" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Novo Fornecedor</h5>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col-6">
                            <div class="p-1 m-1"><asp:Label Text="Nome" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="CNPJ" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Cidade" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Estado" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Contato" runat="server" /></div>
                        </div>
                        <div class="col-6">
                            <div class="p-1"><asp:TextBox Id="txtNomeFornecedor" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtCnpjFornecedor" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtCidade" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtUfFornecedor" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtContatoFornecedor" runat="server" /></div>

                            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:button Id="btnSalvar" class="btn btn-primary" data-bs-dismiss="none" OnClick="btnSalvar_Click" Text="Salvar" runat="server" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="" >Voltar</button>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalEditarFornecedor" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Editar Fornecedor</h5>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col-6">
                            <div class="p-1 m-1"><asp:Label Text="Nome" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="CNPJ" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Cidade" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Estado" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Contato" runat="server" /></div>
                        </div>
                        <div class="col-6">
                            <div class="p-1"><asp:TextBox Id="txtNomeEditar" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtCnpjEditar" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtCidadeEditar" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtEstadoEditar" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtContatoEditar" runat="server" /></div>

                            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:button Id="btnEditar" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" OnClick="btnEditar_Click" runat="server" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="" >Voltar</button>
                    
                </div>
            </div>
        </div>
    </div>





    <section class="conteudo">
        <div class="container-fluid">
              <div class="row p-2">
                <div class="col">
                    <div class="p-1 text-end">
                        <asp:DropDownList ID="ddlBusca" runat="server">
                            <asp:ListItem Text="CNPJ" />
                            <asp:ListItem Text="NOME" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtBusca" PlaceHolder="BUSCAR" runat="server" />
                        <asp:Button CssClass="btn btn-primary botao" ID="btnBusca" Text="Buscar" runat="server" OnClick="btnBusca_Click" />
                    </div>
                </div>
                
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <asp:Label ID="lblValidacao" Font-Size="22px" ForeColor="Red" Text="" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-2 p-2 m-2">
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalFornecedor">Novo Fornecedor</button></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEditar">Editar Fornecedor</button></div>
                    <div><asp:Button id="btnExcluir" cssclass="btn btn-primary w-100 m-1" runat="server" Text="Excluir Fornecedor" OnClick="btnExcluir_Click" OnClientClick="return confirm('Deseja realmente remover este registro ?')"/></div>
                    
                </div>
                <div class="col p-2 m-2 text-center">
                    <div class="col"  style=" OVERFLOW: auto; HEIGHT:80vh; padding:1px; border:1px solid red">
                        <asp:GridView ID="gridFornecedor" runat="server" CssClass="w-100" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="ID">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="NOME" HeaderText="Nome" />
                                <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" />
                                <asp:BoundField DataField="CIDADE" HeaderText="Cidade" />
                                <asp:BoundField DataField="ESTADO" HeaderText="Estado" />
                                <asp:BoundField DataField="CONTATO" HeaderText="Contato"></asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>

    </section>

</asp:Content>
