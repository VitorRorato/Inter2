<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="estoque.aspx.cs" Inherits="Inter.estoque" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="modal fade" id="modalCategoria" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Cadastrar Categoria de Produto</h5>
                </div>
                <div class="modal-body text-center">
                    <span><asp:Label Text="Nome: " runat="server" /><asp:TextBox Id="txtCategoria" runat="server" /></span>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnLista" CssClass="btn btn-primary" Text="Lista" runat="server" OnClick="btnLista_Click"/>
                    <asp:button Id="btnSalvarCategoria" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" runat="server" OnClick="btnSalvarCategoria_Click" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalProduto">Voltar</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalProduto" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Novo Produto</h5>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col-6">
                            <div class="p-1 m-1"><asp:Label Text="Codigo de identificação" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Categoria" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Quantidade" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Aplicação" runat="server" /></div>
                        </div>
                        <div class="col-6">
                            <div class="p-1"><asp:TextBox Id="txtCodigo" runat="server" /></div>
                            <div class="p-1"><asp:DropDownList Id="ddlCategoria" runat="server"></asp:DropDownList></div>
                            <div class="p-1"><asp:TextBox Id="txtQuantidade" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtAplicacao" runat="server" /></div>
                            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCategoria">Categoria</button>
                    <asp:button Id="btnSalvarItem" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" runat="server" OnClick="btnSalvarItem_Click" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalProduto" >Voltar</button>
                    
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="modalEntrada" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Entrada</h5>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col">
                            <div class="p-1 m-1"><asp:Label Text="Codigo" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Quantidade" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Data" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Funcionario" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Fornecedor" runat="server" /></div>
                        </div>
                        <div class="col-8">
                            <div class="p-1"><asp:DropDownList CssClass="w-100 text-center" Id="ddlProdutoEntrada" runat="server"></asp:DropDownList></div>
                            <div class="p-1"><asp:TextBox CssClass="w-100 text-center" Id="txtQuantidadeEntrada" runat="server" /></div>
                            <div class="p-1"><asp:TextBox CssClass="w-100 text-center" type="Date" Id="txtDataEtrada" runat="server" /></div>
                            <div class="p-1"><asp:DropDownList CssClass="w-100 text-center" Id="ddlFuncionarioEntrada" runat="server"></asp:DropDownList></div>
                            <div class="p-1"><asp:DropDownList CssClass="w-100 text-center" Id="ddlFornecedorEntrada" runat="server"></asp:DropDownList></div>

                            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:button Id="btnSalvarEntrada" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" runat="server" OnClick="btnSalvarEntrada_Click" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="" >Voltar</button>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalProdutoEditar" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Editar Produto</h5>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col-6">
                            <div class="p-1 m-1"><asp:Label Text="Codigo de identificação" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Categoria" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Quantidade" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Aplicação" runat="server" /></div>
                        </div>
                        <div class="col-6">
                            <div class="p-1"><asp:TextBox Id="txtEditarCodigo" runat="server" /></div>
                            <div class="p-1"><asp:DropDownList Id="ddlEditarCategoria" runat="server"></asp:DropDownList></div>
                            <div class="p-1"><asp:TextBox Id="txtEditarQuantidade" runat="server" /></div>
                            <div class="p-1"><asp:TextBox Id="txtEditarAplicao" runat="server" /></div>
                            
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:button Id="btnEditarItem" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" OnClick="btnEditarItem_Click" runat="server" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="" >Voltar</button>
                    
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="modalSaida" tabindex="-1" aria-labelledby="" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" >Entrada</h5>
                </div>
                <div class="modal-body text-center">
                    <div class="row">
                        <div class="col">
                            <div class="p-1 m-1"><asp:Label Text="Codigo" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Quantidade" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Data" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Funcionario" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="Veiculo" runat="server" /></div>
                        </div>
                        <div class="col-8">
                            <div class="p-1"><asp:DropDownList CssClass="w-100 text-center" Id="ddlProdutoSaida" runat="server"></asp:DropDownList></div>
                            <div class="p-1"><asp:TextBox CssClass="w-100 text-center" Id="txtQuantidadeSaida" runat="server" /></div>
                            <div class="p-1"><asp:TextBox CssClass="w-100 text-center" type="Date" Id="txtDataSaida" runat="server" /></div>
                            <div class="p-1"><asp:DropDownList CssClass="w-100 text-center" Id="ddlFuncionarioSaida" runat="server"></asp:DropDownList></div>
                            <div class="p-1"><asp:DropDownList CssClass="w-100 text-center" Id="ddlVeiculoSaida" runat="server"></asp:DropDownList></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:button Id="btnSalvarSaida" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" OnClick="btnSalvarSaida_Click" runat="server" />
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="" >Voltar</button>
                </div>
            </div>
        </div>
    </div>




    <section class="conteudo">

        <div class="row p-2">
                <div class="col">
                    <div class="p-1 text-end">
                        <asp:CheckBox ID="chkTodos" Text="Todos" runat="server" />
                        <asp:DropDownList ID="ddlBuscaCategoria" runat="server"></asp:DropDownList>
                        <asp:TextBox ID="txtBusca" PlaceHolder="BUSCAR" runat="server" />
                        <asp:Button CssClass="btn btn-primary botao" ID="btnBusca" Text="Buscar" runat="server" OnClick="btnBusca_Click" />
                    </div>
                </div>
                
            </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 text-center">
                    <asp:Label ID="lblValidacao" Font-Size="22px" ForeColor="Red" Text="" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-2 p-2 m-2">
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalProduto">Novo Produto</button></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalProdutoEditar">Editar Produto</button></div>
                    <div><asp:Button id="btnExcluir" cssclass="btn btn-primary w-100 m-1" runat="server" Text="Excluir Produto" OnClick="btnExcluir_Click" OnClientClick="return confirm('Deseja realmente remover este registro ?')"/></div>
                    
                </div>
                <div class="col p-2 m-2 text-center">
                    <div class="col"  style=" OVERFLOW: auto; HEIGHT:35vh; padding:1px; border:1px solid red">
                        <asp:GridView ID="gridEstoque" runat="server" CssClass="w-100" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="ID" OnSelectedIndexChanged="gridEstoque_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="CODIGO" HeaderText="Codigo" />
                                <asp:BoundField DataField="QUANTIDADE" HeaderText="Quantidade" />
                                <asp:BoundField DataField="CATEGORIA.NOME" HeaderText="Categoria" />
                                <asp:BoundField DataField="APLICACAO" HeaderText="Aplicação" />
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
        
        <hr style="color:black;" />

            <div class="row p-2">
                <div class="col">
                    <div class="p-1 text-end">
                        <asp:DropDownList runat="server">
                            <asp:ListItem Text="Ambos" />
                            <asp:ListItem Text="Entrada" />
                            <asp:ListItem Text="Saida" />
                        </asp:DropDownList>
                        <asp:TextBox ID="txtBuscaData" Type="Date" runat="server" />
                        <asp:Button CssClass="btn btn-primary botao" ID="btnBuscaData" Text="Buscar" runat="server" />
                    </div>
                </div>
                
            </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-2">
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEntrada">Inserir Estoque</button></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalSaida">Baixa de Estoque</button></div>
                </div>
                <div class="col m-1 text-center" style=" OVERFLOW: auto; HEIGHT:50vh; padding:1px; border:1px solid red">
                    <h5>ENTRADA</h5>
                    <asp:GridView ID="gridEntrada" width="100%" runat="server" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="PaleGoldenrod"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="DATA" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                            <asp:BoundField DataField="PRODUTO.CODIGO" HeaderText="Item"></asp:BoundField>
                            <asp:BoundField DataField="QUANTIDADE" HeaderText="Quantidade"></asp:BoundField>
                        </Columns>

                        <FooterStyle BackColor="Tan"></FooterStyle>
                        <HeaderStyle BackColor="Tan" Font-Bold="True"></HeaderStyle>
                        <PagerStyle HorizontalAlign="Center" BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue"></PagerStyle>
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite"></SelectedRowStyle>
                        <SortedAscendingCellStyle BackColor="#FAFAE7"></SortedAscendingCellStyle>
                        <SortedAscendingHeaderStyle BackColor="#DAC09E"></SortedAscendingHeaderStyle>
                        <SortedDescendingCellStyle BackColor="#E1DB9C"></SortedDescendingCellStyle>
                        <SortedDescendingHeaderStyle BackColor="#C2A47B"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </div>
                <div class="col m-1 text-center"  style=" OVERFLOW: auto; HEIGHT:50vh; padding:1px; border:1px solid red">
                    <h5>SAIDA</h5>
                    <asp:GridView ID="gridSaida" runat="server" Width="100%" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="PaleGoldenrod"></AlternatingRowStyle>
                        <Columns>
                            <asp:BoundField DataField="DATA" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                            <asp:BoundField DataField="PRODUTO.CODIGO" HeaderText="Item"></asp:BoundField>
                            <asp:BoundField DataField="QUANTIDADE" HeaderText="Quantidade"></asp:BoundField>
                            <asp:BoundField DataField="VEICULO.PREFIXO" HeaderText="Veiculo"></asp:BoundField>
                        </Columns>

                        <FooterStyle BackColor="Tan"></FooterStyle>
                        <HeaderStyle BackColor="Tan" Font-Bold="True"></HeaderStyle>
                        <PagerStyle HorizontalAlign="Center" BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue"></PagerStyle>
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite"></SelectedRowStyle>
                        <SortedAscendingCellStyle BackColor="#FAFAE7"></SortedAscendingCellStyle>
                        <SortedAscendingHeaderStyle BackColor="#DAC09E"></SortedAscendingHeaderStyle>
                        <SortedDescendingCellStyle BackColor="#E1DB9C"></SortedDescendingCellStyle>
                        <SortedDescendingHeaderStyle BackColor="#C2A47B"></SortedDescendingHeaderStyle>
                    </asp:GridView>
                </div>
            </div>
        </div>

    </section>
</asp:Content>
