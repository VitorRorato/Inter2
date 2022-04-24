<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="colaborador.aspx.cs" Inherits="Inter.colaborador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="container-fluid">
            <div class="row p-5">
               
                <div class="col">

                    <div class="btn-group" role="group" aria-label="basic example">
                       <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCargo">Novo Cargo</button>
                       <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalColaborador">Novo Colaborador</button>
                    </div>

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
                            <asp:button Id="btnSalvarCargo" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" />
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
                                        <asp:button Id="btnSalvarColaborador" class="btn btn-primary" data-bs-dismiss="modal" Text="Salvar" runat="server" />
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Voltar</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </br>
                    </br>
                    
                    <div class="row">
                        <div class="col-2">
                            <div class="p-1 m-1"><asp:Label Text="NOME:" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="CPF:" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="RG:" runat="server" /></div>
                            <div class="p-1 m-1"><asp:Label Text="CARGO:" runat="server" /></div>
                        </div>

                        <div class="col">
                            <div class="p-1"><asp:TextBox runat="server" /></div>
                            <div class="p-1"><asp:TextBox runat="server" /></div>
                            <div class="p-1"> <asp:TextBox runat="server" /></div>
                            <div class="p-1"><asp:DropDownList runat="server"></asp:DropDownList></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                               <asp:Button CssClass="btn btn-primary botao" ID="btnSalvar" Text="Editar" runat="server" />
                               <asp:Button CssClass="btn btn-primary botao" ID="btnExcluir" Text="Excluir" runat="server" />
                        </div>

                    </div>
                </div>
                
                <div class="col-8">
                    <asp:GridView ID="gridColaborador" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="3px" CellPadding="4" CellSpacing="1" GridLines="None" OnSelectedIndexChanged="gridColaborador_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" >
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="200px" />
                            </asp:CommandField>
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

    </section>
</asp:Content>
