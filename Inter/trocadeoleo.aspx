<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="trocadeoleo.aspx.cs" Inherits="Inter.trocadeoleo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div>
            
        <div class="row text-center">
            <div class="col">
                <div>
                    <asp:Label ID="lblValidacaoManutencao" Text="" runat="server" ForeColor="Red" Font-Size="18px"/></div>
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


        <div class="row">
            <div class="col-3 text-end">
                <div class="container-fluid">
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalmanutencao">Inserir</button></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEditarManutencao">Editar</button></div>
                    <div><asp:Button id="btnEcluirManutencao" cssclass="btn btn-primary w-100 m-1" runat="server" Text="Excluir" OnClick="btnExcluirManutencao_Click" OnClientClick="return confirm('Deseja realmente remover este registro ?')"/></div>
                </div>
                
            </div>

            <div class="col-9"  style=" OVERFLOW: auto; HEIGHT:70vh; padding:1px; border:1px solid red">
                <asp:GridView ID="gridManutencao" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="w-100 text-center" Font-Size="10pt" HorizontalAlign="Center" CellSpacing="2" DataKeyNames="ID,KM_ATUAL,KM_PROXIMA_TROCA,FILTRO_AR,FILTRO_COMBUSTIVEL,FILTRO_RACOR,FILTRO_OLEO_MOTOR,QUANTIDADE_OLEO_MOTOR,FK_VEICULO" OnSelectedIndexChanged="gridManutencao_SelectedIndexChanged1">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                        <asp:BoundField DataField="DATA" HeaderText="Data" DataFormatString="{0:dd-MM-yyyy}" ></asp:BoundField>
                        <asp:BoundField DataField="VEICULO.PREFIXO" HeaderText="Veiculo"></asp:BoundField>
                        <asp:BoundField DataField="KM_ATUAL" HeaderText="Km"></asp:BoundField>
                        <asp:BoundField DataField="KM_PROXIMA_TROCA" HeaderText="Prox. Manutenção"></asp:BoundField>
                        <asp:BoundField DataField="FILTRO_AR" HeaderText="Filtro AR"></asp:BoundField>
                        <asp:BoundField DataField="FILTRO_COMBUSTIVEL" HeaderText="Filtro Combustivel"></asp:BoundField>
                        <asp:BoundField DataField="FILTRO_RACOR" HeaderText="Filtro Racor"></asp:BoundField>
                        <asp:BoundField DataField="FILTRO_OLEO_MOTOR" HeaderText="Filtro Oleo Motor"></asp:BoundField>
                        <asp:BoundField DataField="FILTRO_OLEO_1" HeaderText="Filtro Adicional"></asp:BoundField>
                        <asp:BoundField DataField="FILTRO_OLEO_2" HeaderText="Filtro Adicional"></asp:BoundField>
                        <asp:BoundField DataField="QUANTIDADE_OLEO_MOTOR" HeaderText="Qtd(L). Oleo Motor"></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle ForeColor="#8C4510" BackColor="#FFF7E7" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <sortedascendingcellstyle backcolor="#FFF1D4" />
                    <sortedascendingheaderstyle backcolor="#B95C30" />
                    <sorteddescendingcellstyle backcolor="#F1E5CE" />
                    <sorteddescendingheaderstyle backcolor="#93451F" />
                </asp:GridView>
            </div>

            <div class="modal fade" id="modalmanutencao" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalmanutencaolabel">Manutenção</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="Data" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Proxima Troca" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro de AR" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Combustivel" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Racor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Oleo Motor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Adicional" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Adicional" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Quantidade Oleo Motor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Prefixo do Veículo" runat="server" /></div>
                                </div>

                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox type="date" Id="txtDataManutencao" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKmManutencao" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtkmProximaManutencao" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroAr" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroCombustivel" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroRacor" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroOleoMotor" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroAdicional1" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroAdicional2" runat="server" /></div>
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
                            <h5 class="modal-title" id="modalManutencaolabel">Editar Manutenção</h5>
                        </div>
                        <div class="modal-body container">
                            <div class="row">
                                <div class="col-6">
                                    <div class="p-1 m-1"><asp:Label Text="Data" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="KM" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Proxima Troca" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro de AR" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Combustivel" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Racor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Oleo Motor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Adicional" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Filtro Adicional" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Quantidade Oleo Motor" runat="server" /></div>
                                    <div class="p-1 m-1"><asp:Label Text="Prefixo do Veículo" runat="server" /></div>
                                </div>

                                <div class="col-6">
                                    <div class="p-1"><asp:TextBox type="date" Id="txtDataManutencaoE" runat="server"  /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKmManutencaoE" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtKmProximaManutencaoE" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFltroArE" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroCombustivelE" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroRacorE" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroOleoMotorE" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroAdicional1E" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtFiltroAdicional2E" runat="server" /></div>
                                    <div class="p-1"><asp:TextBox Id="txtQtdOleoMotorE" runat="server" /></div>
                                    <div class="p-1"><asp:dropdownlist Id="ddlPrefixoE" runat="server" /></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:button Id="btnEditarManutencao" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" OnClick="btnEditarManutencao_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                        </div>
                    </div>
                </div>
            </div>

          

        </div>

    </div>
        </div>
    </section>
</asp:Content>
