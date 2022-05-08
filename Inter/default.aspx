<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Inter._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
    <link href="estilo-login.css" rel="stylesheet" />
</head>
<body id="fundo">
    <form id="form1" runat="server">
        <div id="login">
            <div align="center">
                <img src="img/mundo.png" />
            </div>
            <div class="conteudo">
                <div class="centro distanciamento-top">
                    <div class="distanciamento-top">

                        <div>
                            <asp:Label ID="Label1" runat="server" CssClass="fonte" Text="Usuário"></asp:Label>
                        </div>
                    </div>
                    <div>
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="caixa fonte"></asp:TextBox>
                    </div>
                    <div>
                        <asp:RequiredFieldValidator ID="rfvNome" runat="server" ErrorMessage="Campo Necessario." ControlToValidate="txtUsuario" ValidationGroup="login" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="centro">
                    <div class="distanciamento-top">
                        <div>
                            <asp:Label ID="Label2" runat="server" CssClass="fonte" Text="Senha"></asp:Label>
                        </div>
                        <div>
                            <asp:TextBox ID="txtSenha" runat="server" Type="password" CssClass="fonte caixa"></asp:TextBox>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvSenha" runat="server" ErrorMessage="Campo Necessario." ControlToValidate="txtSenha" ValidationGroup="login" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                    <div class="distanciamento-top">
                        <div class="centro">
                             <asp:Button ID="btnEntrar" runat="server" Text="Entrar" CssClass="botao fonte" OnClick="btnEntrar_Click" ValidationGroup="login" /> 
                        </div>
                        <div class="centro">
                        </div>
                     </div>
                </div>
        </div>
    </form>
</body>
</html>
