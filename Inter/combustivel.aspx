<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="combustivel.aspx.cs" Inherits="Inter.combustivel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="row p-3">
            <div class="col-3">
                <div class="container-fluid">
                    <button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalTanque">Cadastrar Tanque</button>
                    <button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalCombustivel">Adicionar Combustivel</button>
                    <button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalAbastecimento">Novo Abastecimento</button>
                    <button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEditarAbastecimento">Editar Abastecimento</button>
                    <asp:Button CssClass="btn btn-primary w-100 m-1" ID="btnExcluirAbastecimento" Text="Excluir Abastecimento" runat="server" OnClick="btnExcluirAbastecimento_Click" />
                </div>
            </div>
            <div class="col-5">

            </div>
            <div class="col">
                <div class="container">
                    <div style="OVERFLOW: auto; HEIGHT:20vh; padding:1px;">
                <asp:GridView ID="gridTanque" Width="100%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <Columns>
                         <asp:BoundField DataField="DATA" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy}"></asp:BoundField>
                         <asp:BoundField DataField="QUANTIDADE" HeaderText="Quantidade"></asp:BoundField>
                         <asp:BoundField DataField="TANQUE.NOME" HeaderText="Tanque"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                </div>
                </div>
            </div>
            </div>    
        <div class="row text-center">
            <div class="col">
                <div><asp:Label ID="lblValidacao" Text="" runat="server" ForeColor="Red" Font-Size="18px" /></div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="container p-2">
                    <div class="text-end">
                        <asp:DropDownList ID="ddlBusca" height="35px" Font-Size="20px" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnBusca" Text="Buscar" runat="server" CssClass="btn btn-primary" OnClick="btnBusca_Click" />
                        <asp:Button ID="btnTodos" Text="Todos" runat="server" CssClass="btn btn-primary" OnClick="btnTodos_Click" />
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="row p-3">
                <div class="container-fluid">
                    <div style=" OVERFLOW: auto; HEIGHT:50vh;border:1px solid red; padding:1px;">
                        <asp:GridView CssClass="text-center" ID="gridAbastecimento" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" DataKeyNames="ID" OnSelectedIndexChanged="gridAbastecimento_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                                <asp:BoundField DataField="DATA_ABASTECIMENTO"  HeaderText="Data" DataFormatString="{0:dd-MM-yyyy}" />
                                <asp:BoundField DataField="VEICULO.PREFIXO" HeaderText="Veiculo" />
                                <asp:BoundField DataField="KM" HeaderText="Km" />
                                <asp:BoundField DataField="POSTO" HeaderText="Local" />
                                <asp:BoundField DataField="LITROS_COMBUSTIVEL" HeaderText="Litros" />
                                <asp:BoundField DataField="DISTANCIA_PERCORRIDA" HeaderText="Distancia Percorrida" />
                                <asp:BoundField DataField="CONSUMO_MEDIO" HeaderText="Km/L" />
                                <asp:BoundField DataField="FUNCIONARIO.NOME" HeaderText="Responsavel" />
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
                        </asp:GridView>
                    </div>
                </div>
        </div>



        <div class="modal fade" id="modalTanque" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalTanquelabel">Cadastrar Tanque de Combustivel</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="Nome" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Capacidade (Lts)" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox Id="txtNomeTanque" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtCapacidadeTanque" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnSalvarTanque" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnSalvarTanque_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

        <div class="modal fade" id="modalAbastecimento" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAbastecimentolabel">Inserir Abastecimento</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="Data" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Local" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Litros" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Veiculo" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Tanque" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Funcionario" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div>
                                        
                                    </div>
                                    <div class="p-1"><asp:TextBox TextMode="Date" Id="txtData" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKm" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtLocal" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtLitros" runat="server" /></div>
                                    <div class="p-1"><asp:DropDownList ID="ddlVeiculo" runat="server"></asp:DropDownList></div>
                                    <div class="p-1"><asp:DropDownList ID="ddlTanqueAbastecimento" runat="server"></asp:DropDownList></div>
                                    <div class="p-1"><asp:DropDownList ID="ddlFuncionario" runat="server"></asp:DropDownList></div>

                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnSalvarAbastecimento" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnSalvarAbastecimento_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

        <div class="modal fade" id="modalEditarAbastecimento" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalEditarAbastecimentolabel">Editar Abastecimento</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="Data" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Local" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Litros" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Veiculo" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Tanque" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Funcionario" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Distancia" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Km/L" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div>
                                        
                                    </div>
                                    <div class="p-1"><asp:TextBox TextMode="Date" Id="txtDataEditar" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKmEditar" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtLocalEditar" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtLitrosEditar" runat="server" /></div>
                                    <div class="p-1"><asp:DropDownList ID="ddlVeiculoEditar" runat="server"></asp:DropDownList></div>
                                    <div class="p-1"><asp:DropDownList ID="ddlTanqueEditar" runat="server"></asp:DropDownList></div>
                                    <div class="p-1"><asp:DropDownList ID="ddlFuncionarioEditar" runat="server"></asp:DropDownList></div>
                                    <div class="p-1"><asp:TextBox Id="txtDistancia" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKmL" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnEditarAbastecimento" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnEditarAbastecimento_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

        <div class="modal fade" id="modalCombustivel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalCombustivellabel">Adicionar Combustivel</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="Data" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Quantidade (Lts)" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Tanque" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox type="Date" Id="txtDataCombustivel" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtQuantidadeCombustivel" runat="server" /></div>
                                    <div class="p-1"><asp:DropDownList Id="ddlTanque" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnSalvarCombustivel" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnSalvarCombustivel_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
