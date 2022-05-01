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
                </div>
            </div>    
        </div>
        <div class="row p-3">
            <div class="col">
                <div class="container-fluid">
                    <asp:GridView ID="gridAbastecimento" runat="server" AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="DATA_ABASTECIMENTO" HeaderText="Data" />
                            <asp:BoundField DataField="KM" HeaderText="Km" />
                            <asp:BoundField DataField="POSTO" HeaderText="Posto" />
                            <asp:BoundField DataField="LITROS_COMBUSTIVEL" HeaderText="qtd. (Lts)" />
                            <asp:BoundField DataField="DISTANCIA_PERCORRIDA" HeaderText="Dist. Percorrida" />
                            <asp:BoundField HeaderText="Consumo Medio (KM/L)" />
                            <asp:BoundField DataField="VEICULO.PREFIXO" HeaderText="Veiculo" />
                            <asp:BoundField DataField="TANQUE.NOME" HeaderText="Tanque" />
                            <asp:BoundField DataField="FUNCIONARIO.NOME" HeaderText="Funcionario" />
                        </Columns>
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
                                    <div class="p-1"><asp:TextBox Type="Date" Id="txtData" runat="server" /></div>
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
                            <asp:button Id="btnSalvarAbastecimento" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnSalvvarAbastecimento_Click" />
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
                                    <div class="p-1 m-1"><asp:Label Text="Quantidade (Lts)" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Tanque" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox Id="TextBox3" runat="server" /></div>
                                    <div class="p-1"><asp:DropDownList Id="ddlTanque" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="Button2" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</asp:Content>
