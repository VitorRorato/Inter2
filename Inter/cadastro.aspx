<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastro.aspx.cs" Inherits="Inter.cadastro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Cadastro</title>
    <link href="estilo-cadastro.css" rel="stylesheet" />
</head>
<body id="fundo">
    <form id="form1" runat="server">

        <div id="login" align="center">
            
            <div id="centro">
                <h2 align="center">Cadastro</h2> 
                </br>
                <div>
                    <div><asp:Label ID="Label1" runat="server" Text="CPF"></asp:Label></div>
                     <div><asp:TextBox ID="txtCpf" runat="server" CssClass="caixa"></asp:TextBox><asp:RequiredFieldValidator ID="rfvCpf" runat="server" ErrorMessage="*" ControlToValidate="txtCpf" ForeColor="Red" Font-Size="15pt" ValidationGroup="login"></asp:RequiredFieldValidator></div>
                </div>
                <div>
                    <div><asp:Label ID="Label2" runat="server" Text="Usuario"></asp:Label></div>
                     <div><asp:TextBox ID="txtUsuario" runat="server" CssClass="caixa"></asp:TextBox><asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ErrorMessage="*" ControlToValidate="txtUsuario" ForeColor="Red" Font-Size="15pt" ValidationGroup="login"></asp:RequiredFieldValidator></div>
                    
                </div>
                <div>
                    <div><asp:Label ID="Label3" runat="server" Text="Senha"></asp:Label></div>
                     <div><asp:TextBox ID="txtSenha" type="password" runat="server" CssClass="caixa"></asp:TextBox><asp:RequiredFieldValidator ID="rfvSenha1" runat="server" ErrorMessage="*" ControlToValidate="txtSenha" Font-Size="15pt" ForeColor="Red" ValidationGroup="login"></asp:RequiredFieldValidator></div>
                    
                </div>
                <div>
                    <div><asp:Label ID="Label4" runat="server" Text="Confirme sua senha"></asp:Label></div>
                     <div><asp:TextBox ID="txtConfirmaSenha" type="password" runat="server" CssClass="caixa"></asp:TextBox><asp:RequiredFieldValidator runat="server" ErrorMessage="*" ControlToValidate="txtConfirmaSenha" Font-Size="15pt" ForeColor="Red" ValidationGroup="login"></asp:RequiredFieldValidator></div>
                    <div><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="senhas não coincidem" ControlToValidate="txtConfirmaSenha" ControlToCompare="txtSenha" ForeColor="Red" ValidationGroup="login"></asp:CompareValidator></div>
                    
                </div>
                </br>
                <div align="center">
                    <span><asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="botao" OnClick="btnCadastrar_Click" ValidationGroup="login"/></span>
                    <span><asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="botao" OnClick="btnVoltar_Click"/></span>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
