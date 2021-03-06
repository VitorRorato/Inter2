<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="Inter.principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="container-fluid p-3">
            <div style="border:2px solid gray; border-radius:25px;"  class ="row">
                <div class="row text-center">
                    <div class="col p-2 m-2">
                        <div><asp:TextBox ID="txtCheck" cssclass="text-center" width="10%" placeholder="Checar" runat="server"></asp:TextBox> 
                        <asp:DropDownList ID="ddlVeiculo" runat="server"></asp:DropDownList>
                        <asp:Button ID="btnCheck" CssClass="btn btn-primary" Text="Checar" runat="server" OnClick="btnCheck_Click" /></div>
                    </div>
                </div>
                <div class="row text-center">
                    <div style="border:1px solid black; border-radius:12px;" class="offset-2 col-8">
                        <div class="">
                            <div><asp:Label ID="lblCheckCombustivel" Text="" runat="server" Font-size="20px" ForeColor="MediumBlue" /></div>
                            <div><asp:Label ID="lblCheckOleo" Text="" runat="server" Font-size="20px" ForeColor="MediumBlue" /></div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col">
                        <div class="p-2 m-3">
                        <h5>COMBUSTIVEL DISPONIVEL PARA ABASTECIMENTO</h5>
                            <div class="text-center">
                            <asp:GridView ID="gridCombustivel" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                            <asp:BoundField DataField="TANQUE.NOME" HeaderText="Tanque" />
                            <asp:BoundField DataField="QUANTIDADE" HeaderText="Disponivel (Lts)" />
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

                    <div class="col">
                        <div class="p-2 m-3">
                        <h5>ITENS EM FALTA</h5>
                        <div style="overflow:auto; height:15vh;" class="text-center">
                            <asp:GridView ID="gridEstoque" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="CODIGO" HeaderText="Item" />
                                    <asp:BoundField DataField="CATEGORIA.NOME" HeaderText="Categoria" />
                                    <asp:BoundField DataField="QUANTIDADE" HeaderText="Quantidade" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                        </div>
                        </div>
                    </div>
                </div>
                
                
                <div class="row">
                    <div class="col">
                        <div class="p-2 m-3">
                            <h5>ULTIMA MANUTENÇÃO REALIZADA</h5>
                        <div class="text-center">
                            <asp:GridView ID="gridManutencao" runat="server" CssClass="w-100" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="DATA" HeaderText="Data" DataFormatString="{0:dd/MM/yyyy}" ></asp:BoundField>
                                <asp:BoundField DataField="VEICULO.PREFIXO" HeaderText="Veiculo"></asp:BoundField>
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
                    </div>
                        </div>
                        
                </div>
            
                <div class="row">
                    <div class="col">
                        <div class="p-2 m-3">
                            <h5>ULTIMO ABASTECIMENTO</h5>
                        <div>
                         <asp:GridView CssClass="text-center" ID="gridAbastecimento" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                                <AlternatingRowStyle BackColor="#F7F7F7" />
                                <Columns>
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
                </div>
            </div>
        </div>
    </section>
</asp:Content>
