<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="colaborador.aspx.cs" Inherits="Inter.colaborador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col">
                    <div><asp:Label Id="lblValidacao" Text="" runat="server" ForeColor="Red" Font-Size="18" /></div>
                </div>
            </div>
            <div class="row p-2">
                <div class="col">
                    <div class="p-1 text-end"><asp:TextBox ID="txtBusca" PlaceHolder="BUSCAR" runat="server" />
                        <asp:Button CssClass="btn btn-primary botao" ID="btnBusca" Text="Buscar" runat="server" OnClick="btnBusca_Click" />
                    </div>
                </div>
                
            </div>
            
            <div class="row">
               
                <div class="col">
                    <div><button id="modal" type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalCargo">Novo Cargo</button></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalColaborador">Novo Colaborador</button></div>
                    <div><asp:Button id="btnEcluir" cssclass="btn btn-primary w-100 m-1" runat="server" Text="Excluir Colaborador" OnClick="btnEcluir_Click" /></div>
                    <div><button type="button" class="btn btn-primary w-100 m-1" data-bs-toggle="modal" data-bs-target="#modalEditar">Editar Colaborador</button></div>
                    


                        <div class="modal fade" id="modalCargo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="modalCargolabel">Cadastrar novo cargo</h5>
                            
                          </div>
                          <div class="modal-body text-center">
                              <span><asp:Label Text="Nome: " runat="server" /><asp:TextBox Id="txtCargo" runat="server" /></span>
                          </div>
                          <div class="modal-footer">
                            <asp:button Id="btnSalvarCargo" class="btn btn-primary" data-bs-dismiss="none" Text="Salvar" runat="server" OnClick="btnSalvarCargo_Click"/>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                        <div class="modal fade" id="modalColaborador" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalColaboradorlabel">Cadastrar novo colaborador</h5>
                                    </div>
                                    <div class="modal-body container">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="p-1 m-1"><asp:Label Text="NOME" runat="server" /></div>
                                                <div class="p-1 m-1"><asp:Label Text="CPF" runat="server" /></div>
                                                <div class="p-1 m-1"><asp:Label Text="RG" runat="server" /></div>
                                                <div class="p-1 m-1"><asp:Label Text="CARGO" runat="server" /></div>
                                            </div>
                                            <div class="col-6">
                                                <div class="p-1"><asp:TextBox Id="txtNomeColabordor" runat="server" /></div>
                                                <div class="p-1"><asp:TextBox Id="txtCpfColabordor" runat="server" /></div>
                                                <div class="p-1"><asp:TextBox Id="txtRgColabordor" runat="server" /></div>
                                                <div class="p-1"><asp:DropDownList Id="cboCargoColabordor" runat="server"></asp:DropDownList></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:button Id="btnSalvarColaborador" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" onclick="btnSalvarColaborador_Click" />
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                         <div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="modalEditarlabel">Editar Cadastro</h5>
                                    </div>
                                    <div class="modal-body container">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="p-1 m-1"><asp:Label Text="NOME" runat="server" /></div>
                                                <div class="p-1 m-1"><asp:Label Text="CPF" runat="server" /></div>
                                                <div class="p-1 m-1"><asp:Label Text="RG" runat="server" /></div>
                                                <div class="p-1 m-1"><asp:Label Text="CARGO" runat="server" /></div>
                                            </div>
                                            <div class="col-6">
                                                <div class="p-1"><asp:TextBox Id="txtNome" runat="server" /></div>
                                                <div class="p-1"><asp:TextBox Id="txtCpf" runat="server" /></div>
                                                <div class="p-1"><asp:TextBox Id="txtRg" runat="server" /></div>
                                                <div class="p-1"><asp:DropDownList Id="ddlCargo" runat="server"></asp:DropDownList></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <asp:button Id="btnEditar" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" onclick="btnEditar_Click" />
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                
                <div class="col-8"  style=" OVERFLOW: auto; HEIGHT:60vh; padding:1px;">
                    <asp:GridView ID="gridColaborador" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="1" GridLines="None" OnSelectedIndexChanged="gridColaborador_SelectedIndexChanged" DataKeyNames="ID,FK_CARGO,NOME,CPF,RG">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" HeaderText="Selecionar" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ID" HeaderText="Cód." Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="CARGO.NOME" HeaderText="Cargo" >
                            <HeaderStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NOME" HeaderText="Nome" >
                            <HeaderStyle Width="750px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CPF" HeaderText="CPF" >
                            <HeaderStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RG" HeaderText="RG" >
                            <HeaderStyle Width="150px" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" ForeColor="#003399" BorderColor="Black" />
                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                        <SortedDescendingHeaderStyle BackColor="#002876" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
