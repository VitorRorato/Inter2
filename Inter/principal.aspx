<%@ Page Title="" Language="C#" MasterPageFile="~/pagina.Master" AutoEventWireup="true" CodeBehind="principal.aspx.cs" Inherits="Inter.principal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="conteudo">
        <div class="container p-3">
            <div style="border:2px solid gray; border-radius:25px;"  class ="row">
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
                <div class="row">
                    <div class="col">
                        <div class="p-2 m-3">
                            <h5>ULTIMA MANUTENÇÃO REALIZADA</h5>
                        <div class="text-center">
                            <asp:GridView ID="gridManutencao" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="VEICULO.PREFIXO" HeaderText="Veiculo"></asp:BoundField>
                                <asp:BoundField DataField="KM_ATUAL" HeaderText="Km"></asp:BoundField>
                                <asp:BoundField DataField="KM_PROXIMA_TROCA" HeaderText="Prox. Manutenção"></asp:BoundField>
                                <asp:BoundField DataField="FILTRO_AR" HeaderText="Filtro AR"></asp:BoundField>
                                <asp:BoundField DataField="FILTRO_COMBUSTIVEL" HeaderText="Filtro Combustivel"></asp:BoundField>
                                <asp:BoundField DataField="FILTRO_RACOR" HeaderText="Filtro Racor"></asp:BoundField>
                                <asp:BoundField DataField="FILTRO_OLEO_MOTOR" HeaderText="Filtro Oleo Motor"></asp:BoundField>
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
