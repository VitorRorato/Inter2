﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="veiculo.aspx.cs" Inherits="Inter.veiculo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="conteudo p-3">   
        <div class="row">
            <div class="col-3 text-end">
                <div class="container-fluid">
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalveiculo">Novo Veiculo</button></div>
                    <div><asp:Button id="btnExcluir" cssclass="btn btn-primary w-100 m-1" runat="server" Text="Excluir Veículo" OnClick="btnExcluir_Click" /></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEditar">Editar Veículo</button></div>
                </div>
                
            </div>

            <div class="col"  style=" OVERFLOW: auto; HEIGHT:35vh; padding:1px; border:1px solid red">
                    <asp:GridView id="gridVeiculo" CssClass="w-100" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" DataKeyNames="ID,PREFIXO,PLACA,KM_ATUAL,KM_COMPRA" OnSelectedIndexChanged="gridVeiculo_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="ID" HeaderText="Cód." Visible="False" />
                        <asp:BoundField DataField="PREFIXO" HeaderText="Prefixo" />
                        <asp:BoundField DataField="PLACA" HeaderText="Placa" />
                        <asp:BoundField DataField="KM_ATUAL" HeaderText="Km" />
                        <asp:BoundField DataField="KM_COMPRA" HeaderText="km Compra" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
            </div>

            <div class="modal fade" id="modalveiculo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalColaboradorlabel">Cadastrar novo Veículo</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="PLACA" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="PREFIXO" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox Id="txtPlaca" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtPrefixo" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKm" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnSalvarVeiculo" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnSalvarVeiculo_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalEditarlabel">Editar Cadastro Veiculo</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="PLACA" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="PREFIXO" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox Id="txtPlacaVeiculo" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtPrefixoVeiculo" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKmVeiculo" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnEditarVeiculo" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnEditarVeiculo_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

          

        </div>

        <div>
            </br>
            <hr />
            </br>
        </div>

        <div class="row">
            <div class="col-3 text-end">
                <div class="container-fluid">
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalmanutencao">Inserir Manutenção</button></div>
                    <div><asp:Button id="btnEcluirManutencao" cssclass="btn btn-primary w-100 m-1" runat="server" Text="Excluir Veículo" OnClick="btnExcluirManutencao_Click" /></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEditarManutencao">Editar Manutenção</button></div>
                </div>
                
            </div>

            <div class="col"  style=" OVERFLOW: auto; HEIGHT:35vh; padding:1px; border:1px solid red">
                <asp:GridView ID="gridManutencao" runat="server"></asp:GridView>
            </div>

            <div class="modal fade" id="modalmanutencao" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalmanutencaolabel">Cadastrar novo Veículo</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Proxima Troca" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro de AR" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Combustivel" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Racor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Oleo Motor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Quantidade Oleo Motor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Prefixo do Veículo" runat="server" /></div>
                                </div>

                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox Id="txtKmManutencao" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtkmProximaManutencao" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroAr" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroCombustivel" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroRacor" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroOleoMotor" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtQtdOleoMotor" runat="server" /></div>
                                    <div class="p-1"><asp:dropdownlist Id="ddlPrefixo" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnSalvarManutencao" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnSalvarManutencao_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="modalEditarManutencao" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalManutencaolabel">Editar Cadastro Veiculo</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="PLACA" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="PREFIXO" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                </div>
                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox Id="TextBox4" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="TextBox5" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="TextBox6" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="Button3" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnEditarVeiculo_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

          

        </div>

    </div>
</asp:Content>
